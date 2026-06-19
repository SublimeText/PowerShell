# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

    [CmdletBinding(PositionalBinding=$false)]
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                   ^ keyword.operator.assignment.powershell
#                                    ^^^^^^ constant.language.boolean.false.powershell
#                                    ^ punctuation.definition.variable.powershell
#                                          ^ punctuation.section.group.end.powershell
#                                           ^ punctuation.section.brackets.end.powershell
    param(
#   ^^^^^ keyword.declaration.parameter.powershell
#        ^^ meta.block.parameters.powershell
#        ^ punctuation.section.block.begin.powershell
        [Parameter(Mandatory=$true)]
        [string]$base,

        [Parameter(Mandatory=$true)]
        [string]$head
    )

    Set-StrictMode -version 2.0
    $ErrorActionPreference="Stop"

    [CmdletBinding(PositionalBinding=$false)]
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ - meta.attribute - meta.annotation
