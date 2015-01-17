import os
import sublime
import json

from PowerShell.tests import PowerShellSyntaxTokenTest

class Test_TokenGenerator(PowerShellSyntaxTokenTest):
    def testGetTokens(self):

        test_path = os.path.join(sublime.packages_path(), 'PowerShell', 'tests', 'samples', 'test-file.ps1')

        with open(test_path) as f:
            content = f.readlines()
            for line in content:
                self.append(line)

        tokens = self.getTokens()
        
        outputdir = os.path.join(sublime.packages_path(), 'User', 'UnitTesting', "tokens")
        if not os.path.isdir(outputdir):
            os.makedirs(outputdir)
        outfile = os.path.join(outputdir, "PowerShell_tokens")

        if os.path.exists(outfile):
            os.remove(outfile)
        with open(outfile, 'w') as f:
            f.write(json.dumps(tokens, indent=4, separators=(',', ': ')))
            f.write(test_path)
    
