# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace System.Management.Automation
#^^^^ keyword.control.import.powershell
#     ^^^^^^^^^ keyword.control.import.powershell
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.path.powershell
#                     ^ punctuation.accessor.dot.powershell
#                                ^ punctuation.accessor.dot.powershell

#Requires -PSSnapin DiskSnapin -Version 1.2
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^^ variable.parameter
#                              ^^^^^^^^ variable.parameter
#Requires -PSSnapin DiskSnapin
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^^ variable.parameter
#Requires -Version 3
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#Requires -Version 3.0
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#Requires -Version 3 -RunAsAdministrator
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                    ^^^^^^^^^^^^^^^^^^^ variable.parameter
#Requires -RunAsAdministrator
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^^ variable.parameter
#Requires -Modules PSWorkflow
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#Requires -Modules PSWorkflow -ThisIsInvalid
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                              ^^^^^^^^ - variable.parameter
#Requires -Modules PSWorkflow, ActiveDirectory
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                            ^ punctuation.separator
#Requires -Modules PSWorkflow,ActiveDirectory
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                            ^ punctuation.separator
#Requires -ShellId MyLocalShell
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#Requires -Modules PSWorkflow, @{ModuleName="PSScheduledJob"; ModuleVersion="1.0.0.0"}
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                            ^ punctuation.separator
#                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#                                ^^^^^^^^^^ meta.mapping.key string.unquoted
#                                          ^ punctuation.separator.key-value.powershell
#                                           ^^^^^^^^^^^^^^^^ string.quoted.double
#                                                           ^ punctuation.terminator.statement
#                                                             ^^^^^^^^^^^^^ meta.mapping.key string.unquoted
#                                                                          ^ punctuation.separator.key-value.powershell
#                                                                           ^^^^^^^^^ string.quoted.double

    :label1
#   ^^^^^^^ entity.name.label.powershell
#   ^ punctuation.definition.label.powershell

    throw "Do not run this file!"
#   ^^^^^ keyword.control.exception.raise.powershell
#         ^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#         ^ punctuation.definition.string.begin.powershell
#                               ^ punctuation.definition.string.end.powershell

    # Stop parsing
    & tool.exe /arg1 'value' /arg2 $value --% /arg3 $value /arg4 "value" # Comment
#   ^ keyword.operator.call.powershell
#     ^^^^^^^^ meta.function-call.powershell variable.function.powershell
#     @@@@@@@@ reference
#             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#              ^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                    ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                    ^ punctuation.definition.string.begin.powershell
#                          ^ punctuation.definition.string.end.powershell
#                            ^^^^^ variable.parameter.option.powershell
#                            ^ punctuation.definition.parameter.powershell
#                                  ^^^^^^ variable.other.readwrite.powershell
#                                  ^ punctuation.definition.variable.powershell
#                                         ^^^ keyword.control.powershell
#                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted.powershell

    & gnutool.exe -s 'short option' --long-option --very_long_option value +plus-option
#   ^ keyword.operator.call.powershell
#     ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#     @@@@@@@@@@@ reference
#                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                 ^^ variable.parameter.option.powershell
#                 ^ punctuation.definition.parameter.powershell
#                    ^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                    ^ punctuation.definition.string.begin.powershell
#                                 ^ punctuation.definition.string.end.powershell
#                                   ^^^^^^^^^^^^^ variable.parameter.option.powershell
#                                   ^^ punctuation.definition.parameter.powershell
#                                                 ^^^^^^^^^^^^^^^^^^ variable.parameter.option.powershell
#                                                 ^^ punctuation.definition.parameter.powershell
#                                                                    ^^^^^ string.unquoted.powershell
#                                                                          ^^^^^^^^^^^^ variable.parameter.option.powershell
#                                                                          ^ punctuation.definition.parameter.powershell

    $job = Get-Process -Name pwsh &
#   ^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#        ^ keyword.operator.assignment.powershell
#          ^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#          @@@@@@@@@@@ reference
#                     ^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                      ^^^^^ variable.parameter.option.powershell
#                      ^ punctuation.definition.parameter.powershell
#                            ^^^^ string.unquoted.powershell
#                                 ^ keyword.operator.background.powershell
    Receive-Job $job -Wait
#   ^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@ reference
#              ^^^^^^^^^^^ meta.function-call.arguments.powershell
#               ^^^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell
#                    ^^^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell

    # Constants
    $true
#   ^^^^^ constant.language.boolean.true.powershell
#   ^ punctuation.definition.variable.powershell
    $True
#   ^^^^^ constant.language.boolean.true.powershell
#   ^ punctuation.definition.variable.powershell
    $TRUE
#   ^^^^^ constant.language.boolean.true.powershell
#   ^ punctuation.definition.variable.powershell

    $false
#   ^^^^^^ constant.language.boolean.false.powershell
#   ^ punctuation.definition.variable.powershell
    $False
#   ^^^^^^ constant.language.boolean.false.powershell
#   ^ punctuation.definition.variable.powershell
    $FALSE
#   ^^^^^^ constant.language.boolean.false.powershell
#   ^ punctuation.definition.variable.powershell

    $null
#   ^^^^^ constant.language.null.powershell
#   ^ punctuation.definition.variable.powershell
    $Null
#   ^^^^^ constant.language.null.powershell
#   ^ punctuation.definition.variable.powershell
    $NULL
#   ^^^^^ constant.language.null.powershell
#   ^ punctuation.definition.variable.powershell

    # Automatic variables
    $_, $$, $^, $?
#   ^^ variable.language.powershell
#   ^ punctuation.definition.variable.powershell
#     ^ punctuation.separator.sequence.powershell
#       ^^ variable.language.powershell
#       ^ punctuation.definition.variable.powershell
#         ^ punctuation.separator.sequence.powershell
#           ^^ variable.language.powershell
#           ^ punctuation.definition.variable.powershell
#             ^ punctuation.separator.sequence.powershell
#               ^^ variable.language.powershell
#               ^ punctuation.definition.variable.powershell
    $args
#   ^^^^^ variable.language.powershell
#   ^ punctuation.definition.variable.powershell
    $error
#   ^^^^^^ variable.language.powershell
#   ^ punctuation.definition.variable.powershell
    $home
#   ^^^^^ support.constant.variable.powershell
#   ^ punctuation.definition.variable.powershell
    $foreach
#   ^^^^^^^^ variable.language.powershell
#   ^ punctuation.definition.variable.powershell


    # Normal variables
    $variable
#   ^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
    $script:variable
#   ^^^^^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^^^^^^ storage.modifier.scope.powershell
#          ^ punctuation.accessor.colon.powershell
    $ENV:ComputerName
#   ^^^^^^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^^^ support.variable.drive.powershell
#       ^ punctuation.accessor.colon.powershell
#   ^^^^^^^^^^^^^^^^^ variable.other.readwrite.powershell
    ${variable}
#   ^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ punctuation.section.interpolation.begin.powershell
#             ^ punctuation.section.interpolation.end.powershell
    ${vari-able}
#   ^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ punctuation.section.interpolation.begin.powershell
#              ^ punctuation.section.interpolation.end.powershell
    ${var`iable}
#   ^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ punctuation.section.interpolation.begin.powershell
#        ^^ constant.character.escape.powershell
#              ^ punctuation.section.interpolation.end.powershell
    ${variable`}}
#   ^^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ punctuation.section.interpolation.begin.powershell
#             ^^ constant.character.escape.powershell
#               ^ punctuation.section.interpolation.end.powershell
    ${script:variable}
#   ^^^^^^^^^^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ punctuation.section.interpolation.begin.powershell
#     ^^^^^^ storage.modifier.scope.powershell
#           ^ punctuation.accessor.colon.powershell
#                    ^ punctuation.section.interpolation.end.powershell


    # Variable properties should be highlighted
    $variable.Name
#   ^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#            ^ punctuation.accessor.dot.powershell
#             ^^^^ variable.other.member.powershell

    # Variable properties should be highlighted
    $variable.Name.Method( )
#   ^^^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#            ^ punctuation.accessor.dot.powershell
#             ^^^^ variable.other.member.powershell
#                 ^ punctuation.accessor.dot.powershell
#                  ^^^^^^ meta.function-call.powershell variable.function.powershell
#                  @@@@@@ reference
#                        ^^^ meta.function-call.arguments.powershell
#                        ^ punctuation.section.arguments.begin.powershell
#                          ^ punctuation.section.arguments.end.powershell

# Hashtable
$properties = @{
# <- punctuation.definition.variable
# ^ variable.other.readwrite
#           ^ keyword.operator.assignment
#             ^ keyword.other.hashtable.begin
#              ^ punctuation.section.braces.begin
    Name      = 'Name'
#^^^^^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#   ^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^^^^^ meta.string.powershell string.quoted.single.powershell
#               ^ punctuation.definition.string.begin.powershell
#                    ^ punctuation.definition.string.end.powershell
    Something = $else
#^^^^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#   ^^^^^^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^^^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell
    Number    = 16
#^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#   ^^^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
    from      = 'hello world'
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#   ^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#               ^ punctuation.definition.string.begin.powershell
#                           ^ punctuation.definition.string.end.powershell
    hash      = @{
#^^^^^^^^^^^^^^^^^ meta.hashtable.powershell
#   ^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^ meta.hashtable.powershell
#               ^ keyword.other.hashtable.begin.powershell
#                ^ punctuation.section.braces.begin.powershell
        hello = 'world'
#^^^^^^^^^^^^^^^^^^^^^^ meta.hashtable.powershell meta.hashtable.powershell
#       ^^^^^ meta.mapping.key.powershell string.unquoted.powershell
#             ^ punctuation.separator.key-value.powershell
#               ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#               ^ punctuation.definition.string.begin.powershell
#                     ^ punctuation.definition.string.end.powershell
    }
    # <- punctuation.section.braces.end
}
# <- punctuation.section.braces.end

