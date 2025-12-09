# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

BeforeAll {
    # your function
    function Get-Planet ([string]$Name='*')
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^^^^^^^^^ entity.name.function.powershell
#                       ^ punctuation.section.parameters.begin.powershell
#                        ^ punctuation.section.brackets.begin.powershell
#                         ^^^^^^ storage.type.powershell
#                               ^ punctuation.section.brackets.end.powershell
#                                ^^^^^ variable.parameter.powershell
#                                ^ punctuation.definition.variable.begin.powershell
#                                     ^ keyword.operator.assignment.powershell
#                                      ^^^ meta.string.powershell string.quoted.single.powershell
#                                      ^ punctuation.definition.string.begin.powershell
#                                        ^ punctuation.definition.string.end.powershell
#                                         ^ punctuation.section.parameters.end.powershell
    {
        $planets = @(
            @{ Name = 'Mercury' }
            @{ Name = 'Venus'   }
            @{ Name = 'Earth'   }
            @{ Name = 'Mars'    }
            @{ Name = 'Jupiter' }
            @{ Name = 'Saturn'  }
            @{ Name = 'Uranus'  }
            @{ Name = 'Neptune' }
        ) | foreach { [PSCustomObject]$_ }

        $planets | where { $_.Name -like $Name }
    }
}

# Pester tests
Describe 'Get-Planet' {
  It "Given no parameters, it lists all 8 planets" {
    $allPlanets = Get-Planet
    $allPlanets.Count | Should -Be 8
  }

  Context "Filtering by Name" {
    It "Given valid -Name '<Filter>', it returns '<Expected>'" -TestCases @(
      @{ Filter = 'Earth'; Expected = 'Earth' }
      @{ Filter = 'ne*'  ; Expected = 'Neptune' }
      @{ Filter = 'ur*'  ; Expected = 'Uranus' }
      @{ Filter = 'm*'   ; Expected = 'Mercury', 'Mars' }
    ) {
      param ($Filter, $Expected)

      $planets = Get-Planet -Name $Filter
      $planets.Name | Should -Be $Expected
    }

    It "Given invalid parameter -Name 'Alpha Centauri', it returns `$null" {
      $planets = Get-Planet -Name 'Alpha Centauri'
      $planets | Should -Be $null
    }
  }
}
