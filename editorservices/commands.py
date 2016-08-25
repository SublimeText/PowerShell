import sublime_plugin
from .client import client
from .editor import editor
from .logger import log
from .messages import *
from .utils import *
from .editor_context import EditorContext

class PowershellRunSelectionCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        selectedText = self.view.substr(self.view.sel()[0])
        log.debug("RUN SELECTION: %s", selectedText)
        view = get_output_view()
        view.window().focus_view(view)
        client.sendRequest(EvaluateRequest(selectedText), None)

class PowershellWriteOutputCommand(sublime_plugin.TextCommand):
    def run(self, edit, outputText):
        view = get_output_view()
        log.debug("Got output view %d, writing output", view.id())
        view.set_read_only(False)
        view.insert(edit, view.size(), outputText)
        view.set_read_only(True)
        view.show(view.size())

class PowershellShowErrors(sublime_plugin.TextCommand):
    def run(self, edit):
        pass

class PowershellShowCurrentError(sublime_plugin.TextCommand):
    def run(self, edit):
        editor.show_error_popup(self.view)
        
_extensionCommands = []

class PowershellAddCommandCommand(sublime_plugin.ApplicationCommand):
    def run(self, command):
        global _extensionCommands
        _extensionCommands.append(command)

class PowershellShowCommandsCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        global _extensionCommands
        if len(_extensionCommands) > 0:
            self.view.window().show_quick_panel(
                [c["displayName"] for c in _extensionCommands],
                self.on_done)
        else:
            sublime.message_dialog("No commands registered.")

    def on_done(self, index):
        if index >= 0:
            log.debug("SELECTED COMMAND: %d", index)
            client.sendRequest(
                InvokeExtensionCommandRequest(
                    _extensionCommands[index]["name"],
                    EditorContext(self.view)),
                None)

class PowershellReplaceCompletionCommand(sublime_plugin.TextCommand):
    def run(self, edit, insertText, replaceRegion):
        self.view.replace(edit, sublime.Region(replaceRegion[0], replaceRegion[1]), insertText)

class PowershellInsertTextCommand(sublime_plugin.TextCommand):
    def run(self, edit, insertText, insertRange):
        startPoint = self.view.text_point(
            insertRange["start"]["line"],
            insertRange["start"]["character"])
        endPoint = self.view.text_point(
            insertRange["end"]["line"],
            insertRange["end"]["character"])
        replaceRegion = sublime.Region(startPoint, endPoint)

        self.view.replace(edit, replaceRegion, insertText)