function Invoke-Something {}
#        @@@@@@@@@@@@@@@@ definition

# Spatting
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function
#   @@@@@@@@@@@@@@@@ reference
#                    ^ punctuation.definition.variable
#                     ^ variable.other.readwrite

# ScriptBlock
    {Invoke-Something @properties}
#   ^ punctuation.section.braces.begin
#    ^^^^^^^^^^^^^^^^ support.function
#    @@@@@@@@@@@@@@@@ reference
#                     ^ punctuation.definition.variable
#                      ^ variable.other.readwrite
#                                ^ punctuation.section.braces.end
{
# <- punctuation.section.braces.begin
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function
#   @@@@@@@@@@@@@@@@ reference
#                    ^ punctuation.definition.variable
#                     ^ variable.other.readwrite
}
# <- punctuation.section.braces.end
$sb = {
# <- punctuation.definition.variable
# ^ variable.other.readwrite
#   ^ keyword.operator.assignment
#     ^ punctuation.section.braces.begin
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function
#   @@@@@@@@@@@@@@@@ reference
#                    ^ punctuation.definition.variable
#                     ^ variable.other.readwrite
}
# <- punctuation.section.braces.end

# Arrays
$a1 = @(1,2,3,4)
# <- variable.other.readwrite punctuation.definition.variable
#^^ variable.other.readwrite
#   ^ keyword.operator.assignment
#     ^ keyword.other.array.begin
#      ^ punctuation.section.group.begin
#              ^ punctuation.section.group.end
#       ^^^^^^^ meta.group.array-expression
#       ^ meta.number.integer.decimal constant.numeric.value
#        ^ punctuation.separator.sequence
#         ^ meta.number.integer.decimal constant.numeric.value
#          ^ punctuation.separator.sequence
#           ^ meta.number.integer.decimal constant.numeric.value
#            ^ punctuation.separator.sequence
#             ^ meta.number.integer.decimal constant.numeric.value
$a2 = ('one','two','three','four')
# <- variable.other.readwrite punctuation.definition.variable
#^^ variable.other.readwrite
#   ^ keyword.operator.assignment
#     ^ punctuation.section.group.begin
#      ^^^^^ string.quoted.single
#           ^ punctuation.separator.sequence
#            ^^^^^ string.quoted.single
#                 ^ punctuation.separator.sequence
#                  ^^^^^^^ string.quoted.single
#                         ^ punctuation.separator.sequence
#                          ^^^^^^ string.quoted.single
#                                ^ punctuation.section.group.end
$a3 = $one, $two, $three, $four
# <- variable.other.readwrite punctuation.definition.variable
#^^ variable.other.readwrite
#     ^ punctuation.definition.variable
#     ^^^^ variable.other.readwrite
#           ^ punctuation.definition.variable
#           ^^^^ variable.other.readwrite
#                 ^ punctuation.definition.variable
#                 ^^^^^^ variable.other.readwrite
#                         ^ punctuation.definition.variable
#                         ^^^^^ variable.other.readwrite
#   ^ keyword.operator.assignment
#         ^               punctuation.separator
#               ^         punctuation.separator
#                       ^ punctuation.separator
$a1[0]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.brackets.begin
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^ punctuation.section.brackets.end
#  ^^^ meta.brackets.indexer
$a2[-1]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.brackets.begin
#    ^ meta.number.integer.decimal constant.numeric.value
#     ^ punctuation.section.brackets.end
#  ^^^^ meta.brackets.indexer
$a3[1..2]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.brackets.begin
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^^ keyword.operator.range
#      ^ meta.number.integer.decimal constant.numeric.value
#       ^ punctuation.section.brackets.end
#  ^^^^^^ meta.brackets.indexer
    @(@($a))
#   ^ keyword.other.array.begin
#    ^ punctuation.section.group.begin
#     ^ keyword.other.array.begin
#      ^ punctuation.section.group.begin
#       ^ variable.other.readwrite punctuation.definition.variable
#       ^^ variable.other.readwrite
#         ^^ punctuation.section.group.end
    @(($i = 10); (++$j))
#   ^ keyword.other.array.begin
#    ^^ punctuation.section.group.begin
#      ^ variable.other.readwrite punctuation.definition.variable
#      ^^ variable.other.readwrite
#         ^ keyword.operator.assignment
#           ^^ meta.number.integer.decimal constant.numeric.value
#             ^ punctuation.section.group.end
#              ^ punctuation.terminator.statement
#                ^ punctuation.section.group.begin
#                 ^^ keyword.operator.assignment
#                   ^ variable.other.readwrite punctuation.definition.variable
#                    ^ variable.other.readwrite
#                     ^^ punctuation.section.group.end
    @($i = 10)
#   ^ keyword.other.array.begin
#    ^ punctuation.section.group.begin
#     ^ variable.other.readwrite punctuation.definition.variable
#     ^^ variable.other.readwrite
#        ^ keyword.operator.assignment
#          ^^ meta.number.integer.decimal constant.numeric.value
#            ^ punctuation.section.group.end
    $i[($y - 1) + $x]
#   ^ variable.other.readwrite punctuation.definition.variable
#   ^^ variable.other.readwrite
#     ^ punctuation.section.brackets.begin
#      ^ punctuation.section.group.begin
#       ^ variable.other.readwrite punctuation.definition.variable
#       ^^ variable.other.readwrite
#          ^ keyword.operator.arithmetic
#            ^ meta.number.integer.decimal constant.numeric.value
#             ^ punctuation.section.group.end
#               ^ keyword.operator.arithmetic
#                 ^ variable.other.readwrite punctuation.definition.variable
#                 ^^ variable.other.readwrite
#                   ^ punctuation.section.brackets.end
#     ^^^^^^^^^^^^^^^ meta.brackets.indexer

# Numeric constants

    -3 +3 3 3l 3lm 3lmb
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#      ^ keyword.operator.unary
#       ^ meta.number.integer.decimal constant.numeric.value
#         ^ meta.number.integer.decimal constant.numeric.value
#           ^ meta.number.integer.decimal constant.numeric.value
#            ^ meta.number.integer.decimal constant.numeric.suffix
#              ^^ meta.number.integer.decimal
#                ^ - constant.numeric
#                  ^^^^ meta.number.integer.decimal
#                  ^ constant.numeric.value
#                   ^^^ constant.numeric.suffix

    3y 3uy 3s 3us 3u 3ul  # PowerShell 6.2+
#   ^^ meta.number.integer.decimal
#   ^ constant.numeric.value
#    ^ constant.numeric.suffix
#      ^^^ meta.number.integer.decimal
#      ^ constant.numeric.value
#       ^^ constant.numeric.suffix
#          ^^ meta.number.integer.decimal
#          ^ constant.numeric.value
#           ^ constant.numeric.suffix
#             ^^^ meta.number.integer.decimal
#             ^ constant.numeric.value
#              ^^ constant.numeric.suffix
#                 ^^ meta.number.integer.decimal
#                 ^ constant.numeric.value
#                  ^ constant.numeric.suffix
#                    ^^^ meta.number.integer.decimal
#                    ^ constant.numeric.value
#                     ^^ constant.numeric.suffix

    3n  # PowerShell 7.0+
#   ^^ meta.number.integer.decimal
#   ^ constant.numeric.value
#    ^ constant.numeric.suffix

    .5
#   ^^ meta.number.float.decimal constant.numeric.value - constant constant
#   ^ punctuation.separator.decimal

    +.5
#   ^ keyword.operator.unary
#    ^^ meta.number.float.decimal constant.numeric.value - constant constant
#    ^ punctuation.separator.decimal

    # BUG: Don't mark the dot as a function
    1.
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^ - meta.number - constant.numeric

    1.f 1.f()
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^ punctuation.accessor.dot
#     ^ variable.other.member
#       ^ meta.number.integer.decimal constant.numeric.value
#        ^ punctuation.accessor.dot
#         @ reference
#         ^ meta.function-call variable.function
#          ^ meta.function-call.arguments punctuation.section.arguments.begin
#           ^ meta.function-call.arguments punctuation.section.arguments.end

    1.d
#   ^^^ meta.number.float.decimal - constant constant
#   ^^ constant.numeric.value
#    ^ punctuation.separator.decimal
#     ^ constant.numeric.suffix

    1.lGB
#   ^^^^^ meta.number.float.decimal
#   ^^ constant.numeric.value
#    ^ punctuation.separator.decimal
#     ^^^ constant.numeric.suffix

    1.dGB
#   ^^^^^ meta.number.float.decimal
#   ^^ constant.numeric.value
#    ^ punctuation.separator.decimal
#     ^^^ constant.numeric.suffix

    1.e+12d
#   ^^^^^^^ meta.number.float.decimal
#   ^^^^^^ constant.numeric.value
#    ^ punctuation.separator.decimal
#         ^ constant.numeric.suffix

    1e+12d
#   ^^^^^^ meta.number.float.decimal
#   ^^^^^ constant.numeric.value
#        ^ constant.numeric.suffix

    1.5
