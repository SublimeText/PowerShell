import os
import sublime
import csv

from PowerShell.tests import PowerShellSyntaxTokenTest

class Test_TokenGenerator(PowerShellSyntaxTokenTest):
    def testGetTokens(self):

        self.append("""$foo = @'
hello
'@
""")
        tokens = self.getTokens()
        
        outputdir = os.path.join(sublime.packages_path(), 'User', 'UnitTesting', "tokens")
        if not os.path.isdir(outputdir):
            os.makedirs(outputdir)
        outfile = os.path.join(outputdir, "PowerShell_tokens")

        if os.path.exists(outfile):
            os.remove(outfile)
        with open(outfile, 'w') as f:
            header = self.getTokenHeader()
            writer = csv.DictWriter(f, header, delimiter=',')
            writer.writeheader()
            writer.writerows(tokens)
    

