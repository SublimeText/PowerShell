# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace System.Management.Automation
# <- keyword.control.using
#     ^ keyword.other
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter
#Requires -PSSnapin DiskSnapin -Version 1.2
# <- punctuation.definition.keyword
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.requires
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
# <- keyword.operator.other
# ^^^^^^^^ variable.function
#          ^ punctuation.definition.parameter
#          ^^^^^ variable.parameter.option
#                        ^ punctuation.definition.parameter
#                        ^^^^^ variable.parameter.option
#                                     ^^^ keyword.control
#                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted - constant - variable - comment

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

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^ meta.string string.quoted.double
#           ^^^^^^^^^ meta.interpolation variable.other.readwrite - string
#           ^ punctuation.definition.variable
#                    ^^^^^^ meta.string string.quoted.double - meta.interpolation - variable - punctuation
#                          ^ punctuation.definition.string.end

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^ meta.string string.quoted.double
#           ^^^^^^^^^^^^^^^^^ meta.string meta.interpolation - string
#                            ^^ meta.string string.quoted.double - meta.interpolation
#           ^^ punctuation.section.interpolation.begin
#             ^^^^^^^^^ variable.other.readwrite
#             ^ punctuation.definition.variable
#                      ^ punctuation.accessor.dot
#                       ^^^^ variable.other.member
#                           ^ punctuation.section.interpolation.end
#                             ^ punctuation.definition.string.end

# $ENV:ComputerName should be highlighted
"This is the name of my computer: $ENV:ComputerName"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
#                                 ^^^^^^^^^^^^^^^^^ meta.string meta.interpolation - string
#                                 ^ punctuation.definition.variable
#                                  ^^^^ support.variable.drive
#                                      ^^^^^^^^^^^^ variable.other.readwrite
#                                                  ^ punctuation.definition.string.end

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
#                                 ^^^^^^^^^^^^^^^^^^^ meta.string meta.interpolation - string
#                                 ^ punctuation.definition.variable
#                                  ^ punctuation.section.braces.begin
#                                   ^^^^ support.variable.drive
#                                       ^^^^^^^^^^^^ variable.other.readwrite
#                                                    ^ punctuation.definition.string.end

# The @splat references only work in argument mode, should not highlight in strings
"This is a @double quoted string."
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#          ^ - punctuation.definition.variable
#          ^^^^^^^ - variable

# double check scopes for automatic variables in strings
"$_ $$ $Pwd"
#^^ variable.language
#   ^^ variable.language
#      ^^^^ variable.language

# Single quotes string
'This is a string'
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^ string.quoted.single
#                ^ punctuation.definition.string.end

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
    #           ^^ meta.hashtable constant.numeric.integer
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

# Spatting
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function
#                    ^ punctuation.definition.variable
#                     ^ variable.other.readwrite

# ScriptBlock
    {Invoke-Something @properties}