#   ^^^ meta.number.float.decimal constant.numeric.value
#    ^ punctuation.separator.decimal

    -1.5
#   ^ keyword.operator.unary
#    ^^^ meta.number.float.decimal constant.numeric.value
#     ^ punctuation.separator.decimal

    -3 + -2
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#      ^ keyword.operator.arithmetic
#        ^ keyword.operator.unary
#         ^ meta.number.integer.decimal constant.numeric.value

    -3+-2
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#     ^ keyword.operator.arithmetic
#      ^ keyword.operator.unary
#       ^ meta.number.integer.decimal constant.numeric.value

    3++2
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^ keyword.operator.arithmetic
#     ^ keyword.operator.unary
#      ^ meta.number.integer.decimal constant.numeric.value

    +2
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value

    -3+-
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#     ^^ keyword.operator

    10/-10
#   ^^ meta.number.integer.decimal constant.numeric.value
#     ^ keyword.operator.arithmetic
#       ^^ meta.number.integer.decimal constant.numeric.value

    10/-10D
#   ^^ meta.number.integer.decimal constant.numeric.value
#     ^ keyword.operator.arithmetic
#       ^^^ meta.number.float.decimal
#       ^^ constant.numeric.value
#         ^ constant.numeric.suffix

    -10.002L
#   ^ keyword.operator.unary
#    ^^^^^^^ meta.number.float.decimal
#    ^^^^^^ constant.numeric.value
#      ^ punctuation.separator.decimal
#          ^ constant.numeric.suffix

    $x..5.40D
#   ^ punctuation.definition.variable
#   ^^ variable.other.readwrite
#     ^^ keyword.operator.range
#       ^^^^^ meta.number.float.decimal
#       ^^^^ constant.numeric.value
#        ^ punctuation.separator.decimal
#           ^ constant.numeric.suffix

    -500..-495
#   ^ keyword.operator.unary
#    ^^^ meta.number.integer.decimal constant.numeric.value
#       ^^ keyword.operator.range
#         ^ keyword.operator.unary
#          ^^^ meta.number.integer.decimal constant.numeric.value

    $true..3
#   ^ punctuation.definition.variable
#    ^^^^ constant.language
#        ^^ keyword.operator.range
#          ^ meta.number.integer.decimal constant.numeric.value

    -2..$null
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#     ^^ keyword.operator.range
#       ^^^^^ constant.language
#       ^ punctuation.definition.variable

    -3..3
#   ^ keyword.operator.unary
#    ^ meta.number.integer.decimal constant.numeric.value
#       ^ meta.number.integer.decimal constant.numeric.value
#     ^^ keyword.operator.range

    1..3
#   ^ meta.number.integer.decimal constant.numeric.value
#      ^ meta.number.integer.decimal constant.numeric.value
#    ^^ keyword.operator.range

    6,10,-3
#   ^ meta.number.integer.decimal constant.numeric.value
#    ^ punctuation.separator.sequence -constant
#     ^^ meta.number.integer.decimal constant.numeric.value
#       ^ punctuation.separator.sequence -constant
#         ^ meta.number.integer.decimal constant.numeric.value

    0x476 0X476 0x476l 0x47m 0x47mb
#   ^^^^^ meta.number.integer.hexadecimal
#   ^^ constant.numeric.base
#     ^^^ constant.numeric.value
#         ^^^^^ meta.number.integer.hexadecimal
#         ^^ constant.numeric.base
#           ^^^ constant.numeric.value
#               ^^^^^^ meta.number.integer.hexadecimal
#               ^^ constant.numeric.base
#                 ^^^ constant.numeric.value
#                    ^ constant.numeric.suffix
#                      ^^^^ meta.number.integer.hexadecimal
#                      ^^ constant.numeric.base
#                        ^^ constant.numeric.value
#                          ^ - constant.numeric
#                            ^^^^ meta.number.integer.hexadecimal
#                            ^^ constant.numeric.base
#                              ^^ constant.numeric.value
#                                ^^ constant.numeric.suffix

    +0x20 +0X20 +0x20l +0x20m +0x20mb
#   ^ keyword.operator.unary
#    ^^^^ meta.number.integer.hexadecimal
#    ^^ constant.numeric.base
#      ^^ constant.numeric.value
#         ^ keyword.operator.unary
#          ^^^^ meta.number.integer.hexadecimal
#          ^^ constant.numeric.base
#            ^^ constant.numeric.value
#                ^^^^^ meta.number.integer.hexadecimal
#                ^^ constant.numeric.base
#                  ^^ constant.numeric.value
#                    ^ constant.numeric.suffix
#                       ^^^^ meta.number.integer.hexadecimal
#                       ^^ constant.numeric.base
#                         ^^ constant.numeric.value
#                           ^ - constant.numeric
#                              ^^^^^^ meta.number.integer.hexadecimal
#                              ^^ constant.numeric.base
#                                ^^ constant.numeric.value
#                                  ^^ constant.numeric.suffix

    -0x20 -0X20 -0x20l -0x20m -0x20mb
#   ^ keyword.operator.unary
#    ^^^^ meta.number.integer.hexadecimal
#    ^^ constant.numeric.base
#      ^^ constant.numeric.value
#         ^ keyword.operator.unary
#          ^^^^ meta.number.integer.hexadecimal
#          ^^ constant.numeric.base
#            ^^ constant.numeric.value
#               ^ keyword.operator.unary
#                ^^^^^ meta.number.integer.hexadecimal
#                ^^ constant.numeric.base
#                  ^^ constant.numeric.value
#                    ^ constant.numeric.suffix
#                       ^^^^ meta.number.integer.hexadecimal
#                       ^^ constant.numeric.base
#                         ^^ constant.numeric.value
#                           ^ - constant.numeric
#                              ^^^^^^ meta.number.integer.hexadecimal
#                              ^^ constant.numeric.base
#                                ^^ constant.numeric.value
#                                  ^^ constant.numeric.suffix


###[ Types ]###################################################################

    [string]
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^ storage.type.powershell
#          ^ punctuation.section.brackets.end.powershell

    [string[]]
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^ storage.type.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^ punctuation.section.brackets.end.powershell

    [int32]
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^ storage.type.powershell
#         ^ punctuation.section.brackets.end.powershell

    [System.Collections.Generic.Dictionary[[System.String, mscorlib],[System.Management.Automation.ParameterMetadata,System.Management.Automation]]]
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.generic-name.powershell
#          ^ punctuation.accessor.dot.powershell
#                      ^ punctuation.accessor.dot.powershell
#                              ^ punctuation.accessor.dot.powershell
#                               ^^^^^^^^^^ support.type.powershell
#                                         ^^ punctuation.section.brackets.begin.powershell
#                                           ^^^^^^^ meta.generic-name.powershell
#                                                 ^ punctuation.accessor.dot.powershell
#                                                  ^^^^^^ support.type.powershell
#                                                        ^ punctuation.separator.sequence.powershell
#                                                          ^^^^^^^^ support.type.powershell
#                                                                  ^ punctuation.section.brackets.end.powershell
#                                                                   ^ punctuation.separator.sequence.powershell
#                                                                    ^ punctuation.section.brackets.begin.powershell
#                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.generic-name.powershell
#                                                                           ^ punctuation.accessor.dot.powershell
#                                                                                      ^ punctuation.accessor.dot.powershell
#                                                                                                 ^ punctuation.accessor.dot.powershell
#                                                                                                  ^^^^^^^^^^^^^^^^^ support.type.powershell
#                                                                                                                   ^ punctuation.separator.sequence.powershell
#                                                                                                                    ^^^^^^^^^^^^^^^^^^ meta.generic-name.powershell
#                                                                                                                          ^ punctuation.accessor.dot.powershell
#                                                                                                                                     ^ punctuation.accessor.dot.powershell
#                                                                                                                                      ^^^^^^^^^^ support.type.powershell
#                                                                                                                                                ^^^ punctuation.section.brackets.end.powershell

    [System.Array+SZArrayEnumerator]
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^ meta.generic-name.powershell
#          ^ punctuation.accessor.dot.powershell
#           ^^^^^ support.type.powershell
#                ^ punctuation.accessor.plus.powershell
#                 ^^^^^^^^^^^^^^^^^ support.type.powershell
#                                  ^ punctuation.section.brackets.end.powershell

    [int]::MinValue
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^ storage.type.powershell
#       ^ punctuation.section.brackets.end.powershell
#        ^^ punctuation.accessor.double-colon.powershell
#          ^^^^^^^^ variable.other.member.powershell

    [System.DateTime]::Parse('2016/09/21')
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^ meta.generic-name.powershell
#          ^ punctuation.accessor.dot.powershell
#           ^^^^^^^^ support.type.powershell
#                   ^ punctuation.section.brackets.end.powershell
#                    ^^ punctuation.accessor.double-colon.powershell
#                      ^^^^^ meta.function-call.powershell variable.function.powershell
#                      @@@@@ reference
#                           ^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                           ^ punctuation.section.arguments.begin.powershell
#                            ^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                            ^ punctuation.definition.string.begin.powershell
#                                       ^ punctuation.definition.string.end.powershell
#                                        ^ punctuation.section.arguments.end.powershell


