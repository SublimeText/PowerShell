# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace System.Management.Automation
# <- keyword.control.using
#     ^ keyword.other
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter
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
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
#^^^^^^^^ keyword.control.import.require
#         ^^^^^^^^ variable.parameter
#                            ^ punctuation.separator
#                                ^^^^^^^^^^ meta.requires meta.hashtable variable.other.readwrite
#                                          ^ meta.requires meta.hashtable
#                                           ^^^^^^^^^^^^^^^^ meta.requires meta.hashtable string.quoted.double
#                                                           ^ meta.requires meta.hashtable punctuation.terminator.statement
#                                                             ^^^^^^^^^^^^^ meta.requires meta.hashtable variable.other.readwrite
#                                                                          ^ meta.requires meta.hashtable
#                                                                           ^^^^^^^^^ meta.requires meta.hashtable string.quoted.double

throw "Do not run this file!"
# <- keyword.control
#     ^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double

# Stop parsing
& tool.exe /arg1 'value' /arg2 $value --% /arg3 $value /arg4 "value" # Comment
# <- keyword.operator.background
# ^^^^^^^^ variable.function
#          ^ punctuation.definition.parameter
#          ^^^^^ variable.parameter.option
#                        ^ punctuation.definition.parameter
#                        ^^^^^ variable.parameter.option
#                                     ^^^ keyword.control
#                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted - constant - variable - comment

& gnutool.exe -s 'short option' --long-option --very_long_option value +plus-option
#<- keyword.operator.background
# ^^^^^^^^^^^ variable.function
#             ^ variable.parameter.option punctuation.definition.parameter
#              ^ variable.parameter.option
#                               ^^ variable.parameter.option punctuation.definition.parameter
#                                             ^^ variable.parameter.option punctuation.definition.parameter
#                                               ^^^^^^^^^^^^^^^^ variable.parameter.option
#                                                                      ^ variable.parameter.option punctuation.definition.parameter
#                                                                       ^^^^^^^^^^^ variable.parameter.option 

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
# <- punctuation.definition.variable
#^ variable.language
#   ^ punctuation.definition.variable
#   ^^ variable.language
#       ^ punctuation.definition.variable
#       ^^ variable.language
#           ^ punctuation.definition.variable
#           ^^ variable.language
$args
# <- punctuation.definition.variable
#^^^^ variable.language
$error
# <- punctuation.definition.variable
# ^^^^ variable.language
$home
# <- punctuation.definition.variable
# ^^^ support.constant.variable
$foreach
# <- punctuation.definition.variable
#^^^^^^^ variable.language

# Normal variables
$variable
# <- punctuation.definition.variable
# ^ variable.other.readwrite
$script:variable
# <- variable.other.readwrite punctuation.definition.variable
# ^ storage.modifier.scope
#       ^ variable.other.readwrite
$ENV:ComputerName
# <- variable.other.readwrite punctuation.definition.variable
# ^ support.variable.drive
#    ^ variable.other.readwrite
${variable}
# <- variable.other.readwrite punctuation.definition.variable
 # <- punctuation.section.braces.begin
# ^^^^^^^^ variable.other.readwrite
#         ^ punctuation.section.braces.end
${script:variable}
# <- variable.other.readwrite punctuation.definition.variable
 # <- punctuation.section.braces.begin
# ^ storage.modifier.scope
#        ^ variable.other.readwrite
#                ^ punctuation.section.braces.end

# Variable properties should be highlighted
$variable.Name
# <- variable.other.readwrite punctuation.definition.variable
#^^^^^^^^ variable.other.readwrite
#        ^ punctuation.accessor.dot
#        ^^^^^ - variable.other.readwrite
#         ^^^^ variable.other.member

# Variable properties should be highlighted
$variable.Name.Method( )
# <- variable.other.readwrite punctuation.definition.variable
#^^^^^^^^ variable.other.readwrite
#        ^ punctuation.accessor.dot
#         ^^^^ variable.other.member
#             ^ punctuation.accessor.dot
#              ^^^^^^ meta.function-call variable.function
#              @@@@@@ reference
#                    ^^^ meta.function-call.arguments
#        ^^^^^^^^^^^^^^^ - variable.other.readwrite
#                       ^ - meta.function-call

