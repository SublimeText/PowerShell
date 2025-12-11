# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

"<- Exit the imports context block"

    Configuration MyDscConfiguration {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^^^^^^ keyword.declaration.function.powershell
#                 ^^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#                                    ^ punctuation.section.block.begin.powershell
        Node "TEST-PC1" {
#^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^ keyword.context.block.powershell
#            ^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#            ^ punctuation.definition.string.begin.powershell
#                     ^ punctuation.definition.string.end.powershell
#                       ^ punctuation.section.block.begin.powershell
            WindowsFeature MyFeatureInstance {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^^^^^^^^^^^^ keyword.other.powershell
#                          ^^^^^^^^^^^^^^^^^ entity.name.label.powershell
#                                            ^ meta.block.powershell punctuation.section.braces.begin.powershell
                Ensure = 'Present'
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.powershell
#                      ^ keyword.operator.assignment.powershell
#                        ^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                        ^ punctuation.definition.string.begin.powershell
#                                ^ punctuation.definition.string.end.powershell
                Name = 'RSAT'
            }
            WindowsFeature My2ndFeatureInstance {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^^^^^^^^^^^^ keyword.other.powershell
#                          ^^^^^^^^^^^^^^^^^^^^ entity.name.label.powershell
#                                               ^ meta.block.powershell punctuation.section.braces.begin.powershell
                Ensure = 'Present'
                Name = 'Bitlocker'
            }
#^^^^^^^^^^^^ meta.function.powershell meta.block.powershell
#           ^ punctuation.section.braces.end.powershell
        }
    }
    MyDscConfiguration


    Configuration MyDscConfiguration
    {
        param
#^^^^^^^^^^^^ meta.function.powershell
#       ^^^^^ keyword.declaration.parameter.powershell
        (
            [string[]]$ComputerName='localhost'
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^ punctuation.section.brackets.begin.powershell
#            ^^^^^^ storage.type.powershell
#                  ^ punctuation.section.brackets.begin.powershell
#                   ^^ punctuation.section.brackets.end.powershell
#                     ^^^^^^^^^^^^^ variable.other.readwrite.powershell
#                     ^ punctuation.definition.variable.powershell
#                                  ^ keyword.operator.assignment.powershell
#                                   ^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                   ^ punctuation.definition.string.begin.powershell
#                                             ^ punctuation.definition.string.end.powershell
        )

        Node $ComputerName
        {
            WindowsFeature MyFeatureInstance
            {
                Ensure = 'Present'
                Name = 'RSAT'
            }

            WindowsFeature My2ndFeatureInstance
            {
                Ensure = 'Present'
                Name = 'Bitlocker'
            }
        }
    }
    MyDscConfiguration


    Configuration MyDscConfiguration
    {
        Node @('localhost', 'Server01')
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^ keyword.context.block.powershell
#            ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.array-expression.powershell
#            ^ keyword.other.array.begin.powershell
#             ^ punctuation.section.group.begin.powershell
#              ^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#              ^ punctuation.definition.string.begin.powershell
#                        ^ punctuation.definition.string.end.powershell
#                         ^ punctuation.separator.sequence.powershell
#                           ^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                           ^ punctuation.definition.string.begin.powershell
#                                    ^ punctuation.definition.string.end.powershell
#                                     ^ punctuation.section.group.end.powershell
        {
            WindowsFeature MyFeatureInstance
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^^^^^^^^^^^^ keyword.other.powershell
#                          ^^^^^^^^^^^^^^^^^ entity.name.label.powershell
            {
                Ensure = 'Present'
                Name = 'RSAT'
            }

            WindowsFeature My2ndFeatureInstance
            {
                Ensure = 'Present'
                Name = 'Bitlocker'
            }
        }
    }
    MyDscConfiguration