###[ Commands ]################################################################

    Invoke-Something -foobar
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^^^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
    Invoke-Something -foobar value
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^^^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                            ^^^^^ string.unquoted.powershell
    Invoke-Something -foobar:$true
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^^^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                           ^ keyword.operator.ternary.powershell
#                            ^^^^^ constant.language.boolean.true.powershell
#                            ^ punctuation.definition.variable.powershell
    Invoke-Something -foobar: $true
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^^^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                           ^ keyword.operator.ternary.powershell
#                             ^^^^^ constant.language.boolean.true.powershell
#                             ^ punctuation.definition.variable.powershell
    Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                        ^^ string.unquoted.powershell
#                           ^^^ variable.parameter.option.powershell
#                           ^ punctuation.definition.parameter.powershell
#                               ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                  ^^^ variable.parameter.option.powershell
#                                  ^ punctuation.definition.parameter.powershell
#                                      ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                      ^ punctuation.definition.string.begin.powershell
#                                            ^ punctuation.definition.string.end.powershell
#                                              ^^^^^^^ variable.parameter.option.powershell
#                                              ^ punctuation.definition.parameter.powershell
#                                                      ^^^^^^^^ variable.parameter.option.powershell
#                                                      ^ punctuation.definition.parameter.powershell
    Invoke-Something (1..20 | Invoke-Something) -p2 'value'
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.powershell
#                    ^ punctuation.section.group.begin.powershell
#                     ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                      ^^ keyword.operator.range.powershell
#                        ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                           ^ keyword.operator.logical.pipe.powershell
#                             ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#                             @@@@@@@@@@@@@@@@ reference
#                                             ^ punctuation.section.group.end.powershell
#                                               ^^^ variable.parameter.option.powershell
#                                               ^ punctuation.definition.parameter.powershell
#                                                   ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                                   ^ punctuation.definition.string.begin.powershell
#                                                         ^ punctuation.definition.string.end.powershell
    Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                        ^^ string.unquoted.powershell
#                           ^^^ variable.parameter.option.powershell
#                           ^ punctuation.definition.parameter.powershell
#                               ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                  ^ keyword.operator.logical.pipe.powershell
#                                    ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#                                    @@@@@@@@@@@@@@@@ reference
#                                                    ^^^^^^^^ meta.function-call.arguments.powershell
#                                                     ^^^^^^^ variable.parameter.option.powershell
#                                                     ^ punctuation.definition.parameter.powershell
    Invoke-Something -p1 {
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^ meta.function-call.arguments.powershell
#                    ^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                        ^ meta.block.powershell punctuation.section.braces.begin.powershell
        Invoke-Something -foobar:$true
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell meta.block.powershell
#       ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#       @@@@@@@@@@@@@@@@ reference
#                       ^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                        ^^^^^^^ variable.parameter.option.powershell
#                        ^ punctuation.definition.parameter.powershell
#                               ^ keyword.operator.ternary.powershell
#                                ^^^^^ constant.language.boolean.true.powershell
#                                ^ punctuation.definition.variable.powershell
        } | Invoke-Something
#^^^^^^^^^ meta.function-call.arguments.powershell
#^^^^^^^^ meta.block.powershell
#       ^ punctuation.section.braces.end.powershell
#         ^ keyword.operator.logical.pipe.powershell
#           ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#           @@@@@@@@@@@@@@@@ reference

    Invoke-Something -p1 value `
#   ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@@@@ reference
#                   ^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                    ^^^ variable.parameter.option.powershell
#                    ^ punctuation.definition.parameter.powershell
#                        ^^^^^ string.unquoted.powershell
#                              ^ punctuation.separator.continuation.line.powershell
    -p2 14.4 `
#^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#   ^^^ variable.parameter.option.powershell
#   ^ punctuation.definition.parameter.powershell
#       ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#         ^ punctuation.separator.decimal.powershell
#            ^ punctuation.separator.continuation.line.powershell
    -p3 $value | Invoke-Something -verbose
#^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#   ^^^ variable.parameter.option.powershell
#   ^ punctuation.definition.parameter.powershell
#       ^^^^^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#              ^ keyword.operator.logical.pipe.powershell
#                ^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#                @@@@@@@@@@@@@@@@ reference
#                                ^^^^^^^^^ meta.function-call.arguments.powershell
#                                 ^^^^^^^^ variable.parameter.option.powershell
#                                 ^ punctuation.definition.parameter.powershell

    Get-ChildItem |
#   ^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@@@@ reference
#                ^^ meta.function-call.arguments.powershell
#                 ^ keyword.operator.logical.pipe.powershell
      Select Name,Length
#     ^^^^^^ meta.function-call.powershell variable.function.powershell
#     @@@@@@ reference
#           ^^^^^^^^^^^^ meta.function-call.arguments.powershell
#            ^^^^ string.unquoted.powershell
#                ^ punctuation.separator.sequence.powershell
#                 ^^^^^^ string.unquoted.powershell

    # Commands (Built-in variables)
    ls *.ps1 -recurse
#   ^^ meta.function-call.powershell variable.function.powershell
#   @@ reference
#      ^^^^^ string.unquoted.powershell
#      ^ constant.other.wildcard.asterisk.powershell
#       ^ punctuation.separator.powershell
#            ^^^^^^^^ variable.parameter.option.powershell
#            ^ punctuation.definition.parameter.powershell

    # Commands (executable files)
    . .\scripts\Test-Foo.ps1 -parameter 'value'
#   ^ keyword.operator.source.powershell
#     ^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#     @@@@@@@@@@@@@@@@@@@@@@ reference
#                            ^^^^^^^^^^ variable.parameter.option.powershell
#                            ^ punctuation.definition.parameter.powershell
#                                       ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                       ^ punctuation.definition.string.begin.powershell
#                                             ^ punctuation.definition.string.end.powershell

    & tool.exe
#   ^ keyword.operator.call.powershell
#     ^^^^^^^^ meta.function-call.powershell variable.function.powershell
#     @@@@@@@@ reference

    something.cmd
#   ^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@@@ reference

    øyvind.com
#   ^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@ reference

    & '.\script name with spaces.ps1'
#   ^ keyword.operator.call.powershell
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell meta.function-call.powershell variable.function.powershell
#     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ reference
#     ^ punctuation.definition.string.begin.powershell
#      ^^ punctuation.separator.powershell
#                               ^ punctuation.separator.powershell
#                                   ^ punctuation.definition.string.end.powershell

    & ".\script name with spaces.ps1"
#   ^ keyword.operator.call.powershell
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell meta.function-call.powershell variable.function.powershell
#     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ reference
#     ^ punctuation.definition.string.begin.powershell
#      ^^ punctuation.separator.powershell
#                               ^ punctuation.separator.powershell
#                                   ^ punctuation.definition.string.end.powershell

