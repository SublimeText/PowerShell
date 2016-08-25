class Position:
    def __init__(self):
        self.Line = -1
        self.Character = -1

    def to_dict(self):
        return {
            "line": self.Line,
            "character": self.Character
        }

    @classmethod
    def from_rowcol(cls, rowcol):
        pos = cls()
        pos.Line = rowcol[0]
        pos.Character = rowcol[1]
        return pos

    @classmethod
    def from_dict(cls, params):
        pos = cls()
        pos.Line = params.get("line", -1)
        pos.Character = params.get("character", -1)
        return pos

class Range:
    def __init__(self):
        self.Start = Position()
        self.End = Position()

    def to_dict(self):
        return {
            "start": self.Start.to_dict(),
            "end": self.End.to_dict()
        }

    @classmethod
    def from_positions(cls, startPosition, endPosition):
        range = cls()
        range.Start = startPosition
        range.End = endPosition
        return range

    @classmethod
    def from_dict(cls, params):
        range = cls()
        range.Start = Position.from_dict(params.get("start", {}))
        range.End = Position.from_dict(params.get("end", {}))
        return range