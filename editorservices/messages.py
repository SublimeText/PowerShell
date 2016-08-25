from .protocol import request, event
from .model import Position, Range

# Request Types

@request("initialize")
class InitializeRequest:
    def __init__(self, rootPath):
        self.rootPath = rootPath
        self.capabilities = {}

@request("evaluate")
class EvaluateRequest:
    def __init__(self, expression):
        self.expression = expression
        self.context = "repl"

@request("textDocument/completion")
class CompletionRequest:
    def __init__(self, uri, position):
        self.uri = uri
        self.position = position

@request("powerShell/invokeExtensionCommand")
class InvokeExtensionCommandRequest:
    def __init__(self, commandName, editorContext):
        self.Name = commandName
        self.Context = editorContext

@request("editor/insertText")
class InsertTextRequest:
    def __init__(self, params):
        self.FilePath = params.get("filePath")
        self.InsertText = params.get("insertText")
        self.InsertRange = Range.from_dict(params.get("insertRange", {}))

# Event Types

@event("textDocument/didOpen")
class FileOpenedEvent:
    def __init__(self, uri, text):
        self.uri = uri
        self.text = text

@event("textDocument/didClose")
class FileClosedEvent:
    def __init__(self, uri):
        self.uri = uri

@event("textDocument/didChange")
class FileChangedEvent:
    def __init__(self, uri, region, text):
        self.uri = uri
        self.contentChanges = [
            {
                "range": {
                    "start": {
                        "line": region.Start.Line,
                        "character": region.Start.Character
                    },
                    "end": {
                        "line": region.End.Line,
                        "character": region.End.Character
                    }
                },
                "text": text
            }
        ]

@event("textDocument/publishDiagnostics")
class DiagnosticsEvent:
    def __init__(self, params):
        self.uri = params.get("uri")
        self.diagnostics = params.get("diagnostics", [])

@event("output")
class OutputEvent:
    def __init__(self, params):
        self.output = params.get("output")
        self.category = params.get("category")

@event("powerShell/extensionCommandAdded")
class ExtensionCommandAddedEvent:
    def __init__(self, params):
        self.name = params.get("name")
        self.displayName = params.get("displayName")
