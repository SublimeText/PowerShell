import os
import sublime
import json

from PowerShell.tests.py import PowerShellSyntaxTokenTest

class Test_TokenGenerator(PowerShellSyntaxTokenTest):
    
    def setUp(self):
        super().setUp()
        self.test_path = os.path.join(sublime.packages_path(), 'PowerShell', 'tests', 'samples', 'test-file.ps1')

    def testGetTokens(self):

        with open(self.test_path) as f:
            content = f.readlines()
            for line in content:
                self.append(line)

        self.writeTokensToFile(self.getTokens(), "test-file.ps1.tokens")
        