#   ^ punctuation.section.braces.begin
#    ^^^^^^^^^^^^^^^^ support.function
#                     ^ punctuation.definition.variable
#                      ^ variable.other.readwrite
#                                ^ punctuation.section.braces.end
{
# <- punctuation.section.braces.begin
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function
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
#       ^ constant.numeric.integer
#        ^ punctuation.separator.sequence
#         ^ constant.numeric.integer
#          ^ punctuation.separator.sequence
#           ^ constant.numeric.integer
#            ^ punctuation.separator.sequence
#             ^ constant.numeric.integer
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
#   ^ constant.numeric.integer
#    ^ punctuation.section.brackets.end
#  ^^^ meta.brackets.indexer
$a2[-1]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.brackets.begin
#    ^ constant.numeric.integer
#     ^ punctuation.section.brackets.end
#  ^^^^ meta.brackets.indexer
$a3[1..2]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.brackets.begin
#   ^ constant.numeric.integer
#    ^^ keyword.operator.range
#      ^ constant.numeric.integer
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
#           ^^ constant.numeric.integer
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
#          ^^ constant.numeric.integer
#            ^ punctuation.section.group.end
    $i[($y - 1) + $x]
#   ^ variable.other.readwrite punctuation.definition.variable
#   ^^ variable.other.readwrite
#     ^ punctuation.section.brackets.begin
#      ^ punctuation.section.group.begin
#       ^ variable.other.readwrite punctuation.definition.variable
#       ^^ variable.other.readwrite
#          ^ keyword.operator.arithmetic
#            ^ constant.numeric.integer
#             ^ punctuation.section.group.end
#               ^ keyword.operator.arithmetic
#                 ^ variable.other.readwrite punctuation.definition.variable
#                 ^^ variable.other.readwrite
#                   ^ punctuation.section.brackets.end
#     ^^^^^^^^^^^^^^^ meta.brackets.indexer

# Single quoted strings
    'This is a single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.single
    '$This is a single ''quoted'' string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.single
#                      ^^ constant.character.escape
#                              ^^ constant.character.escape
    'This is a
    single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.single
    'This #also'
#   ^^^^^^^^^^^^ meta.string string.quoted.single
    '$(Invoke-Something)'
#   ^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.single - meta.interpolation - variable - support
    'This "string" is nice.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.single

# Double quoted strings
    "This is a double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
    "$This is a double ""quoted"" string."
#   ^ meta.string string.quoted.double
#    ^^^^^ meta.string meta.interpolation variable.language - string
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double - meta.interpolation
#                      ^^ constant.character.escape
#                              ^^ constant.character.escape
    "This is a
    double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
    "This #also"
#   ^^^^^^^^^^^^ meta.string string.quoted.double
    "$(Invoke-Something)"
#   ^ meta.string string.quoted.double
#    ^^^^^^^^^^^^^^^^^^^ meta.string meta.interpolation - string
#    ^^ punctuation.section.interpolation.begin
#      ^^^^^^^^^^^^^^^^ support.function
#                      ^ punctuation.section.interpolation.end
    "This 'string' is nice."
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double

# Double quoted here-string
@"
# <- string.quoted.double.heredoc
 # <- string.quoted.double.heredoc
$This is a 'double quoted'
# <- punctuation.definition.variable
#^^^^ variable.language
Isn't it "nice"??
There is no @platting here!
#           ^^^^^^^^^ - variable - punctuation
"@
# <- string.quoted.double.heredoc
 # <- string.quoted.double.heredoc

# Numeric constants
    -3
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
    .5
#   ^^ constant.numeric.float
    +.5
#   ^ keyword.operator.unary
#    ^^ constant.numeric.float
    1.
#   ^^ constant.numeric.float
    1.d
#   ^^^ constant.numeric.float
    1.lGB
#   ^^^ constant.numeric.float - unclear whether float or int
#      ^^ keyword.other.unit
    1.dGB
#   ^^^ constant.numeric.float
#      ^^ keyword.other.unit
    1.e+12d
#   ^^^^^^^ constant.numeric.float
    1e+12d
#   ^^^^^^ constant.numeric.float
    1.5
#   ^^^ constant.numeric.float
    -1.5
#   ^ keyword.operator.unary
#    ^^^ constant.numeric.float
    -3 + -2
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
#      ^  keyword.operator.arithmetic
#        ^  keyword.operator.unary
#         ^ constant.numeric.integer
    -3+-2
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
#     ^ keyword.operator.arithmetic
#      ^ keyword.operator.unary
#       ^ constant.numeric.integer
    3++2
#   ^ constant.numeric.integer
#    ^ keyword.operator.arithmetic
#     ^ keyword.operator.unary
#      ^ constant.numeric.integer
    +2
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
    -3+-
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
#     ^^ keyword.operator
    10/-10
#   ^^ constant.numeric.integer
#       ^^ constant.numeric.integer
#     ^ keyword.operator
    10/-10D
#   ^^ constant.numeric.integer
#       ^^^ constant.numeric.float
#     ^ keyword.operator
    -10.002L
#   ^ keyword.operator.unary
#    ^^^^^^^ constant.numeric.float - unclear whether float or int
    $x..5.40D
#   ^ punctuation.definition.variable
#   ^^ variable.other.readwrite
#     ^^ keyword.operator.range
#       ^^^^^ constant.numeric.float
    -500..-495
#   ^ keyword.operator.unary
#    ^^^ constant.numeric.integer
#       ^^ keyword.operator.range
#         ^ keyword.operator.unary
#          ^^^ constant.numeric.integer
    $true..3
#   ^ punctuation.definition.variable
#    ^^^^ constant.language
#        ^^ keyword.operator.range
#          ^ constant.numeric.integer
    -2..$null
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
#     ^^ keyword.operator.range
#       ^^^^^ constant.language
#       ^ punctuation.definition.variable
    -3..3
#   ^ keyword.operator.unary
#    ^ constant.numeric.integer
#       ^ constant.numeric.integer
#     ^^ keyword.operator.range
    1..3
#   ^ constant.numeric.integer
#      ^ constant.numeric.integer
#    ^^ keyword.operator.range
    6,10,-3
#   ^ constant.numeric.integer
#    ^ punctuation.separator.sequence -constant
#     ^^ constant.numeric.integer
#       ^ punctuation.separator.sequence -constant
#         ^ constant.numeric.integer
    0x476
#   ^^ punctuation.definition.numeric.base
#   ^^^^^ constant.numeric.integer.hexadecimal
    +0x20
#   ^ keyword.operator.unary
#    ^^ punctuation.definition.numeric.base
#    ^^^^ constant.numeric.integer.hexadecimal
    -0x20
#   ^ keyword.operator.unary
#    ^^ punctuation.definition.numeric.base
#    ^^^^ constant.numeric.integer.hexadecimal

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
#            ^ keyword.operator
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
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^^^^^ variable.parameter.option
Invoke-Something -foobar value
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^^^^^ variable.parameter.option
Invoke-Something -foobar:$true
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^^^^^ variable.parameter.option
#                        ^ punctuation.definition.variable
#                         ^^^^ constant.language
Invoke-Something -foobar: $true
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^^^^^ variable.parameter.option
Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^ variable.parameter.option
#                       ^ punctuation.definition.parameter
#                       ^^^ variable.parameter.option
#                           ^^ constant.numeric.integer
#                                           ^^^^^^ - keyword
#                              ^ punctuation.definition.parameter
#                              ^^^ variable.parameter.option
Invoke-Something (1..20 | Invoke-Something) -p2 'value'
# <- support.function
#                  ^^ keyword.operator.range
Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^ variable.parameter.option
#                       ^ punctuation.definition.parameter
#                       ^^^ variable.parameter.option
#                           ^^ constant.numeric.integer
#                              ^ keyword.operator.logical.pipe
#                                ^ support.function
#                                                 ^ punctuation.definition.parameter
#                                                 ^^^^^^^ variable.parameter.option - keyword
Invoke-Something -p1 {
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^ variable.parameter.option
    Invoke-Something -foobar:$true
#   ^ support.function
#                    ^ punctuation.definition.parameter
#                    ^^^^^^^ variable.parameter.option
#                            ^ punctuation.definition.variable
#                             ^^^^ constant.language
} | Invoke-Something
# <- punctuation.section.braces.end
# ^ keyword.operator.logical.pipe
#   ^ support.function
Invoke-Something -p1 value `
# <- support.function
#                ^ punctuation.definition.parameter
#                ^^^ variable.parameter.option
#                          ^ punctuation.separator.continuation
    -p2 14.4 `
#   ^ punctuation.definition.parameter
#   ^^^ variable.parameter.option
#       ^^^^ constant.numeric.float
#            ^ punctuation.separator.continuation
    -p3 $value | Invoke-Something -verbose
#   ^ punctuation.definition.parameter
#   ^^^ variable.parameter.option
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
# <- keyword.operator.other
#                        ^ punctuation.definition.parameter
#                        ^^^^^^^^^^ variable.parameter.option
#                                   ^^^^^^^ string.quoted.single
& tool.exe
# <- keyword.operator.other
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
#       ^ constant.numeric.integer
#        ^ punctuation.section.group.end
#          ^ meta.block punctuation.section.braces.begin
#           ^ meta.block punctuation.section.braces.end
switch (4, 2) {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ constant.numeric.integer
#          ^ constant.numeric.integer
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
#        @@@@@@@@@@ definition
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
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
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
        #                   ^ constant.numeric.integer
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
        #              ^ constant.numeric.integer
        #               ^ punctuation.separator
        #                ^ constant.numeric.integer
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
}
# <- punctuation.section.braces.end

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
#   ^^ constant.numeric.integer
#      ^^^^ keyword.operator.comparison
#           ^^^ constant.numeric.integer
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
#        ^ constant.numeric.integer
$a -ceq 4 -and $a -ine $d -or
#  ^^^^ keyword.operator.comparison
#       ^ constant.numeric.integer
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
#    ^ constant.numeric.integer
#           ^^ constant.numeric.integer
#      ^^^^ keyword.operator.bitwise
$r = 10 -shr 1
#  ^ keyword.operator.assignment
#    ^^ constant.numeric.integer
#            ^ constant.numeric.integer
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

# format
    "{0:N2}" -f $a
#   ^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
    "{0:D8}" -f $a
#   ^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
    "{0:C2}" -f $a
#   ^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
    "{0:P0}" -f $a
#   ^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
    "{0:X0}" -f $a
#   ^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
    (1.11).ToString("#.#")
#   ^ punctuation.section.group.begin
#                  ^ punctuation.section.group.begin
#    ^^^^ constant.numeric.float
#                    ^ string.quoted.double
    "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                            ^^ keyword.operator.string-format
#                                                  ^^^ constant.numeric.integer
    ("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
#            ^^ keyword.operator.string-format
#               ^^^^ constant.numeric.float
#                       ^^^^^^^^^^^^^ string.quoted.double
#                                     ^^ keyword.operator.string-format
    "{0:R}" -f (1mb/2.0)
#           ^ keyword.operator.string-format
#               ^ constant.numeric.integer
#                ^^ keyword.other.unit
    "{0:00.0}" -f 4.12341234
#              ^ keyword.operator.string-format
    "{0:##.#}" -f 4.12341234
#          ^ string.quoted.double
#              ^ keyword.operator.string-format
#                 ^^^^^^^^^^ constant.numeric.float.decimal
    "{0:#,#.#}" -f 1234.121234
#         ^ string.quoted.double
#               ^ keyword.operator.string-format
    "{0:##,,.000}" -f 1048576
#          ^ string.quoted.double
#                  ^ keyword.operator.string-format
    "{this is not a #comment}"
#                   ^ - comment
    "{0:##.#E000}" -f 2.71828
#           ^ string.quoted.double
#                  ^ keyword.operator.string-format
    "{0:#.00'##'}" -f 2.71828
#            ^ string.quoted.double
#                  ^ keyword.operator.string-format
    "{0:POS;NEG;ZERO}" -f -14
#              ^ string.quoted.double
#                      ^ keyword.operator.string-format
    "{0:$## Please}" -f 14
#         ^ string.quoted.double
#                    ^ keyword.operator.string-format
    "{0,-8:P1}" -f 1.75
#       ^ string.quoted.double
#               ^ keyword.operator.string-format
    "{0,10:N3}{1,10:N3}{2,10:N3}{3,10:N3}" -f 0.2, 0.3, 0.45, 0.91
#                                          ^ keyword.operator.string-format
    '{0:00000.000}' -f 7.125
#         ^ string.quoted.single
#                   ^ keyword.operator.string-format

# Misc test cases
Test-Function -Class ClassName
#              ^^^^^ - storage.type
New-Object -TypeName System.Diagnostics.Process
#                                       ^^^^^^^ - keyword.control
New-Object -TypeName System.Data
#                           ^^^^ - keyword.control
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
$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
# <- punctuation.definition.variable
#            ^ support.function
#                  ^ support.variable.drive
#                         ^ variable.other.readwrite
#                                   ^^ meta.string meta.interpolation punctuation.section.interpolation.begin
#                                        ^ storage.type
#                                                       @@@@@@@@@@@@@@@@@ reference
$ScriptBlock | Out-File $file -Force
# <- punctuation.definition.variable
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
get-thing | Out-WithYou > $null # destroy
# ^^^^^^^ support.function
#           ^^^^^^^^^^^ support.function
#         ^ keyword.operator.logical.pipe
#                       ^ keyword.operator.redirection
#                         ^ punctuation.definition.variable
#                          ^ constant.language
#                               ^ punctuation.definition.comment
#                               ^^^^^^^^^ comment.line
"Escaped chars: `", `n, `$, `b, `t, `e, `u{10ffff}, `""
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#               ^^ constant.character.escape
#                   ^^ constant.character.escape
#                       ^^ constant.character.escape
#                           ^^ constant.character.escape
#                               ^^ constant.character.escape
#                                   ^^ constant.character.escape
#                                       ^^^^^^^^^^ constant.character.escape
#                                                   ^^ constant.character.escape
'But here they''re not escape chars: `", `n, `$, `b, `"'
#             ^^ constant.character.escape
#                                   ^^^^^^^^^^^^^^^^^^^ - constant
"When you call a method: $( get-number | %{ invoke-command $( [string]::format("Like (this{0})","what?") ) $var } )"
#                        ^^ punctuation.section.interpolation.begin
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