# switch
switch ("fourteen") {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ string.quoted.double
#                 ^ punctuation.section.group.end
#                   ^ meta.block punctuation.section.braces.begin
#                    ^ meta.block punctuation.section.braces.end
switch -CaseSensitive ("fourteen") {}
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^^^^^^^^^ variable.parameter.option
#                     ^ punctuation.section.group.begin
#                      ^ string.quoted.double
#                                ^ punctuation.section.group.end
#                                  ^ meta.block punctuation.section.braces.begin
#                                   ^ meta.block punctuation.section.braces.end
switch -Regex ("fourteen") {}
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^ variable.parameter.option
#             ^ punctuation.section.group.begin
#              ^ string.quoted.double
#                        ^ punctuation.section.group.end
#                          ^ meta.block punctuation.section.braces.begin
#                           ^ meta.block punctuation.section.braces.end
switch -Wildcard ($a) {}
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^^^^ variable.parameter.option
#                ^ punctuation.section.group.begin
#                 ^ punctuation.definition.variable
#                   ^ punctuation.section.group.end
#                     ^ meta.block punctuation.section.braces.begin
#                      ^ meta.block punctuation.section.braces.end
switch -regex -file .\somefile.txt {}
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^ variable.parameter.option
#             ^ punctuation.definition.parameter
#              ^^^^ variable.parameter.option
#                                  ^ meta.block punctuation.section.braces.begin
#                                   ^ meta.block punctuation.section.braces.end
switch (3) {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ meta.number.integer.decimal constant.numeric.value
#        ^ punctuation.section.group.end
#          ^ meta.block punctuation.section.braces.begin
#           ^ meta.block punctuation.section.braces.end
switch (4, 2) {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ meta.number.integer.decimal constant.numeric.value
#          ^ meta.number.integer.decimal constant.numeric.value
#        ^ punctuation.separator
#           ^ punctuation.section.group.end
#             ^ meta.block punctuation.section.braces.begin
#              ^ meta.block punctuation.section.braces.end

switch -Regex -File $filePath {
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^ variable.parameter.option
#             ^ punctuation.definition.parameter
#              ^^^^ variable.parameter.option
#                   ^ punctuation.definition.variable
#                             ^ meta.block punctuation.section.braces.begin
    '.' {}
#   ^^^ string.quoted.single
#       ^ meta.block punctuation.section.braces.begin
#        ^ meta.block punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.block punctuation.section.braces.begin
#            ^ meta.block punctuation.section.braces.end
}
# <- meta.block punctuation.section.braces.end

switch -Wildcard -CaseSensitive ($something) {
# <- keyword.control
#      ^ punctuation.definition.parameter
#      ^^^^^^^^^ variable.parameter.option
#                ^ punctuation.definition.parameter
#                ^^^^^^^^^^^^^^ variable.parameter.option
#                               ^ punctuation.section.group.begin
#                                ^ punctuation.definition.variable
#                                 ^ variable.other.readwrite
#                                          ^ punctuation.section.group.end
#                                            ^ meta.block punctuation.section.braces.begin
    '.' {}
#   ^^^ string.quoted.single
#       ^ meta.block punctuation.section.braces.begin
#        ^ meta.block punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.block punctuation.section.braces.begin
#            ^ meta.block punctuation.section.braces.end
}
# <- meta.block punctuation.section.braces.end

switch ('this') {
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^^^^^^ string.quoted.single
#             ^ punctuation.section.group.end
#               ^ meta.block punctuation.section.braces.begin
    'this' {}
#   ^^^^^^ string.quoted.single
#          ^ meta.block punctuation.section.braces.begin
#           ^ meta.block punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.block punctuation.section.braces.begin
#            ^ meta.block punctuation.section.braces.end
}
# <- meta.block punctuation.section.braces.end

    data {
        "Thank you for using my PowerShell Organize.pst script."
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.data.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#       ^ punctuation.definition.string.begin.powershell
#                                                              ^ punctuation.definition.string.end.powershell
        "It is provided free of charge to the community."
        "I appreciate your comments and feedback."
    }
#    ^ - meta

# Functions and filters
functioN MyFunction{}
#^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@ definition
#                  ^ punctuation.section.block.begin.powershell
#                   ^ punctuation.section.block.end.powershell
#                    ^ - meta
function My-Function         {}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@@ definition
#                            ^ punctuation.section.block.begin.powershell
#                             ^ punctuation.section.block.end.powershell
Function My.Function{}
#^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@@ definition
#                   ^ punctuation.section.block.begin.powershell
#                    ^ punctuation.section.block.end.powershell
function My-Function.Other{}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@@@@@@@@ definition
#                         ^ punctuation.section.block.begin.powershell
#                          ^ punctuation.section.block.end.powershell
function Some.other.function{}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@@@@@@@@@@ definition
#                           ^ punctuation.section.block.begin.powershell
#                            ^ punctuation.section.block.end.powershell
FUNCTION MyFunction2 {}
#^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@@ definition
#                    ^ punctuation.section.block.begin.powershell
#                     ^ punctuation.section.block.end.powershell
function New-File { }
#^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@ definition
#                 ^ punctuation.section.block.begin.powershell
#                   ^ punctuation.section.block.end.powershell
function New-File ($Name) { }
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@ definition
 New-File
#^^^^^^^^ meta.function-call.powershell support.function.powershell
#@@@@@@@@ reference
function NewFile($Name) { }
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^ entity.name.function.powershell
#        @@@@@@@ definition
#               ^ punctuation.section.parameters.begin.powershell
#                ^^^^^ variable.parameter.powershell
#                ^ punctuation.definition.variable.begin.powershell
#                     ^ punctuation.section.parameters.end.powershell
#                       ^ punctuation.section.block.begin.powershell
#                         ^ punctuation.section.block.end.powershell
filter myfilter($param) {}
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^ keyword.declaration.function.powershell
#      ^^^^^^^^ entity.name.function.powershell
#      @@@@@@@@ definition
#              ^ punctuation.section.parameters.begin.powershell
#               ^^^^^^ variable.parameter.powershell
#               ^ punctuation.definition.variable.begin.powershell
#                     ^ punctuation.section.parameters.end.powershell
#                       ^ punctuation.section.block.begin.powershell
#                        ^ punctuation.section.block.end.powershell
Filter my-Filter ($param){}
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^ keyword.declaration.function.powershell
#      ^^^^^^^^^ entity.name.function.powershell
#      @@@@@@@@@ definition
#                ^ punctuation.section.parameters.begin.powershell
#                 ^^^^^^ variable.parameter.powershell
#                 ^ punctuation.definition.variable.begin.powershell
#                       ^ punctuation.section.parameters.end.powershell
#                        ^ punctuation.section.block.begin.powershell
#                         ^ punctuation.section.block.end.powershell

# Note that the # in the path should highlight as a comment!
function Test-Drive([string]$roman) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@@ definition
#                  ^ punctuation.section.parameters.begin.powershell
#                   ^ punctuation.section.brackets.begin.powershell
#                    ^^^^^^ storage.type.powershell
#                          ^ punctuation.section.brackets.end.powershell
#                           ^^^^^^ variable.parameter.powershell
#                           ^ punctuation.definition.variable.begin.powershell
#                                 ^ punctuation.section.parameters.end.powershell
#                                   ^ punctuation.section.block.begin.powershell
    $roman | c:\users\Me\Documents\Programming\F#\test.exe $roman
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#            ^ meta.function-call.powershell variable.function.powershell
#            @ reference
#             ^ keyword.operator.ternary.powershell
#              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted.powershell
#              ^ punctuation.separator.powershell
#                    ^ punctuation.separator.powershell
#                       ^ punctuation.separator.powershell
#                                 ^ punctuation.separator.powershell
#                                             ^ punctuation.separator.powershell
#                                               ^^^^^^^^^^^^^^^^^ comment.line.powershell
#                                               ^ punctuation.definition.comment.powershell
    }
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.end.powershell

function Verb-Noun
#^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@ definition
    {
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.begin.powershell

    Param
   #^^^^^ keyword.declaration.parameter
    (
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.begin.powershell
        # Param1 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(Mandatory=$true,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^ support.function.attribute
        #         ^ punctuation.section.group.begin
        #          ^^^^^^^^^ variable.parameter.attribute
        #                   ^ keyword.operator.assignment
        #                    ^ punctuation.definition.variable
        #                     ^^^^ constant.language
        #                         ^ punctuation.separator
                   ValueFromPipeline=$true,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^^^^^^^^^^ variable.parameter.attribute
        #                           ^ keyword.operator.assignment
        #                            ^ punctuation.definition.variable
        #                             ^^^^ constant.language
        #                                 ^ punctuation.separator
                   ValueFromPipelineByPropertyName = $true,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute
        #                                          ^ keyword.operator.assignment
        #                                            ^ punctuation.definition.variable
        #                                            ^^^^^ constant.language
        #                                                 ^ punctuation.separator
                   ValueFromRemainingArguments=$false,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute
        #                                     ^ keyword.operator.assignment
        #                                      ^ punctuation.definition.variable
        #                                       ^^^^^ constant.language
        #                                            ^ punctuation.separator
                   Position=0,
        #^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^ variable.parameter.attribute
        #                  ^ keyword.operator.assignment
        #                   ^ meta.number.integer.decimal constant.numeric.value
        #                    ^ punctuation.separator
                   SupportsPaging,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^^^^^^^ variable.parameter.attribute
        #                        ^ punctuation.separator
                   ParameterSetName = 'Parameter Set 1')]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        #          ^^^^^^^^^^^^^^^^ variable.parameter.attribute
        #                           ^ keyword.operator.assignment
        #                             ^^^^^^^^^^^^^^^^^ string.quoted.single
        #                                              ^ punctuation.section.group.end
        #                                               ^ punctuation.section.brackets.end
        #                                                ^ - meta.attribute
        [ValidateNotNullOrEmpty()]
        #^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^^^^^^^^^^^^^^^^^^^^^ support.function.attribute
        #                      ^ punctuation.section.group.begin
        #                       ^ punctuation.section.group.end
        #                        ^ punctuation.section.brackets.end
        [ValidateNotNull()]
        #^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^^^^^^^^^^^^^^ support.function.attribute
        #               ^ punctuation.section.group.begin
        #                ^ punctuation.section.group.end
        #                 ^ punctuation.section.brackets.end
        [ValidateNotNullOrEmpty()]
        #^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^^^^^^^^^^^^^^^^^^^^^ support.function.attribute
        #                      ^ punctuation.section.group.begin
        #                       ^ punctuation.section.group.end
        #                        ^ punctuation.section.brackets.end
        [ValidateCount(0,5)]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^^^^^^^^^^^^ support.function.attribute
        #             ^ punctuation.section.group.begin
        #              ^ meta.number.integer.decimal constant.numeric.value
        #               ^ punctuation.separator
        #                ^ meta.number.integer.decimal constant.numeric.value
        #                 ^ punctuation.section.group.end
        #                  ^ punctuation.section.brackets.end
        [ValidateSet("sun", "moon", "earth")]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^ support.function.attribute
        #           ^ punctuation.section.group.begin
        #            ^^^^ string.quoted.double
        #                 ^ punctuation.separator
        #                   ^^^^^^ string.quoted.double
        #                         ^ punctuation.separator
        #                           ^^^^^^^ string.quoted.double
        #                                  ^ punctuation.section.group.end
        #                                   ^ punctuation.section.brackets.end
        [Alias("p1")]
        #^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.brackets.begin
        # ^ support.function.attribute
        #     ^ punctuation.section.group.begin
        #      ^^^^ string.quoted.double
        #          ^ punctuation.section.group.end
        #           ^ punctuation.section.brackets.end
        $Param1
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
    )
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.end.powershell

    # Do Something....

    }
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.end.powershell

