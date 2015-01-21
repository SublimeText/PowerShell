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

    def testGetLowerTokens(self):
        def escaped_lower(i, line):
            should = not (i > 0 and line[i-1] == '`')
            if (should):
                return line[i].lower()
            else:
                return line[i]

        with open(self.test_path) as f:
            content = f.readlines()
            for line in content:
                # escaped chars (like `n) are case-sensitive, don't upper them
                line_low = ''.join([escaped_lower(i, line) for i in range(len(line))])
                self.append(line_low)
        self.writeTokensToFile(self.getTokens(), "test-file.ps1.lower.tokens")

    def testGetUpperTokens(self):
        
        def escaped_upper(i, line):
            should = not (i > 0 and line[i-1] == '`')
            if (should):
                return line[i].upper()
            else:
                return line[i]

        with open(self.test_path) as f:
            content = f.readlines()
            for line in content:
                # escaped chars (like `n) are case-sensitive, don't upper them
                line_up = ''.join([escaped_upper(i, line) for i in range(len(line))])
                self.append(line_up)
        self.writeTokensToFile(self.getTokens(), "test-file.ps1.upper.tokens")
        