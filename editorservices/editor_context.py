import sublime
from .client import client
from .logger import log
from .messages import *
from .utils import *
from .model import Position, Range

class EditorContext:
    def __init__(self, view):
        cursorPos = view.rowcol(view.sel()[0].begin())
        selectStart = view.rowcol(view.sel()[0].begin())
        selectEnd = view.rowcol(view.sel()[0].end())

        #log.debug("CURSOR - x: %d / y: %d", cursorPos[0], cursorPos[1])
        #log.debug("SELECTEND - x: %d / y: %d", selectEnd[0], selectEnd[1])

        self.CurrentFilePath = view.file_name()
        self.CursorPosition = Position.from_rowcol(cursorPos)
        self.SelectionRange = Range.from_positions(
            self.CursorPosition,
            Position.from_rowcol(selectEnd))