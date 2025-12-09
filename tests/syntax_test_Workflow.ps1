# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

"<- Exit the imports context block"

    workflow w1 {}
#^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^ entity.name.function.powershell
#            @@ definition
#               ^ punctuation.section.block.begin.powershell
#                ^ punctuation.section.block.end.powershell
    Workflow work { sequence {} }
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^^^ entity.name.function.powershell
#            @@@@ definition
#                 ^ punctuation.section.block.begin.powershell
#                   ^^^^^^^^^^^ meta.block.powershell
#                   ^^^^^^^^ keyword.control.flow.powershell
#                            ^ punctuation.section.block.begin.powershell
#                             ^ punctuation.section.block.end.powershell
#                               ^ punctuation.section.block.end.powershell

    workflow Test-Workflow {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^^^^^^^^^^^^ entity.name.function.powershell
#            @@@@@@@@@@@@@ definition
#                          ^ punctuation.section.block.begin.powershell
        parallel {
#^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^^^^^ keyword.control.flow.powershell
#                ^ punctuation.section.block.begin.powershell
            Get-Process
#           @@@@@@@@@@@ reference
            Get-Service
#^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#           @@@@@@@@@@@ reference
        }
    }


    workflow Test-Workflow {
#            @@@@@@@@@@@@@ definition
        $a = 3
#^^^^^^^^^^^^^ meta.function.powershell
#       ^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#          ^ keyword.operator.assignment.powershell
#            ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell

        ## Without $Using, the $a workflow variable isn't visible
        ## in inline script.
        inlinescript {"Inline A0 = $a"}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^^^^^^^^^ keyword.control.context.powershell
#                    ^ punctuation.section.block.begin.powershell
#                     ^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#                     ^^^^^^^^^^^^^ string.quoted.double.powershell
#                     ^ punctuation.definition.string.begin.powershell
#                                  ^^ meta.interpolation.powershell variable.other.readwrite.powershell
#                                  ^ punctuation.definition.variable.powershell
#                                    ^ string.quoted.double.powershell punctuation.definition.string.end.powershell
#                                     ^ punctuation.section.block.end.powershell

        ## $Using imports the variable and its current value.
        inlinescript {"Inline A1 = $Using:a"}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#       ^^^^^^^^^^^^ keyword.control.context.powershell
#                    ^ punctuation.section.block.begin.powershell
#                     ^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#                     ^^^^^^^^^^^^^ string.quoted.double.powershell
#                     ^ punctuation.definition.string.begin.powershell
#                                  ^^^^^^^^ meta.interpolation.powershell variable.other.readwrite.powershell
#                                  ^ punctuation.definition.variable.powershell
#                                   ^^^^^ storage.modifier.scope.powershell
#                                        ^ punctuation.accessor.colon.powershell
#                                          ^ string.quoted.double.powershell punctuation.definition.string.end.powershell
#                                           ^ punctuation.section.block.end.powershell
    }
    Test-Workflow
#   @@@@@@@@@@@@@ reference


    workflow Test-Workflow {
#            @@@@@@@@@@@@@ definition
        $a = 3

        ##  Changes to the inlinescript variable value don't
        ##  change the workflow variable.
        inlinescript {
            $a = $Using:a+1;
            "Inline A = $a"
        }
        "Workflow A = $a"

        ##  To change the variable in workflow scope, return the
        ##  new value.
        $a = inlinescript {$b = $Using:a+1; $b}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#          ^ keyword.operator.assignment.powershell
#            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#            ^^^^^^^^^^^^ keyword.control.context.powershell
#                         ^ punctuation.section.block.begin.powershell
#                          ^^ variable.other.readwrite.powershell
#                          ^ punctuation.definition.variable.powershell
#                             ^ keyword.operator.assignment.powershell
#                               ^^^^^^^^ variable.other.readwrite.powershell
#                               ^ punctuation.definition.variable.powershell
#                                ^^^^^ storage.modifier.scope.powershell
#                                     ^ punctuation.accessor.colon.powershell
#                                       ^ keyword.operator.unary.powershell
#                                        ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                         ^ punctuation.terminator.statement.powershell
#                                           ^^ variable.other.readwrite.powershell
#                                           ^ punctuation.definition.variable.powershell
#                                             ^ punctuation.section.block.end.powershell
        "Workflow New A = $a"
    }
    Test-Workflow
#   @@@@@@@@@@@@@ reference


    workflow Test-Workflow {
#            @@@@@@@@@@@@@ definition
        $ie = inlinescript {
            $ie = New-Object -ComObject InternetExplorer.Application -Property @{navigate2="www.microsoft.com"}
#                 @@@@@@@@@@ reference

            $ie.Visible = $true
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^ variable.other.readwrite.powershell
#           ^ punctuation.definition.variable.powershell
#              ^ punctuation.accessor.dot.powershell
#               ^^^^^^^ variable.other.member.powershell
#                       ^ keyword.operator.assignment.powershell
#                         ^^^^^ constant.language.boolean.true.powershell
#                         ^ punctuation.definition.variable.powershell
        }

        $ie
    }
    Test-Workflow
#   @@@@@@@@@@@@@ reference


    workflow Test-Workflow {
#            @@@@@@@@@@@@@ definition
        parallel {
            Get-Process
#           @@@@@@@@@@@ reference
            Get-Service
#^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#           ^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#           @@@@@@@@@@@ reference

            sequence {
#                    ^ meta.function.powershell meta.block.powershell meta.block.powershell punctuation.section.block.begin.powershell
                $Hotfix = Get-Content 'D:\HotFixes\Required.txt'
#                         @@@@@@@@@@@ reference
                foreach ($h in $Hotfix) {D:\Scripts\Verify-Hotfix.ps1 -Hotfix $h}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.powershell meta.block.powershell
#               ^^^^^^^ keyword.control.loop.for.powershell
#                       ^^^^^^^^^^^^^^^ meta.group.powershell
#                       ^ punctuation.section.group.begin.powershell
#                        ^^ variable.other.readwrite.powershell
#                        ^ punctuation.definition.variable.powershell
#                           ^^ keyword.control.loop.in.powershell
#                              ^^^^^^^ variable.other.readwrite.powershell
#                              ^ punctuation.definition.variable.powershell
#                                     ^ punctuation.section.group.end.powershell
#                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#                                       ^ punctuation.section.braces.begin.powershell
#                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@ reference
#                                                                     ^^^^^^^ variable.parameter.option.powershell
#                                                                     ^ punctuation.definition.parameter.powershell
#                                                                             ^^ variable.other.readwrite.powershell
#                                                                             ^ punctuation.definition.variable.powershell
#                                                                               ^ punctuation.section.braces.end.powershell
            }
        }
    }
