from .protocol import write_message, read_message, MessageType
from .messages import InitializeRequest
from .logger import log
import io
import json
import os
import socket
import sublime
import subprocess
import sys
import tempfile
import threading
import time
from queue import Queue, Empty

class LanguageServerClient:
    __isRunning = False

    def start(self, powerShellPath, editorServicesModulePath, requiredEditorServicesVersion, waitForDebugger=False):
        self._editorServicesModulePath = editorServicesModulePath
        self.messageId = 0

        # Find the path to the startup script
        startScriptPath = os.path.dirname(os.path.realpath(__file__)) + "/Start-EditorServices.ps1"

        logFileName = str(int(time.time())) + "-EditorServices.log"
        logPath = os.path.join(tempfile.gettempdir(), logFileName)
        log.debug("PowerShell Editor Services log path: %s", logPath)

        scriptArgs = \
            '-EditorServicesVersion "' + requiredEditorServicesVersion + '" ' + \
            '-HostName "Sublime Text Host" ' + \
            '-HostProfileId "SublimeText" ' + \
            '-HostVersion "3.0.' + sublime.version() + '" ' + \
            '-LogLevel "Verbose" ' + \
            '-LogPath "' + logPath + '" '

        # TEMPORARY: Set a default bundled module path
        if not editorServicesModulePath:
            editorServicesModulePath = \
                os.path.join(
                    os.path.dirname(os.path.realpath(__file__)),
                    "modules")
        
        log.debug("Using bundled modules path: %s", editorServicesModulePath)
        scriptArgs += '-BundledModulesPath "' + editorServicesModulePath + '"'

        if waitForDebugger:
            scriptArgs += "-WaitForDebugger"

        isPosix = True
        if powerShellPath == None:
            # Pick default PowerShell path based on platform
            if sys.platform == 'win32':
                isPosix = False
                powerShellPath = "powershell.exe"
            elif sys.platform == 'linux':
                powerShellPath = "/usr/bin/powershell"
            elif sys.platform == 'darwin':
                powerShellPath = "/usr/local/bin/powershell"
            else:
                log.debug("ERROR: Unknown platform!")

        args = [
            powerShellPath,
            '-NoProfile',
            '-NonInteractive',
        ]

        # Non-Windows platforms don't have ExecutionPolicy
        if sys.platform == 'win32':
            args.append('-ExecutionPolicy')
            args.append('Unrestricted')

        # -Command should be the last argument
        commandArg = "& \"{!s}\" {!s}".format(startScriptPath, scriptArgs)
        log.debug("Command parameter arg: %s", commandArg)        
        args.append('-Command')
        args.append(commandArg)

        startupinfo = None

        if os.name == "nt":
            # Hide the console on startup
            startupinfo = subprocess.STARTUPINFO()
            startupinfo.dwFlags |= subprocess.SW_HIDE | subprocess.STARTF_USESHOWWINDOW

        self.languageServerProcess = subprocess.Popen(
            args,
            bufsize=io.DEFAULT_BUFFER_SIZE,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            startupinfo=startupinfo,
            universal_newlines=False,
            close_fds=isPosix)

        # Start a new thread for reading stderr in a non-blocking way
        self.stderrThread = threading.Thread(
            target=LanguageServerClient.__readStderr,
            args=(self.languageServerProcess.stderr,))
        self.stderrThread.daemon = True
        self.stderrThread.start()

        # Wait briefly to see if any launch errors occur
        # TODO: Use a queue for this

        # Gather the launch response
        response = self.languageServerProcess.stdout.readline();
        log.debug("Launch response: %s", response)       
        responseObject = json.loads(response.decode('utf-8'))
        log.debug("Server started, languageServicePort: %d", responseObject["languageServicePort"])

        # Was an error written to stderr upon startup?
        # loopCount = 0
        # errorString = ""
        # while True:
        #     if loopCount > 8:
        #          break
        #     loopCount += 1

        #     errorLine = self.languageServerProcess.stderr.readline();
        #     log.debug("Error: %s", errorLine)
        #     if errorLine == "":
        #         if len(errorString) > 0:
        #             log.debug("Error when launching powershell.exe:")
        #             log.debug("%s", errorLine)
        #             return
        #         else:
        #             break
        #     #else:
        #     #    log.debug("Error string: %s", errorLine)
        #         #errorString += errorLine

        # Connect to the socket
        self.languageServiceSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.languageServiceSocket.connect(('localhost', responseObject["languageServicePort"]))
        self.socketIn = self.languageServiceSocket.makefile('wb')
        self.socketOut = self.languageServiceSocket.makefile('rb')

        log.debug("Connected to language service!")

        self.requestCallbacks = {}
        self.requestHandlers = {}
        self.eventHandlers = {}

        # Start a new thread for the message loop
        LanguageServerClient.__isRunning = True
        self.readerThread = threading.Thread(
           target=LanguageServerClient.__messageLoop,
           args=(self.socketIn, self.socketOut, self.requestCallbacks, self.requestHandlers, self.eventHandlers))
        self.readerThread.daemon = True
        self.readerThread.start()

        # Send the Initialize message
        self.sendRequest(InitializeRequest(""), self.__handleInitializeResponse)

    def stop(self):
        if LanguageServerClient.__isRunning:
            LanguageServerClient.__isRunning = False
            self.languageServerProcess.kill()
            self.languageServerProcess = None

    def sendRequest(self, request, callback):
        self.messageId = self.messageId + 1
        self.requestCallbacks[self.messageId] = callback
        write_message(request, self.messageId, self.socketIn)

    def sendResponse(self, requestId, responseBody):
        write_message(responseBody, requestId, self.socketIn)

    def sendEvent(self, event):
        write_message(event, 0, self.socketIn)

    def setRequestHandler(self, requestType, requestHandler):
        log.debug("Attempting to set request handler...")

        # Is the type a request?
        if hasattr(requestType, "__type") and \
            hasattr(requestType, "__method") and \
            getattr(requestType, "__type") == MessageType.Request:

            def _handler(requestId, params):
                # Create an instance of the event type and pass its params
                responseBody = requestHandler(requestType(params))
                self.sendResponse(requestId, responseBody)

            methodName = getattr(requestType, "__method")
            self.requestHandlers[methodName] = _handler
            log.debug("Registered handler for request '%s'", methodName)

        else:
            log.error("Attempted to register handler for non-request type '%s'", requestType)

    def setEventHandler(self, eventType, eventHandler):
        log.debug("Attempting to set event handler...")

        # Is the type an event?
        if hasattr(eventType, "__type") and \
            hasattr(eventType, "__method") and \
            getattr(eventType, "__type") == MessageType.Event:

            def _handler(params):
                # Create an instance of the event type and pass its params
                eventHandler(eventType(params))

            methodName = getattr(eventType, "__method")
            self.eventHandlers[methodName] = _handler
            log.debug("Registered handler for event '%s'", methodName)

        else:
            log.error("Attempted to register handler for non-event type '%s'", eventType)

    def __handleInitializeResponse(self, response):
        log.debug("Client got initialize response!")
        #print response

    @staticmethod
    def __readStderr(stderr):
        log.debug("stderr reader started")
        for line in iter(stderr.readline, b''):
            log.error("STDERR: %s", line)
            #queue.put(line)
        stderr.close()

    @staticmethod
    def __messageLoop(stdIn, stdOut, requestCallbacks, requestHandlers, eventHandlers):
        while LanguageServerClient.__isRunning:
            message = read_message(stdOut)

            #print "GOT MESSAGE: " + str(message)

            messageId = int(message.get("id", "0"))
            method = message.get("method", None)

            if method:
                if messageId > 0:
                    # Handle the request
                    log.debug("Received request '%s'", method)
                    handler = requestHandlers.get(method)
                    if handler:
                        handler(messageId, message.get("params"))
                    else:
                        log.debug("No handler found for request '%s'", method)

                else:
                    # Handle the event
                    log.debug("Received event '%s'", method)
                    handler = eventHandlers.get(method)
                    if handler:
                        handler(message.get("params"))
                    else:
                        log.debug("No handler found for event '%s'", method)

            elif messageId > 0:
                if not method:
                    # Handle the response
                    responseCallback = requestCallbacks.get(messageId)
                    if responseCallback:
                        # TODO: Handle error
                        responseCallback(message.get("result", {}))
                        del requestCallbacks[messageId]
                elif method == "request":
                    # Received a request?  Error?
                    pass

            else:
                #print "Unexpected message contents!"
                #print message
                pass

    @staticmethod
    def setActiveClient(languageServerClient):
        client = languageServerClient

# Export a top-level client variable that is used by other modules
client = LanguageServerClient()