# Hashtable
$properties = @{
# <- punctuation.definition.variable
# ^ variable.other.readwrite
#           ^ keyword.operator.assignment
#             ^ keyword.other.hashtable.begin
#              ^ punctuation.section.braces.begin
    Name      = 'Name'
    # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
    #         ^ meta.hashtable meta.hashtable.assignment keyword.operator.assignment
    #           ^ meta.hashtable string.quoted.single
    Something = $else
    # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
    # Atom-grammar-test is not tokenizing this correctly... Need to test in Atom - TODO
    Number    = 16
    # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
    #         ^ meta.hashtable meta.hashtable.assignment keyword.operator.assignment
    #           ^^ meta.hashtable meta.number.integer.decimal constant.numeric.value
    from      = 'hello world'
    # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
    #         ^ meta.hashtable meta.hashtable.assignment keyword.operator.assignment
    #           ^^^^^^^^^^^^^ meta.hashtable string.quoted.single
    hash      = @{
    # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
    #         ^ meta.hashtable meta.hashtable.assignment keyword.operator.assignment
    #           ^ keyword.other.hashtable.begin
    #            ^ punctuation.section.braces.begin
        hello = 'world'
        # <- meta.hashtable meta.hashtable.assignment variable.other.readwrite
        #     ^ meta.hashtable meta.hashtable.assignment keyword.operator.assignment
        #       ^^^^^^^ meta.hashtable string.quoted.single
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

# Types
[string]
# <- punctuation.section.brackets.begin
# ^ storage.type
#      ^ punctuation.section.brackets.end
[string[]]
# <- punctuation.section.brackets.begin
# ^ storage.type
#      ^ punctuation.section.brackets.begin
#       ^^ punctuation.section.brackets.end
[int32]
# <- punctuation.section.brackets.begin
# ^^^^ storage.type
#     ^ punctuation.section.brackets.end
[System.Collections.Generic.Dictionary[[System.String, mscorlib],[System.Management.Automation.ParameterMetadata,System.Management.Automation]]]
# <- punctuation.section.brackets.begin
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ storage.type
#                                     ^^ punctuation.section.brackets.begin
#                                       ^^^^^^^^^^^^^ storage.type
#                                                      ^^^^^^^^  storage.type
#                                                              ^ punctuation.section.brackets.end
#                                                                ^ punctuation.section.brackets.begin
#                                                                 ^^^^^^^^^^^^^^^^ storage.type
#                                                                                                                                            ^^^ punctuation.section.brackets.end
[System.Array+SZArrayEnumerator]
# <- punctuation.section.brackets.begin
# ^^^^^^^^^^^ storage.type
#             ^^^^^^^^^^^^^^^^^ storage.type
#                              ^ punctuation.section.brackets.end
[int]::MinValue
# <- punctuation.section.brackets.begin
# ^ storage.type
#   ^ punctuation.section.brackets.end
#    ^^ punctuation.accessor.double-colon
#      ^^^^^^^^ variable.other.member
[System.DateTime]::Parse('2016/09/21')
# <- punctuation.section.brackets.begin
# ^^^^^^^^^^^^^^ storage.type
#               ^ punctuation.section.brackets.end
#                ^^ punctuation.accessor.double-colon
#                  ^^^^^ meta.function-call variable.function
#                  @@@@@ reference
#                       ^^^^^^^^^^^^^^ meta.function-call.arguments
#                       ^ punctuation.section.arguments.begin
#                                    ^ punctuation.section.arguments.end

# Commands (functions)
 Invoke-Something -foobar
#^ support.function
#                 ^ punctuation.definition.parameter
#                 ^^^^^^^ variable.parameter.option
#@@@@@@@@@@@@@@@@ reference
 Invoke-Something -foobar value
#^ support.function
#                 ^ punctuation.definition.parameter
#                 ^^^^^^^ variable.parameter.option
#@@@@@@@@@@@@@@@@ reference
 Invoke-Something -foobar:$true
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^^^^^ variable.parameter.option
#                         ^ punctuation.definition.variable
#                          ^^^^ constant.language
 Invoke-Something -foobar: $true
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^^^^^ variable.parameter.option
 Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^ variable.parameter.option
#                        ^ punctuation.definition.parameter
#                        ^^^ variable.parameter.option
#                            ^^ meta.number.integer.decimal constant.numeric.value
#                                            ^^^^^^ - keyword
#                               ^ punctuation.definition.parameter
#                               ^^^ variable.parameter.option
 Invoke-Something (1..20 | Invoke-Something) -p2 'value'
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                          @@@@@@@@@@@@@@@@ reference
#                   ^^ keyword.operator.range
 Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
#^ support.function
#                                 @@@@@@@@@@@@@@@@ reference
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^ variable.parameter.option
#                        ^ punctuation.definition.parameter
#                        ^^^ variable.parameter.option
#                            ^^ meta.number.integer.decimal constant.numeric.value
#                               ^ keyword.operator.logical.pipe
#                                 ^ support.function
#                                                  ^ punctuation.definition.parameter
#                                                  ^^^^^^^ variable.parameter.option - keyword
 Invoke-Something -p1 {
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^ variable.parameter.option
    Invoke-Something -foobar:$true
#   ^ support.function
#   @@@@@@@@@@@@@@@@ reference
#                    ^ punctuation.definition.parameter
#                    ^^^^^^^ variable.parameter.option
#                            ^ punctuation.definition.variable
#                             ^^^^ constant.language
} | Invoke-Something
# <- punctuation.section.braces.end
# ^ keyword.operator.logical.pipe
#   ^ support.function
#   @@@@@@@@@@@@@@@@ reference
 Invoke-Something -p1 value `
#^ support.function
#@@@@@@@@@@@@@@@@ reference
#                 ^ punctuation.definition.parameter
#                 ^^^ variable.parameter.option
#                           ^ punctuation.separator.continuation
    -p2 14.4 `
#   ^ punctuation.definition.parameter
#   ^^^ variable.parameter.option
#       ^^^^ meta.number.float.decimal constant.numeric.value
#            ^ punctuation.separator.continuation
    -p3 $value | Invoke-Something -verbose
#   ^ punctuation.definition.parameter
#   ^^^ variable.parameter.option
#                @@@@@@@@@@@@@@@@ reference
#                                 ^ punctuation.definition.parameter
#                                 ^^^^^^^^ variable.parameter.option
#       ^ punctuation.definition.variable
#              ^ keyword.operator.logical.pipe
#                ^^^^^^^^^^^^^^^^ support.function

# Commands (Built-in variables)
ls *.ps1 -recurse
#  ^ keyword.operator
#        ^ punctuation.definition.parameter
#        ^^^^^^^^ variable.parameter.option

# Commands (executable files)
. .\scripts\myscript.ps1 -parameter 'value'
# <- support.function.source.powershell
#                        ^ punctuation.definition.parameter
#                        ^^^^^^^^^^ variable.parameter.option
#                                   ^^^^^^^ string.quoted.single
& tool.exe
# <- keyword.operator.background
# ^^^^^^^^ variable.function
something.cmd
#^^^^^^^^^^^^ variable.function
 øyvind.com
#^^^^^^^^^^ variable.function

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

# Functions and filters
functioN MyFunction{}
# <- storage.type
#        ^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@ definition
#                  ^ punctuation.section.braces.begin
#                   ^ punctuation.section.braces.end
function My-Function         {}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@@ definition
#                            ^ punctuation.section.braces.begin
#                             ^ punctuation.section.braces.end
Function My.Function{}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@@ definition
#                   ^ punctuation.section.braces.begin
#                    ^ punctuation.section.braces.end
function My-Function.Other{}
# <- storage.type
#        ^^^^^^^^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@@@@@@@@ definition
#                         ^ punctuation.section.braces.begin
#                          ^ punctuation.section.braces.end
function Some.other.function{}
# <- storage.type
#        ^^^^^^^^^^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@@@@@@@@@@ definition
#                           ^ punctuation.section.braces.begin
#                            ^ punctuation.section.braces.end
FUNCTION MyFunction2 {}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@@ definition
#                    ^ punctuation.section.braces.begin
#                     ^ punctuation.section.braces.end
function New-File { }
# <- storage.type
#        ^^^^^^^^ entity.name.function
#        @@@@@@@@ definition
#                 ^ punctuation.section.braces.begin
#                   ^ punctuation.section.braces.end
function New-File ($Name) { }
# <- storage.type
#        ^^^^^^^^ entity.name.function
#        @@@@@@@@ definition
#                         ^ punctuation.section.braces.begin
#                           ^ punctuation.section.braces.end
 New-File
#^^^^^^^^ meta.function-call support.function
#@@@@@@@@ reference
function NewFile($Name) { }
# <- storage.type
#        ^^^^^^^ entity.name.function
#        @@@@@@@ definition
#               ^ punctuation.section.group.begin
#                ^ punctuation.definition.variable
#                   ^ variable.other.readwrite
#                     ^ punctuation.section.group.end
#                       ^ punctuation.section.braces.begin
#                         ^ punctuation.section.braces.end
filter myfilter($param) {}
# <- storage.type
#      ^^^^^^^^ entity.name.function
#      @@@@@@@@ definition
#              ^ punctuation.section.group.begin
#               ^ punctuation.definition.variable
#                ^ variable.other.readwrite
#                     ^ punctuation.section.group.end
#                       ^ punctuation.section.braces.begin
#                        ^ punctuation.section.braces.end
Filter my-Filter ($param){}
# <- storage.type
#      ^^^^^^^^^ entity.name.function
#      @@@@@@@@@ definition
#                ^ punctuation.section.group.begin
#                 ^ punctuation.definition.variable
#                   ^ variable.other.readwrite
#                       ^ punctuation.section.group.end
#                        ^ punctuation.section.braces.begin
#                         ^ punctuation.section.braces.end

# Note that the # in the path should highlight as a comment!
function Test-Drive([string]$roman) {
# <- storage.type
#        ^^^^^^^^^^ entity.name.function
#        @@@@@@@@@@ definition
#                  ^ punctuation.section.group.begin
#                   ^ punctuation.section.brackets.begin
#                    ^^^^^^ storage.type
#                          ^ punctuation.section.brackets.end
#                           ^ punctuation.definition.variable
#                            ^ variable.other.readwrite
#                                 ^ punctuation.section.group.end
#                                   ^ punctuation.section.braces.begin
    $roman | c:\users\Me\Documents\Programming\F#\test.exe $roman
#   ^ punctuation.definition.variable
#    ^ variable.other.readwrite
#          ^ keyword.operator.logical.pipe
#                                               ^ punctuation.definition.comment
#                                                       ^^^^ comment.line
}
# <- punctuation.section.braces.end

function Verb-Noun
#^^^^^^^^^^^^^^^^^ meta.function
#^^^^^^^ storage.type
#        ^^^^^^^^^ meta.function entity.name.function
#        @@@@@@@@@ definition
{
# <- punctuation.section.braces.begin

    Param
   #^^^^^ keyword.declaration.parameter
    (
    # <- punctuation.section.group.begin
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
    # <- punctuation.section.group.end

    # Do Something....

}
# <- punctuation.section.braces.end

# Class
class Vehicle {
# <- storage.type.class
#     ^^^^^^^ entity.name.class
#     @@@@@@@ definition
#             ^ punctuation.section.braces.begin
    Vehicle() {}
#          ^ punctuation.section.group.begin
#           ^ punctuation.section.group.end
#             ^ punctuation.section.braces.begin
#              ^ punctuation.section.braces.end
    Vehicle([string]$Owner) {
#             ^ storage.type
#                   ^ punctuation.definition.variable
#                    ^ variable.other.readwrite
#                           ^ punctuation.section.braces.begin
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
#    ^^^^ storage.type
#         ^^^^^ meta.function entity.name.function
#         @@@@@ definition
#                ^^^ storage.type
#                    ^ punctuation.definition.variable
#                     ^ variable.other.readwrite
        $this.Mileage += $NumberOfMiles
#       ^^^^^ variable.language
#       ^ punctuation.definition.variable
#             ^^^^^^^ variable.other.member
#                     ^^ keyword.operator.assignment

    }
    # <- punctuation.section.braces.end
    static [System.Array] GetAvailableColors() {
#                         ^^^^^^^^^^^^^^^^^^ meta.function entity.name.function
#                         @@@@@@@@@@@@@@@@@@ definition
#   ^^^^^^ meta.function storage.modifier
#           ^^^^^^^^^^^ meta.function storage.type
        return 'yellow', 'red'
    }
}
# <- punctuation.section.braces.end

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

# Reserved words
Configuration Crazyness {
# <- storage.type
#             ^^^^^^^^^ entity.name.function
#             @@@@@@@@@ definition
#                       ^ punctuation.section.braces.begin
    Node Whatever {
#                 ^ punctuation.section.braces.begin
    }
    # <- punctuation.section.braces.end
}
# <- punctuation.section.braces.end

# Redirection
notepad.exe > log.txt
#^^^^^^^^^^ variable.function
#           ^ keyword.operator.redirection
notepad.exe 1> log.txt
#^^^^^^^^^^ variable.function
#            ^ keyword.operator.redirection
notepad.exe *> log.txt
#^^^^^^^^^^ variable.function
#            ^ keyword.operator.redirection
notepad.exe 2>&1
#^^^^^^^^^^ variable.function
#            ^^ keyword.operator.redirection
notepad.exe  3>&1
#^^^^^^^^^^ variable.function
#             ^^ keyword.operator.redirection
notepad.exe 4>&1
#^^^^^^^^^^ variable.function
#            ^^ keyword.operator.redirection
notepad.exe 5>&1
#^^^^^^^^^^ variable.function
#            ^^ keyword.operator.redirection
notepad.exe 6>&1
#^^^^^^^^^^ variable.function
#            ^^ keyword.operator.redirection
notepad.exe 2>&1> log.txt
#^^^^^^^^^^ variable.function
#            ^^ keyword.operator.redirection
#               ^ keyword.operator.redirection

# Operators
if (10 -cgt 100) { }
# <- keyword.control
#  ^ punctuation.section.group.begin
#   ^^ meta.number.integer.decimal constant.numeric.value
#      ^^^^ keyword.operator.comparison
#           ^^^ meta.number.integer.decimal constant.numeric.value
#              ^ punctuation.section.group.end
#                ^ punctuation.section.braces.begin
#                  ^  punctuation.section.braces.end
$a -is $b
#  ^^^ keyword.operator.logical
$b -contains $c
#  ^^^^^^^^^ keyword.operator.logical
$x -notcontains $c
#  ^^^^^^^^^^^^ keyword.operator.logical
$c -in $b
#  ^^^ keyword.operator.logical
$c -notin $x
#  ^^^^^^ keyword.operator.logical
$a -match $b
#  ^^^^^^ keyword.operator.logical
$a -notmatch $b
#  ^^^^^^^^^ keyword.operator.logical
$x -like $c
#  ^^^^^ keyword.operator.logical
100 -and 0
#   ^^^^ keyword.operator.logical
#        ^ meta.number.integer.decimal constant.numeric.value
$a -ceq 4 -and $a -ine $d -or
#  ^^^^ keyword.operator.comparison
#       ^ meta.number.integer.decimal constant.numeric.value
#         ^^^^ keyword.operator.logical
#              ^ punctuation.definition.variable
#                 ^^^^ keyword.operator.comparison
#                         ^^^ keyword.operator.logical
$c -is [Type]
#  ^^^ keyword.operator.logical
#       ^ storage.type
$c -isnot [Type]
#  ^^^^^^ keyword.operator.logical
#          ^ storage.type
$c -as [Type]
#  ^^^ keyword.operator.cast
#       ^ storage.type
$k = $y -bor $k
#  ^ keyword.operator.assignment
#       ^ keyword.operator.bitwise
$x = $y -band $x
#  ^ keyword.operator.assignment
#       ^ keyword.operator.bitwise
$z = -bnot $x
#  ^ keyword.operator.assignment
#    ^ keyword.operator.bitwise
$l = 1 -shl 10
#  ^ keyword.operator.assignment
#    ^ meta.number.integer.decimal constant.numeric.value
#           ^^ meta.number.integer.decimal constant.numeric.value
#      ^^^^ keyword.operator.bitwise
$r = 10 -shr 1
#  ^ keyword.operator.assignment
#    ^^ meta.number.integer.decimal constant.numeric.value
#            ^ meta.number.integer.decimal constant.numeric.value
#       ^^^^ keyword.operator.bitwise
$k = $y -xor $b
#  ^ keyword.operator.assignment
#       ^ keyword.operator.logical
$k = $y -bxor $b
#  ^ keyword.operator.assignment
#       ^ keyword.operator.bitwise
$a -icontains $c
#  ^^^^^^^^^^ keyword.operator.logical
$a -ccontains $c
#  ^^^^^^^^^^ keyword.operator.logical
$a -iNotContains $c
#  ^^^^^^^^^^^^^ keyword.operator.logical
$a -cNotContains $c
#  ^^^^^^^^^^^^^ keyword.operator.logical
$a -cmatch $c
#  ^^^^^^^ keyword.operator.logical
$x -iMatch $c
#  ^^^^^^^ keyword.operator.logical
$x -iNotMatch $c
#  ^^^^^^^^^^ keyword.operator.logical
$a -iLike $b
#  ^^^^^^ keyword.operator.logical
$b -cLike $c
#  ^^^^^^ keyword.operator.logical
"hey" -cgt "Hey"
#     ^^^^ keyword.operator.comparison
"Hey" -igt "hey"
#     ^^^^ keyword.operator.comparison
"hey" -cge "Hey"
#     ^^^^ keyword.operator.comparison
"Hey" -ige "hey"
#     ^^^^ keyword.operator.comparison
"HEY" -clt "hey"
#     ^^^^ keyword.operator.comparison
"HEY" -ilt "hey"
#     ^^^^ keyword.operator.comparison
"HEY" -cle "hey"
#     ^^^^ keyword.operator.comparison
"HEY" -ile "hey"
#     ^^^^ keyword.operator.comparison

function Test-Function {}
#        @@@@@@@@@@@@@ definition
function New-Object {}
#        @@@@@@@@@@ definition
# Misc test cases
 Test-Function -Class ClassName
#               ^^^^^ - storage.type
#@@@@@@@@@@@@@ reference
 New-Object -TypeName System.Diagnostics.Process
#                                        ^^^^^^^ - keyword.control
#@@@@@@@@@@ reference
 New-Object -TypeName System.Data
#                            ^^^^ - keyword.control
#@@@@@@@@@@ reference
 New-Object -TypeName Sy-stem.if
#                             ^^ - keyword.control
#@@@@@@@@@@ reference
 New-Object -TypeName S_ystem.Clean
#                             ^^^^^ - keyword.control
#@@@@@@@@@@ reference
 New-Object -TypeName Sy_stem-.Throw
#                              ^^^^^ - keyword.control
#@@@@@@@@@@ reference
echo `"test`"
#    ^^^^^^^^^ - string.quoted
#    ^^ constant.character.escape
#          ^^ constant.character.escape
@("any","array","has").foreach({ $_ })
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.block
@('any','array','has').foreach{ $_ }
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.block
@("any","array","has").where({ $_.Length -gt 3 })
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.block
@("any","array","has").where{ $_.Length -gt 3 }
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.block
function join-path {}
#        @@@@@@@@@ definition
$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
# <- punctuation.definition.variable
#       @@@@@@@@@ reference
#            ^ support.function
#                  ^ support.variable.drive
#                         ^ variable.other.readwrite
#                                   ^^ meta.string meta.interpolation punctuation.section.interpolation.begin
#                                        ^ storage.type
#                                                       @@@@@@@@@@@@@@@@@ reference
function out-file {}
#        @@@@@@@@ definition
$ScriptBlock | Out-File $file -Force
# <- punctuation.definition.variable
#              @@@@@@@@ reference
#            ^ keyword.operator.logical.pipe
#                       ^ punctuation.definition.variable
#                             ^ punctuation.definition.parameter
#                             ^^^^^^ variable.parameter.option
workflow w1 {}
# <- storage.type
#        ^^ entity.name.function
#        @@ definition
#           ^ punctuation.section.braces.begin
#            ^ punctuation.section.braces.end
Workflow work { sequence {} }
# <- storage.type
#        ^^^^ entity.name.function
#        @@@@ definition
#             ^ punctuation.section.braces.begin
#               ^^^^^^^^ keyword.control
#                        ^ punctuation.section.braces.begin
#                         ^ punctuation.section.braces.end
#                           ^ punctuation.section.braces.end
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
