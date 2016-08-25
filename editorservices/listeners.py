import os
import sublime
import sublime_plugin
from .logger import log
from .client import client
from .editor import editor
from .messages import *
from .model import *
from .utils import *

class PowerShellEventListener(sublime_plugin.EventListener):

    def __init__(self):
        self.awaitingCompletions = False
        self.pendingCompletions = []
        self.pendingCompletionsRanges = []
        self.completionStart = None
        self.sendFileChanges = True

    def on_new(self, view):
        log.debug("on_new event")

    def on_load(self, view):
        editor.file_opened(view)

    def on_close(self, view):
        editor.file_closed(view)

    def on_text_command(self, view, command_name, args):
        log.debug("on_text_command %s: %s", command_name, args)

        if is_ps_file(view) and command_name in ["commit_completion", "insert_best_completion"]:
            self.sendFileChanges = False
            log.debug("Completion start: %s", view.rowcol(self.completionStart.begin()))

    def on_modified(self, view):
        # NOTE: This method may not capture all changes to file contents,
        # especially around undo/redo.  Need to pay close attention to the
        # different scenarios.
        log.debug("on_modified")

        if self.sendFileChanges:
            editor.file_changed(view)

    def on_post_text_command(self, view, command_name, args):
        log.debug("on_post_text_command %s: %s", command_name, args)

        if is_ps_file(view) and command_name in ["commit_completion", "insert_best_completion"]:
            completionEnd = view.sel()[0]
            insertedText = view.substr(sublime.Region(self.completionStart.begin(), completionEnd.begin()))

            foundCompletion = None
            foundCompletionIndex = -1
            for i, completion in enumerate(self.pendingCompletions):
                #log.debug("Checking completion '%s' against insert '%s'", completion[1], insertedText)
                if completion[1].endswith(insertedText):
                    #log.debug("Found the completion: %s", completion[1])
                    foundCompletion = completion
                    foundCompletionIndex = i 
                    break

            log.debug("COMPLETION WAS '%s', ORIGINAL INSERT '%s'", insertedText, foundCompletion[1])

            # If a matching completion is found, perform the specified edit
            if foundCompletion:
                # Remove the inserted string
                view.run_command("powershell_replace_completion", { 
                    "insertText": "", 
                    "replaceRegion": (self.completionStart.begin(), completionEnd.begin())
                })

                # Insert the real completion
                self.sendFileChanges = True
                view.run_command("powershell_insert_text", {
                    "insertText": foundCompletion[1],
                    "insertRange": self.pendingCompletionsRanges[foundCompletionIndex]
                })

            self.completionStart = None
            self.pendingCompletions = []
            self.pendingCompletionsRanges = []

    def on_query_completions(self, view, prefix, locations):
        log.debug("on_query_completions: '%s' (awaiting: %s)", prefix, self.awaitingCompletions)
        completionsList = []
        if self.awaitingCompletions:
            # This should be the second invocation after results have come back
            self.awaitingCompletions = False
            completionsList = self.pendingCompletions
        else:
            # Request completions from the language server
            self.awaitingCompletions = True
            self.completionStart = view.sel()[0]
            editor.get_completions(view, view.rowcol(locations[0]), self._handle_completions_result)

        return completionsList, sublime.INHIBIT_WORD_COMPLETIONS | sublime.INHIBIT_EXPLICIT_COMPLETIONS

    def _handle_completions_result(self, view, completions):
        log.debug("Completion handler called!  Count: " + str(len(completions)))
        if self.awaitingCompletions and len(completions) > 0:
            # Hide the current auto-complete list and invoke it
            # again to show the list of pending completions
            self.pendingCompletionsRanges = [completion["textEdit"]["range"] for completion in completions]
            self.pendingCompletions = [(self._get_completion_label(completion), completion["insertText"]) for completion in completions]
            view.run_command('hide_auto_complete')
            view.run_command("auto_complete", {
                'disable_auto_insert': True,
                'api_completions_only': True,
                'next_completion_if_showing': False,
                'auto_complete_commit_on_tab': True,
            })

    def _get_completion_label(self, completion):
        kind = completion["kind"]
        kindName = ""
        if kind == 1:
            kindName = "text"
        elif kind == 2:
            kindName = "method"
        elif kind == 3:
            kindName = "cmdlet"
        elif kind == 6:
            kindName = "variable"
        elif kind == 12:
            kindName = "value"
        elif kind == 13:
            kindName = "enum"
        elif kind == 14:
            kindName = "keyword"
        elif kind == 17:
            kindName = "file"

        return completion["label"] + "\t" + kindName

    def on_window_command(self, window, command_name, args):
        if command_name == "exit":
            log.info("Stopping client and exiting...")
            client.stop()
        elif command_name in ["close_all", "close_window", "close_project"]:
            log.info("Stopping client and exiting...")
            client.stop()

        return None

    def on_close(self, view):
        # Do any cleanup behavior when view is closed
        on_view_closed(view)

    def on_hover(self, view, point, hover_zone):
        log.debug("on_hover: %s", hover_zone)
        if hover_zone == sublime.HOVER_TEXT:
            editor.show_hover_tooltip(view, point)