# Class
class Vehicle {
#^^^^^^^^^^^^^^ meta.class.powershell
#^^^^ keyword.declaration.class.powershell
#     ^^^^^^^ entity.name.class.powershell
#     @@@@@@@ definition
#             ^ punctuation.section.block.begin.powershell
    Vehicle() {}
#^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^ entity.name.function.powershell
#   @@@@@@@ definition
#          ^ punctuation.section.parameters.begin.powershell
#           ^ punctuation.section.parameters.end.powershell
#             ^ punctuation.section.block.begin.powershell
#              ^ punctuation.section.block.end.powershell
    Vehicle([string]$Owner) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^ entity.name.function.powershell
#   @@@@@@@ definition
#          ^ punctuation.section.parameters.begin.powershell
#           ^ punctuation.section.brackets.begin.powershell
#            ^^^^^^ storage.type.powershell
#                  ^ punctuation.section.brackets.end.powershell
#                   ^^^^^^ variable.parameter.powershell
#                   ^ punctuation.definition.variable.begin.powershell
#                         ^ punctuation.section.parameters.end.powershell
#                           ^ punctuation.section.block.begin.powershell
        $this.Owner = $Owner
    }

    [int]$Mileage
#    ^ storage.type
#        ^ punctuation.definition.variable
#         ^ variable.other.readwrite
    [int]$Age
#    ^ storage.type
#        ^ punctuation.definition.variable
#         ^ variable.other.readwrite
    [string]$Owner
#    ^ storage.type
#           ^ punctuation.definition.variable
#            ^ variable.other.readwrite

    [void]Drive([int]$NumberOfMiles) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^ storage.type.powershell
#        ^ punctuation.section.brackets.end.powershell
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#         ^^^^^ entity.name.function.powershell
#         @@@@@ definition
#              ^ punctuation.section.parameters.begin.powershell
#               ^ punctuation.section.brackets.begin.powershell
#                ^^^ storage.type.powershell
#                   ^ punctuation.section.brackets.end.powershell
#                    ^^^^^^^^^^^^^^ variable.parameter.powershell
#                    ^ punctuation.definition.variable.begin.powershell
#                                  ^ punctuation.section.parameters.end.powershell
#                                    ^ punctuation.section.block.begin.powershell
        $this.Mileage += $NumberOfMiles
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell
#       ^^^^^ variable.language.powershell
#       ^ punctuation.definition.variable.powershell
#            ^ punctuation.accessor.dot.powershell
#             ^^^^^^^ variable.other.member.powershell
#                     ^^ keyword.operator.assignment.augmented.powershell
#                        ^^^^^^^^^^^^^^ variable.other.readwrite.powershell
#                        ^ punctuation.definition.variable.powershell

    }
#^^^^ meta.class.powershell meta.function.powershell
#   ^ punctuation.section.block.end.powershell

    static [System.Array] GetAvailableColors() {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^ storage.modifier.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^^^^^ meta.generic-name.powershell
#                 ^ punctuation.accessor.dot.powershell
#                  ^^^^^ support.type.powershell
#                       ^ punctuation.section.brackets.end.powershell
#                         ^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#                         ^^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#                         @@@@@@@@@@@@@@@@@@ definition
#                                           ^ punctuation.section.parameters.begin.powershell
#                                            ^ punctuation.section.parameters.end.powershell
#                                              ^ punctuation.section.block.begin.powershell
        return 'yellow', 'red'
    }
}
# <- punctuation.section.block.end

$fiat.Drive(42)
#     ^^^^^ meta.function-call
#     @@@@@ reference
[Vehicle]::GetAvailableColors()
#          ^^^^^^^^^^^^^^^^^^ meta.function-call variable.function
#          @@@@@@@@@@@@@@@@@@ reference

# Control words
foreach ($item in $collection) {
# <- keyword.control
#       ^ punctuation.section.group.begin
#              ^^ keyword.control
#                            ^ punctuation.section.group.end
#                              ^ punctuation.section.braces.begin
#        ^ punctuation.definition.variable
#                 ^ punctuation.definition.variable
}
# <- punctuation.section.braces.end

try   { }
# <- keyword.control
#     ^ punctuation.section.braces.begin
#       ^ punctuation.section.braces.end
catch { }
# <- keyword.control
#     ^ punctuation.section.braces.begin
#       ^ punctuation.section.braces.end

    # Redirection
    notepad.exe > log.txt
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ keyword.operator.redirection.powershell
#                 ^^^^^^^ string.unquoted.powershell
#                    ^ punctuation.separator.powershell
    notepad.exe 1> log.txt
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^ keyword.operator.redirection.powershell
#                  ^^^^^^^ string.unquoted.powershell
#                     ^ punctuation.separator.powershell
    notepad.exe *> log.txt
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^ keyword.operator.redirection.powershell
#                  ^^^^^^^ string.unquoted.powershell
#                     ^ punctuation.separator.powershell
    notepad.exe 2>&1
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^^ keyword.operator.redirection.powershell
#                  ^ constant.numeric.decimal.file-descriptor.powershell
    notepad.exe  3>&1
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#                ^ constant.numeric.decimal.file-descriptor.powershell
#                 ^^ keyword.operator.redirection.powershell
#                   ^ constant.numeric.decimal.file-descriptor.powershell
    notepad.exe 4>&1
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^^ keyword.operator.redirection.powershell
#                  ^ constant.numeric.decimal.file-descriptor.powershell
    notepad.exe 5>&1
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^^ keyword.operator.redirection.powershell
#                  ^ constant.numeric.decimal.file-descriptor.powershell
    notepad.exe 6>&1
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^^ keyword.operator.redirection.powershell
#                  ^ constant.numeric.decimal.file-descriptor.powershell
    notepad.exe 2>&1> log.txt
#   ^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@@@@@@@@ reference
#               ^ constant.numeric.decimal.file-descriptor.powershell
#                ^^ keyword.operator.redirection.powershell
#                  ^ constant.numeric.decimal.file-descriptor.powershell
#                   ^ keyword.operator.redirection.powershell
#                     ^^^^^^^ string.unquoted.powershell
#                        ^ punctuation.separator.powershell

    # Operators
    if (10 -cgt 100) { }
#   ^^ keyword.control.conditional.if.powershell
#      ^^^^^^^^^^^^^ meta.group.powershell
#      ^ punctuation.section.group.begin.powershell
#       ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#          ^^^^ keyword.operator.comparison.powershell
#          ^ punctuation.definition.keyword.powershell
#               ^^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                  ^ punctuation.section.group.end.powershell
#                    ^^^ meta.block.powershell
#                    ^ punctuation.section.braces.begin.powershell
#                      ^ punctuation.section.braces.end.powershell
    $a -is $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#          ^^ variable.other.readwrite.powershell
#          ^ punctuation.definition.variable.powershell
    $b -contains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                ^^ variable.other.readwrite.powershell
#                ^ punctuation.definition.variable.powershell
    $x -notcontains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                   ^^ variable.other.readwrite.powershell
#                   ^ punctuation.definition.variable.powershell
    $c -in $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#          ^^ variable.other.readwrite.powershell
#          ^ punctuation.definition.variable.powershell
    $c -notin $x
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^^ variable.other.readwrite.powershell
#             ^ punctuation.definition.variable.powershell
    $a -match $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^^ variable.other.readwrite.powershell
#             ^ punctuation.definition.variable.powershell
    $a -notmatch $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                ^^ variable.other.readwrite.powershell
#                ^ punctuation.definition.variable.powershell
    $x -like $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#            ^^ variable.other.readwrite.powershell
#            ^ punctuation.definition.variable.powershell
    100 -and 0
#   ^^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#       ^^^^ keyword.operator.logical.powershell
#       ^ punctuation.definition.keyword.powershell
#            ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
    $a -ceq 4 -and $a -ine $d -or
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^ keyword.operator.comparison.powershell
#      ^ punctuation.definition.keyword.powershell
#           ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#             ^^^^ keyword.operator.logical.powershell
#             ^ punctuation.definition.keyword.powershell
#                  ^^ variable.other.readwrite.powershell
#                  ^ punctuation.definition.variable.powershell
#                     ^^^^ keyword.operator.comparison.powershell
#                     ^ punctuation.definition.keyword.powershell
#                          ^^ variable.other.readwrite.powershell
#                          ^ punctuation.definition.variable.powershell
#                             ^^^ keyword.operator.logical.powershell
#                             ^ punctuation.definition.keyword.powershell
    $c -is [Type]
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^^ support.type.powershell
#               ^ punctuation.section.brackets.end.powershell
    $c -isnot [Type]
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^ punctuation.section.brackets.begin.powershell
#              ^^^^ support.type.powershell
#                  ^ punctuation.section.brackets.end.powershell
    $c -as [Type]
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^ keyword.operator.cast.powershell
#      ^ punctuation.definition.keyword.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^^ support.type.powershell
#               ^ punctuation.section.brackets.end.powershell
    $k = $y -bor $k
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^ variable.other.readwrite.powershell
#        ^ punctuation.definition.variable.powershell
#           ^^^^ keyword.operator.bitwise.powershell
#           ^ punctuation.definition.keyword.powershell
#                ^^ variable.other.readwrite.powershell
#                ^ punctuation.definition.variable.powershell
    $x = $y -band $x
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^ variable.other.readwrite.powershell
#        ^ punctuation.definition.variable.powershell
#           ^^^^^ keyword.operator.bitwise.powershell
#           ^ punctuation.definition.keyword.powershell
#                 ^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
    $z = -bnot $x
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^^^^ keyword.operator.bitwise.powershell
#        ^ punctuation.definition.keyword.powershell
#              ^^ variable.other.readwrite.powershell
#              ^ punctuation.definition.variable.powershell
    $l = 1 -shl 10
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#          ^^^^ keyword.operator.bitwise.powershell
#          ^ punctuation.definition.keyword.powershell
#               ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
    $r = 10 -shr 1
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#           ^^^^ keyword.operator.bitwise.powershell
#           ^ punctuation.definition.keyword.powershell
#                ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
    $k = $y -xor $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^ variable.other.readwrite.powershell
