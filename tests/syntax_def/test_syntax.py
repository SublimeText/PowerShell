from PowerShell.tests import PowerShellSyntaxTest


class Test_DoubleQuoted_HereDocStrings(PowerShellSyntaxTest):
    def testIsScopeCorrectIfDelimiterAtBOL(self):
        self.append("""@"
hello
"@
""")
        sname = self.getFinestScopeNameAtRowCol(1, 1)
        self.assertEqual(sname, 'string.quoted.double.heredoc.powershell')

    def testIsScopeCorrectIfDelimiterNotAtBOL(self):
        self.append("""$foo = @"
hello
"@
""")
        sname = self.getFinestScopeNameAtRowCol(1, 1)
        self.assertEqual(sname, 'string.quoted.double.heredoc.powershell')


class Test_SingleQuoted_HereDocStrings(PowerShellSyntaxTest):
    def testIsScopeCorrectIfDelimiterAtBOL(self):
        self.append("""@'
hello
'@
""")
        sname = self.getFinestScopeNameAtRowCol(1, 1)
        self.assertEqual(sname, 'string.quoted.single.heredoc.powershell')

    def testIsScopeCorrectIfDelimiterNotAtBOL(self):
        self.append("""$foo = @'
hello
'@
""")
        sname = self.getFinestScopeNameAtRowCol(1, 1)
        self.assertEqual(sname, 'string.quoted.single.heredoc.powershell')
