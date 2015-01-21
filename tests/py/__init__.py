import unittest
import sublime
import os
import json

class ViewTest(unittest.TestCase):
    def setUp(self):
        self.view = sublime.active_window().new_file()

    def append(self, text):
        self.view.run_command('append', {'characters': text})

    def tearDown(self):
        self.view.set_scratch(True)
        self.view.close()


class SyntaxTest(ViewTest):
    def _setSyntax(self, rel_path):
        self.view.set_syntax_file(rel_path)

    def getScopeNameAt(self, pt):
        return self.view.scope_name(pt)

    def getFinestScopeNameAt(self, pt):
        return self.getScopeNameAt(pt).split()[-1]

    def getScopeNameAtRowCol(self, row, col):
        text_pt = self.view.text_point(row, col)
        return self.getScopeNameAt(text_pt)

    def getFinestScopeNameAtRowCol(self, row, col):
        return self.getScopeNameAtRowCol(row, col).split()[-1]

class PowerShellSyntaxTest(SyntaxTest):
    def setUp(self):
        super().setUp()
        self._setSyntax('Packages/PowerShell/Support/PowershellSyntax.tmLanguage')

class PowerShellSyntaxTokenTest(PowerShellSyntaxTest):

    def writeTokensToFile(self, tokens, name):
        outputdir = os.path.join(sublime.packages_path(), 'User', 'UnitTesting', "tokens")
        if not os.path.isdir(outputdir):
            os.makedirs(outputdir)
        outfile = os.path.join(outputdir, name)

        if os.path.exists(outfile):
            os.remove(outfile)
        with open(outfile, 'w') as f:
            f.write(json.dumps(tokens, indent=4, separators=(',', ': ')))

    def getTestFilePath(self):
        return os.path.join(sublime.packages_path(), 'PowerShell', 'tests', 'samples', 'test-file.ps1')

    def getTokens(self):
        selectors = [
            "comment.block.powershell", 
            "comment.documentation.embedded.powershell", 
            "comment.line.number-sign.powershell", 
            "constant.character.escape.powershell", 
            "constant.language.powershell", 
            "constant.numeric.hexadecimal.powershell", 
            "constant.numeric.scientific.powershell", 
            "constant.string.documentation.powershell", 
            "entity.name.function", 
            "entity.name.function ", 
            "entity.name.function.invocation.powershell", 
            "entity.name.tag", 
            "entity.other.attribute-name", 
            "entity.other.attribute-name ", 
            "entity.other.attribute-name.powershell", 
            "entity.other.attribute.parameter.powershell", 
            "interpolated.complex.source.powershell", 
            "interpolated.simple.source.powershell", 
            "keyword.control.powershell", 
            "keyword.operator.assignment.powershell", 
            "keyword.operator.bitwise.powershell", 
            "keyword.operator.comparison.powershell", 
            "keyword.operator.documentation.powershell", 
            "keyword.operator.logical.powershell", 
            "keyword.operator.math.powershell", 
            "keyword.operator.other.powershell", 
            "keyword.operator.range.powershell", 
            "keyword.operator.redirection.powershell", 
            "keyword.operator.string-format.powershell", 
            "keyword.operator.unary.powershell", 
            "keyword.other.powershell", 
            "keyword.other.statement-separator.powershell", 
            "meta.function", 
            "meta.group.array-expression.powershell", 
            "meta.group.complex.subexpression.powershell", 
            "meta.scriptblock.powershell", 
            "PowerShell", 
            "punctuation.end.definition.comment.block.powershell", 
            "punctuation.start.definition.comment.block.powershell", 
            "source.powershell", 
            "storage.modifier.scope.powershell", 
            "storage.type", 
            "storage.type.powershell", 
            "string.quoted.double.heredoc.powershell", 
            "string.quoted.double.powershell", 
            "string.quoted.single.heredoc.powershell", 
            "string.quoted.single.powershell", 
            "support.constant.automatic.powershell", 
            "support.constant.powershell", 
            "support.constant.variable.powershell", 
            "support.function.powershell", 
            "support.variable.automatic.powershell", 
            "support.variable.drive.powershell", 
            "variable.language.powershell", 
            "variable.other.normal.powershell", 
            "variable.other.powershell", 
            "variable.other.readwrite.powershell",
        ]
        tokens = []
        for selector in selectors:
            regions = self.view.find_by_selector(selector)
            for region in regions:
                tokens += [{ 'kind': selector, 'text': self.view.substr(region), 'startOffset': region.a, 'endOffset': region.b }]
        return tokens