#        ^ punctuation.definition.variable.powershell
#           ^^^^ keyword.operator.logical.powershell
#           ^ punctuation.definition.keyword.powershell
#                ^^ variable.other.readwrite.powershell
#                ^ punctuation.definition.variable.powershell
    $k = $y -bxor $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^ keyword.operator.assignment.powershell
#        ^^ variable.other.readwrite.powershell
#        ^ punctuation.definition.variable.powershell
#           ^^^^^ keyword.operator.bitwise.powershell
#           ^ punctuation.definition.keyword.powershell
#                 ^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
    $a -icontains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                 ^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
    $a -ccontains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                 ^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
    $a -iNotContains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                    ^^ variable.other.readwrite.powershell
#                    ^ punctuation.definition.variable.powershell
    $a -cNotContains $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                    ^^ variable.other.readwrite.powershell
#                    ^ punctuation.definition.variable.powershell
    $a -cmatch $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#              ^^ variable.other.readwrite.powershell
#              ^ punctuation.definition.variable.powershell
    $x -iMatch $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#              ^^ variable.other.readwrite.powershell
#              ^ punctuation.definition.variable.powershell
    $x -iNotMatch $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#                 ^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
    $a -iLike $b
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^^ variable.other.readwrite.powershell
#             ^ punctuation.definition.variable.powershell
    $b -cLike $c
#   ^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^^ variable.other.readwrite.powershell
#             ^ punctuation.definition.variable.powershell
    "hey" -cgt "Hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "Hey" -igt "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "hey" -cge "Hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "Hey" -ige "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "HEY" -clt "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "HEY" -ilt "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "HEY" -cle "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell
    "HEY" -ile "hey"
#   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^ keyword.operator.comparison.powershell
#         ^ punctuation.definition.keyword.powershell
#              ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#              ^ punctuation.definition.string.begin.powershell
#                  ^ punctuation.definition.string.end.powershell

    function Test-Function {}
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^^^^^^^^^^^^ entity.name.function.powershell
#                          ^ punctuation.section.block.begin.powershell
#                           ^ punctuation.section.block.end.powershell
#            @@@@@@@@@@@@@ definition
    function New-Object {}
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ keyword.declaration.function.powershell
#            ^^^^^^^^^^ entity.name.function.powershell
#                       ^ punctuation.section.block.begin.powershell
#                        ^ punctuation.section.block.end.powershell
#            @@@@@@@@@@ definition
     Test-Function -Class ClassName
#    ^^^^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#                  ^^^^^^ variable.parameter.option.powershell - storage - keyword
#                  ^ punctuation.definition.parameter.powershell
#                         ^^^^^^^^^ string.unquoted.powershell
#    @@@@@@@@@@@@@ reference
    New-Object -TypeName System.Diagnostics.Process
#   ^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@ reference
#              ^^^^^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                        ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted.powershell  - keyword
#                              ^ punctuation.separator.powershell
#                                          ^ punctuation.separator.powershell
    New-Object -TypeName System.Data
#   ^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@ reference
#              ^^^^^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                        ^^^^^^^^^^^ string.unquoted.powershell - keyword
    New-Object -TypeName Sy-stem.if
#   ^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@ reference
#              ^^^^^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                        ^^^^^^^^^^ string.unquoted.powershell - keyword
#                               ^ punctuation.separator.powershell
    New-Object -TypeName S_ystem.Clean
#   ^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@ reference
#              ^^^^^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                        ^^^^^^^^^^^^^ string.unquoted.powershell - keyword
#                               ^ punctuation.separator.powershell
    New-Object -TypeName Sy_stem-.Throw
#   ^^^^^^^^^^ meta.function-call.powershell support.function.powershell
#   @@@@@@@@@@ reference
#              ^^^^^^^^^ variable.parameter.option.powershell
#              ^ punctuation.definition.parameter.powershell
#                        ^^^^^^^^^^^^^^ string.unquoted.powershell - keyword

    echo `"test`"
#   ^^^^ meta.function-call.powershell variable.function.powershell
#   @@@@ reference
#        ^^ constant.character.escape.powershell
#          ^^^^^^ string.unquoted.powershell - string.quoted
#              ^^ constant.character.escape.powershell

    @("any","array","has").foreach({ $_ })
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.group.array-expression.powershell
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#     ^ punctuation.definition.string.begin.powershell
#         ^ punctuation.definition.string.end.powershell
#          ^ punctuation.separator.sequence.powershell
#           ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#           ^ punctuation.definition.string.begin.powershell
#                 ^ punctuation.definition.string.end.powershell
#                  ^ punctuation.separator.sequence.powershell
#                   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell
#                        ^ punctuation.section.group.end.powershell
#                         ^ punctuation.accessor.dot.powershell
#                          ^^^^^^^ meta.function-call.powershell variable.function.powershell
#                          @@@@@@@ reference
#                                 ^^^^^^^^ meta.function-call.arguments.powershell
#                                 ^ punctuation.section.arguments.begin.powershell
#                                  ^^^^^^ meta.block.powershell
#                                  ^ punctuation.section.braces.begin.powershell
#                                    ^^ variable.language.powershell
#                                    ^ punctuation.definition.variable.powershell
#                                       ^ punctuation.section.braces.end.powershell
#                                        ^ punctuation.section.arguments.end.powershell
    @('any','array','has').foreach{ $_ }
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.group.array-expression.powershell
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^^^^^ meta.string.powershell string.quoted.single.powershell
#     ^ punctuation.definition.string.begin.powershell
#         ^ punctuation.definition.string.end.powershell
#          ^ punctuation.separator.sequence.powershell
#           ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#           ^ punctuation.definition.string.begin.powershell
#                 ^ punctuation.definition.string.end.powershell
#                  ^ punctuation.separator.sequence.powershell
#                   ^^^^^ meta.string.powershell string.quoted.single.powershell
#                   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell
#                        ^ punctuation.section.group.end.powershell
#                         ^ punctuation.accessor.dot.powershell
#                                 ^^^^^^ meta.block.powershell
#                                 ^ punctuation.section.braces.begin.powershell
#                                   ^^ variable.language.powershell
#                                   ^ punctuation.definition.variable.powershell
#                                      ^ punctuation.section.braces.end.powershell
    @("any","array","has").where({ $_.Length -gt 3 })
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.group.array-expression.powershell
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#     ^ punctuation.definition.string.begin.powershell
#         ^ punctuation.definition.string.end.powershell
#          ^ punctuation.separator.sequence.powershell
#           ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#           ^ punctuation.definition.string.begin.powershell
#                 ^ punctuation.definition.string.end.powershell
#                  ^ punctuation.separator.sequence.powershell
#                   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell
#                        ^ punctuation.section.group.end.powershell
#                         ^ punctuation.accessor.dot.powershell
#                          ^^^^^ meta.function-call.powershell variable.function.powershell
#                          @@@@@ reference
#                               ^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                               ^ punctuation.section.arguments.begin.powershell
#                                ^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#                                ^ punctuation.section.braces.begin.powershell
#                                  ^^ variable.language.powershell
#                                  ^ punctuation.definition.variable.powershell
#                                    ^ punctuation.accessor.dot.powershell
#                                     ^^^^^^ variable.other.member.powershell
#                                            ^^^ keyword.operator.comparison.powershell
#                                            ^ punctuation.definition.keyword.powershell
#                                                ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                                  ^ punctuation.section.braces.end.powershell
#                                                   ^ punctuation.section.arguments.end.powershell
    @("any","array","has").where{ $_.Length -gt 3 }
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.group.array-expression.powershell
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#     ^ punctuation.definition.string.begin.powershell
#         ^ punctuation.definition.string.end.powershell
#          ^ punctuation.separator.sequence.powershell
#           ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#           ^ punctuation.definition.string.begin.powershell
#                 ^ punctuation.definition.string.end.powershell
#                  ^ punctuation.separator.sequence.powershell
#                   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell
#                        ^ punctuation.section.group.end.powershell
#                         ^ punctuation.accessor.dot.powershell
#                               ^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#                               ^ punctuation.section.braces.begin.powershell
#                                 ^^ variable.language.powershell
#                                 ^ punctuation.definition.variable.powershell
#                                   ^ punctuation.accessor.dot.powershell
#                                    ^^^^^^ variable.other.member.powershell
#                                           ^^^ keyword.operator.comparison.powershell
#                                           ^ punctuation.definition.keyword.powershell
#                                               ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                                 ^ punctuation.section.braces.end.powershell

    function join-path {}
#            @@@@@@@@@ definition

