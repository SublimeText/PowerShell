<#

This Pester UT file consumes tokens generated by python unit test Test_TokenGenerator.testGetTokens .
You need to run python tests first to make it work.

#>

Describe "Syntax highlighting" {
    Context "bla" {
        It "test" {
            1 | Should be 1
        }
    }
}