import os
import sublime
from PowerShell.tests import SyntaxTokenTest

class Test_TokenGenerator(SyntaxTokenTest):
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
            for r in tokens:
                f.write('hi there\n') 
  