$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
#^^^^ variable.other.readwrite.powershell
#     ^ keyword.operator.assignment.powershell
#       ^^^^^^^^^ meta.function-call.powershell support.function.powershell
#       @@@@@@@@@ reference
#                 ^^^^^^^^^^^^^^^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
#                  ^^^ support.variable.drive.powershell
#                     ^ punctuation.accessor.colon.powershell
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#                                  ^ string.quoted.double.powershell punctuation.definition.string.begin.powershell
#                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.powershell
#                                   ^^ punctuation.section.interpolation.begin.powershell
#                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.powershell.embedded
#                                     ^ punctuation.section.brackets.begin.powershell
#                                      ^^^^^^^^^^ meta.generic-name.powershell
#                                            ^ punctuation.accessor.dot.powershell
#                                               ^ punctuation.accessor.dot.powershell
#                                                ^^^^ support.type.powershell
#                                                    ^ punctuation.section.brackets.end.powershell
#                                                     ^^ punctuation.accessor.double-colon.powershell
#                                                       ^^^^^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#                                                       @@@@@@@@@@@@@@@@@ reference
#                                                                        ^^ meta.function-call.arguments.powershell
#                                                                        ^ punctuation.section.arguments.begin.powershell
#                                                                         ^ punctuation.section.arguments.end.powershell
#                                                                          ^ punctuation.section.interpolation.end.powershell
#                                                                           ^^^^^ string.quoted.double.powershell
#                                                                               ^ punctuation.definition.string.end.powershell

function out-file {}
#        @@@@@@@@ definition
$ScriptBlock | Out-File $file -Force
# <- punctuation.definition.variable
#              @@@@@@@@ reference
#            ^ keyword.operator.logical.pipe
#                       ^ punctuation.definition.variable
#                             ^ punctuation.definition.parameter
#                             ^^^^^^ variable.parameter.option
function get-something {}
#        @@@@@@@@@@@@@ definition
function Out-WithYou {}
#        @@@@@@@@@@@ definition
 get-thing | Out-WithYou > $null # destroy
#^^^^^^^^^ support.function
#@@@@@@@@@ reference
#            ^^^^^^^^^^^ support.function
#            @@@@@@@@@@@ reference
#          ^ keyword.operator.logical.pipe
#                        ^ keyword.operator.redirection
#                          ^ punctuation.definition.variable
#                           ^ constant.language
#                                ^ punctuation.definition.comment
#                                ^^^^^^^^^ comment.line

function get-number {}
#        @@@@@@@@@@ definition
"When you call a method: $( get-number | %{ invoke-command $( [string]::format("Like (this{0})","what?") ) $var } )"
#                        ^^ punctuation.section.interpolation.begin - source.powershell.embedded
#                           @@@@@@@@@@ reference
#                                           @@@@@@@@@@@@@@ reference
#                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.powershell.embedded
#                                      ^ keyword.operator.logical.pipe
#                                                           ^ meta.group.complex.subexpression punctuation.section.group.begin
#                                                              ^^^^^^ storage.type
#                                                                     ^^ punctuation.accessor.double-colon
#                                                                       ^^^^^^ meta.function-call variable.function
#                                                                       @@@@@@ reference
#                                                                             ^ meta.group.complex.subexpression punctuation.section.arguments.begin
#                                                                                                      ^ meta.group.complex.subexpression punctuation.section.arguments.end
#                                                                                                        ^ meta.group.complex.subexpression punctuation.section.group.end
#                                                                                                          ^ punctuation.definition.variable
#                                                                                                                 ^ punctuation.section.interpolation.end - source.powershell.embedded

    ([MyType])::Name[2]
#   ^^^^^^^^^^ meta.group.powershell
#   ^ punctuation.section.group.begin.powershell
#    ^ punctuation.section.brackets.begin.powershell
#     ^^^^^^ support.type.powershell
#           ^ punctuation.section.brackets.end.powershell
#            ^ punctuation.section.group.end.powershell
#             ^^ punctuation.accessor.double-colon.powershell
#               ^^^^ variable.other.member.powershell
#                   ^^^ meta.brackets.indexer.powershell
#                   ^ punctuation.section.brackets.begin.powershell
#                    ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                     ^ punctuation.section.brackets.end.powershell
    ([MyType])::Name.ToString()[2]
#   ^^^^^^^^^^ meta.group.powershell
#   ^ punctuation.section.group.begin.powershell
#    ^ punctuation.section.brackets.begin.powershell
#     ^^^^^^ support.type.powershell
#           ^ punctuation.section.brackets.end.powershell
#            ^ punctuation.section.group.end.powershell
#             ^^ punctuation.accessor.double-colon.powershell
#               ^^^^ variable.other.member.powershell
#                   ^ punctuation.accessor.dot.powershell
#                    ^^^^^^^^ meta.function-call.powershell variable.function.powershell
#                    @@@@@@@@ reference
#                            ^^ meta.function-call.arguments.powershell
#                            ^ punctuation.section.arguments.begin.powershell
#                             ^ punctuation.section.arguments.end.powershell
#                              ^^^ meta.brackets.indexer.powershell
#                              ^ punctuation.section.brackets.begin.powershell
#                               ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                                ^ punctuation.section.brackets.end.powershell

"This is the DebugPreference variable: $DebugPreference"
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
#                                      ^^^^^^^^^^^^^^^^ meta.string meta.interpolation variable.language - string

 $ConfirmPreference $DebugPreference $ErrorActionPreference $ErrorView
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                   ^ variable.language punctuation
#                    ^^^^^^^^^^^^^^^ variable.language - punctuation
#                                    ^ variable.language punctuation
#                                     ^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                                           ^ variable.language punctuation
#                                                            ^^^^^^^^^ variable.language - punctuation
 $FormatEnumerationLimit $InformationPreference $LogCommandHealthEvent
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                        ^ variable.language punctuation
#                         ^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                               ^ variable.language punctuation
#                                                ^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation

 $LogCommandLifecycleEvent $LogEngineHealthEvent $LogEngineLifecycleEvent
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                          ^ variable.language punctuation
#                           ^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                                ^ variable.language punctuation
#                                                 ^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $LogProviderHealthEvent $LogProviderLifecycleEvent $MaximumAliasCount
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                        ^ variable.language punctuation
#                         ^^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                                   ^ variable.language punctuation
#                                                    ^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $MaximumDriveCount $MaximumErrorCount $MaximumFunctionCount $MaximumHistoryCount
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                   ^ variable.language punctuation
#                    ^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                      ^ variable.language punctuation
#                                       ^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                                            ^ variable.language punctuation
#                                                             ^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $MaximumVariableCount $OFS $OutputEncoding $PSCulture $PSDebugContext
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                      ^ variable.language punctuation
#                       ^^^ variable.language - punctuation
#                           ^ variable.language punctuation
#                            ^^^^^^^^^^^^^^ variable.language - punctuation
#                                           ^ variable.language punctuation
#                                            ^^^^^^^^^ variable.language - punctuation
#                                                      ^ variable.language punctuation
#                                                       ^^^^^^^^^^^^^^ variable.language - punctuation
 $PSDefaultParameterValues $PSEmailServer $PSItem $PSModuleAutoLoadingPreference
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                          ^ variable.language punctuation
#                           ^^^^^^^^^^^^^ variable.language - punctuation
#                                         ^ variable.language punctuation
#                                          ^^^^^^ variable.language - punctuation
#                                                 ^ variable.language punctuation
#                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $PSModuleAutoloadingPreference $PSSenderInfo $PSSessionApplicationName
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                               ^ variable.language punctuation
#                                ^^^^^^^^^^^^ variable.language - punctuation
#                                             ^ variable.language punctuation
#                                              ^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $PSSessionConfigurationName $PSSessionOption $ProgressPreference
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                            ^ variable.language punctuation
#                             ^^^^^^^^^^^^^^^ variable.language - punctuation
#                                             ^ variable.language punctuation
#                                              ^^^^^^^^^^^^^^^^^^ variable.language - punctuation
 $VerbosePreference $WarningPreference $WhatIfPreference
#^ variable.language punctuation
# ^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                   ^ variable.language punctuation
#                    ^^^^^^^^^^^^^^^^^ variable.language - punctuation
#                                      ^ variable.language punctuation
#                                       ^^^^^^^^^^^^^^^^ variable.language - punctuation
<#
.SYNOPSIS
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^ keyword.other.documentation
.DESCRIPTION
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^ keyword.other.documentation
.PARAMETER
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^ keyword.other.documentation
.EXAMPLE
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^ keyword.other.documentation
.INPUTS
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^ keyword.other.documentation
.OUTPUTS
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^ keyword.other.documentation
.NOTES
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^ keyword.other.documentation
.LINK
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^ keyword.other.documentation
.COMPONENT
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^ keyword.other.documentation
.ROLE
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^ keyword.other.documentation
.FUNCTIONALITY
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^^^ keyword.other.documentation
.FORWARDHELPTARGETNAME
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^^^^^^^^^^^ keyword.other.documentation
.FORWARDHELPCATEGORY
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^^^^^^^^^ keyword.other.documentation
.REMOTEHELPRUNSPACE
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^^^^^^^^ keyword.other.documentation
.EXTERNALHELP
#<- comment.block comment.documentation.embedded punctuation.definition.keyword.documentation
#^^^^^^^^^^^^ keyword.other.documentation
#>

#region Test
#<- punctuation.definition.comment
#^^^^^^ keyword.other.region.begin
#<- comment.line.powershell
#       ^^^^ meta.toc-list entity.name.section
#       @@@@ local-definition
#           ^ meta.fold.begin
#endregion (More comments)
#<- punctuation.definition.comment.powershell
#^^^^^^^^^ keyword.other.region.end.powershell
#<- comment.line
#                         ^ meta.fold.end

#region
#<- punctuation.definition.comment
#^^^^^^ keyword.other.region.begin
#<- comment.line.powershell
#      ^ meta.fold.begin
#endregion (More comments)
#<- punctuation.definition.comment.powershell
#^^^^^^^^^ keyword.other.region.end.powershell
#<- comment.line
#                         ^ meta.fold.end
