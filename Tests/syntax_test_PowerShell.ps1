# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace System.Management.Automation
# <- keyword.control.using
#     ^ keyword.other
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter
#Requires -PSSnapin DiskSnapin -Version 1.2
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^^ meta.requires keyword.other
#                   ^^^^^^^^^^ meta.requires variable.parameter
#                              ^^^^^^^^ meta.requires keyword.other
#                                       ^^^ meta.requires variable.parameter
#Requires -PSSnapin DiskSnapin
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^^ meta.requires keyword.other
#                   ^^^^^^^^^^ meta.requires variable.parameter
#Requires -Version 3
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^ meta.requires variable.parameter
#Requires -Version 3.0
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^ meta.requires variable.parameter
#Requires -Version 3 -RunAsAdministrator
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^ meta.requires variable.parameter
#                    ^^^^^^^^^^^^^^^^^^^ meta.requires keyword.other
#Requires -RunAsAdministrator
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^^^^^^^^^^^^ meta.requires keyword.other
#Requires -Modules PSWorkflow
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^ meta.requires variable.parameter
#Requires -Modules PSWorkflow -ThisIsInvalid
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^ meta.requires variable.parameter
#                             ^^^^^^^^^^^^^^ meta.requires
#Requires -Modules PSWorkflow, ActiveDirectory
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^ meta.requires variable.parameter
#                              ^^^^^^^^^^^^^^^ meta.requires variable.parameter
#Requires -Modules PSWorkflow,ActiveDirectory
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^ meta.requires variable.parameter
#                             ^^^^^^^^^^^^^^^ meta.requires variable.parameter
#Requires -ShellId MyLocalShell
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^^^ meta.requires variable.parameter
#Requires -Modules PSWorkflow, @{ModuleName="PSScheduledJob"; ModuleVersion="1.0.0.0"}
# <- punctuation.definition.comment
# ^ meta.requires keyword.control.requires
#         ^^^^^^^^ meta.requires keyword.other
#                  ^^^^^^^^^^ meta.requires variable.parameter
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
# ^^^^^^^^ support.function
#          ^             ^ keyword.operator.assignment
#                                     ^^^ keyword.control
#                                         ^^    ^^     ^^    ^^      ^ ^ string.unquoted

# Automatic variables
$_, $$, $^, $?
# <- punctuation.definition.variable
#^ variable.language
#   ^ punctuation.definition.variable
#    ^^ variable.language
#       ^ punctuation.definition.variable
#       ^^ variable.language
#           ^ punctuation.definition.variable
#           ^^ variable.language
$args
# <- punctuation.definition.variable
#^^^^ support.variable.automatic
$error
# <- punctuation.definition.variable
# ^^^^ support.constant.variable
$home
# <- punctuation.definition.variable
# ^^^ support.constant.variable
$foreach
# <- punctuation.definition.variable
#^^^^^^^ support.variable.automatic

# Normal variables
$variable
# <- punctuation.definition.variable
# ^ variable.other.readwrite
$script:variable
# <- punctuation.definition.variable variable.other.readwrite
# ^ storage.modifier.scope
#       ^ variable.other.readwrite
$ENV:ComputerName
# <- punctuation.definition.variable variable.other.readwrite
# ^ support.variable.drive
#    ^ variable.other.readwrite
${variable}
# <- punctuation.definition.variable variable.other.readwrite
 # <- punctuation.section.braces.begin
# ^^^^^^^^ variable.other.readwrite
#         ^ punctuation.section.braces.end
${script:variable}
# <- punctuation.definition.variable variable.other.readwrite
 # <- punctuation.section.braces.begin
# ^ storage.modifier.scope
#        ^ variable.other.readwrite
#                ^ punctuation.section.braces.end

# Variable properties should be highlighted
$variable.Name
# <- variable.other.readwrite punctuation.definition.variable
#^^^^^^^^ variable.other.readwrite
#        ^^^^^ - variable.other.readwrite
#         ^^^^ variable.other.member

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#           ^ punctuation.definition.variable
#            ^^^^^^^^ variable.other.readwrite
#                          ^ punctuation.definition.string.end

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#             ^ punctuation.definition.variable
#            ^ punctuation.section.group.begin
#                           ^ punctuation.section.group.end
#              ^^^^^^^^ variable.other.readwrite
#                       ^^^^ variable.other.member
#                             ^ punctuation.definition.string.end

# $ENV:ComputerName should be highlighted
"This is the name of my computer: $ENV:ComputerName"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                 ^ punctuation.definition.variable
#                                  ^^^^ support.variable.drive
#                                      ^^^^^^^^^^^^ variable.other.readwrite
#                                                  ^ punctuation.definition.string.end

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                 ^ punctuation.definition.variable
#                                  ^ punctuation.section.braces.begin
#                                   ^^^^ support.variable.drive
#                                       ^^^^^^^^^^^^ variable.other.readwrite
#                                                    ^ punctuation.definition.string.end

# @splat references only work in argument mode, should not highlight in strings
"This is a @double quoted string."
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#          ^ - punctuation.definition.variable
#           ^^^^^^ - variable.other.readwrite

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
#     ^     ^     ^       ^ punctuation.definition.variable
# ^    ^     ^     ^       ^ variable.other.readwrite
#   ^ keyword.operator.assignment
#         ^     ^       ^ keyword.operator.other
$a1[0]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.bracket.begin
#   ^ constant.numeric.integer
#    ^ punctuation.section.bracket.end
$a2[-1]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.bracket.begin
#   ^^ constant.numeric.integer
#     ^ punctuation.section.bracket.end
$a3[1..2]
# <- variable.other.readwrite punctuation.definition.variable
# ^ variable.other.readwrite
#  ^ punctuation.section.bracket.begin
#   ^  ^ constant.numeric.integer
#    ^^ keyword.operator.range
#       ^ punctuation.section.bracket.end
    @(@($a))
#   ^ ^ keyword.other.array.begin
#    ^ ^ punctuation.section.group.begin
#       ^ punctuation.definition.variable variable.other.readwrite
#        ^ variable.other.readwrite
#         ^^ punctuation.section.group.end
    @(($i = 10); (++$j))
#   ^ keyword.other.array.begin
#    ^^          ^ punctuation.section.group.begin
#      ^            ^ punctuation.definition.variable variable.other.readwrite
#       ^            ^ variable.other.readwrite
#         ^ keyword.operator.assignment
#           ^^ constant.numeric.integer
#              ^ punctuation.terminator.statement
#                 ^^ keyword.operator.assignment
#             ^       ^^ punctuation.section.group.end
    @($i = 10)
#   ^ keyword.other.array.begin
#    ^ punctuation.section.group.begin
#     ^ punctuation.definition.variable variable.other.readwrite
#      ^ variable.other.readwrite
#        ^ keyword.operator.assignment
#          ^^ constant.numeric.integer
#            ^ punctuation.section.group.end
    $i[($y - 1) + $x]
#   ^   ^         ^ punctuation.definition.variable variable.other.readwrite
#    ^   ^         ^ variable.other.readwrite
#     ^ punctuation.section.bracket.begin
#      ^ punctuation.section.group.begin
#          ^    ^ keyword.operator.assignment
#            ^ constant.numeric.integer
#             ^ punctuation.section.group.end
#                   ^ punctuation.section.bracket.end

# Single quoted strings
    'This is a single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single
    '$This is a single ''quoted'' string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single
#                      ^^ constant.character.escape
#                              ^^ constant.character.escape
    'This is a
    single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single
    'This #also'
#   ^^^^^^^^^^^^ string.quoted.single
    '$(Invoke-Something)'
#   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.single
    'This "string" is nice.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single

# Double quoted strings
    "This is a double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
    "$This is a double ""quoted"" string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#    ^^^^^ variable.language
#                      ^^ constant.character.escape
#                              ^^ constant.character.escape
#     ^^^^ support.variable.automatic
    "This is a
    double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
    "This #also"
#   ^^^^^^^^^^^^ string.quoted.double
    "$(Invoke-Something)"
#   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#    ^ punctuation.definition.variable
#     ^ punctuation.section.group.begin
#      ^ interpolated.complex.source support.function
#                      ^ punctuation.section.group.end
    "This 'string' is nice."
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double

# Double quoted here-string
@"
# <- string.quoted.double.heredoc
 # <- string.quoted.double.heredoc
$This is a 'double quoted'
# <- punctuation.definition.variable
#^^^^ variable.language
Isn't it "nice"??
There is no @platting here!
#           ^ - punctuation.definition.variable
#            ^ - variable.other.readwrite
"@
# <- string.quoted.double.heredoc
 # <- string.quoted.double.heredoc

# Numeric constants
    -3
#   ^^ constant.numeric.integer
    .5
#   ^^ constant.numeric.integer
    +.5
#   ^^^ constant.numeric.integer
    1.
#   ^ constant.numeric.integer
#    ^ - constant
    1.d
#   ^^^ constant.numeric.integer
    1.lGB
#   ^^^ constant.numeric.integer
#      ^^ keyword.other
    1.e+12d
#   ^^^ constant.numeric.integer
#      ^ keyword.operator
#       ^^^ constant.numeric.integer
    1e+12d
#   ^^ constant.numeric.integer
#     ^ keyword.operator
#      ^^^ constant.numeric.integer
    1.5
#   ^^^ constant.numeric.integer
    -1.5
#   ^^^^ constant.numeric.integer
    -3 + -2
#   ^^ constant.numeric.integer
#      ^ keyword.operator
#        ^^ constant.numeric.integer
    -3+-2
#   ^^ constant.numeric.integer
#      ^^ constant.numeric.integer
#     ^ keyword.operator
    3++2
#   ^ constant.numeric.integer
#     ^^ constant.numeric.integer
#    ^ keyword.operator
    +2
#   ^^ constant.numeric.integer
    -3+-
#   ^^ constant.numeric.integer
#     ^^ keyword.operator
    10/-10
#   ^^ constant.numeric.integer
#      ^^^ constant.numeric.integer
#     ^ keyword.operator
    10/-10D
#   ^^ constant.numeric.integer
#      ^^^^ constant.numeric.integer
#     ^ keyword.operator
    -10.002L
#   ^^^^^^^^ constant.numeric.integer
    $x..5.40D
#   ^ punctuation.definition.variable
#   ^^ variable.other.readwrite
#     ^^ keyword.operator.range
#       ^^^^^ constant.numeric.integer
    -500..-495
#   ^^^^ constant.numeric.integer
#         ^^^^ constant.numeric.integer
#       ^^ keyword.operator.range
    $true..3
#   ^ punctuation.definition.variable
#    ^^^^ constant.language
#        ^^ keyword.operator.range
#          ^ constant.numeric.integer
    -2..$null
#   ^^ constant.numeric.integer
#     ^^ keyword.operator.range
#       ^^^^^ constant.language
#       ^ punctuation.definition.variable
    -3..3
#   ^^ constant.numeric.integer
#       ^ constant.numeric.integer
#     ^^ keyword.operator.range
    1..3
#   ^ constant.numeric.integer
#      ^ constant.numeric.integer
#    ^^ keyword.operator.range
    6,10,-3
#   ^ constant.numeric.integer
#     ^^ constant.numeric.integer
#        ^^ constant.numeric.integer
#    ^ punctuation.separator.sequence -constant
#       ^ punctuation.separator.sequence -constant
    0x476
#   ^^^^^ constant.numeric.integer.hexadecimal
    +0x20
#   ^^^^^ constant.numeric.integer.hexadecimal
    -0x20
#   ^^^^^ constant.numeric.integer.hexadecimal

# Types
[string]
# <- punctuation.section.bracket.begin
# ^ storage.type
#      ^ punctuation.section.bracket.end
[string[]]
# <- punctuation.section.bracket.begin
# ^ storage.type
#      ^ punctuation.section.bracket.begin
#       ^^ punctuation.section.bracket.end
[int32]
# <- punctuation.section.bracket.begin
# ^^^^ storage.type
#     ^ punctuation.section.bracket.end
[System.Collections.Generic.Dictionary[[System.String, mscorlib],[System.Management.Automation.ParameterMetadata,System.Management.Automation]]]
# <- punctuation.section.bracket.begin
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ storage.type
#                                       ^^^^^^^^^^^^^ storage.type
#                                                     ^^^^^^^^^^ storage.type
#                                                                 ^^ storage.type
#                                     ^^ punctuation.section.bracket.begin
#                                                                 ^ punctuation.section.bracket.begin
#                                                              ^ punctuation.section.bracket.end
#                                                                                                                                            ^^^ punctuation.section.bracket.end
[System.Array+SZArrayEnumerator]
# <- punctuation.section.bracket.begin
# ^^^^^^^^^^^ storage.type
#             ^^^^^^^^^^^^^^^^^ storage.type
#            ^ keyword.operator
#                              ^ punctuation.section.bracket.end
[int]::MinValue
# <- punctuation.section.bracket.begin
# ^ storage.type
#   ^ punctuation.section.bracket.end
[System.DateTime]::Parse('2016/09/21')
# <- punctuation.section.bracket.begin
# ^^^^^^^^^^^^^^ storage.type
#               ^ punctuation.section.bracket.end
#                       ^ punctuation.section.group.begin
#                                    ^ punctuation.section.group.end

# Commands (functions)
Invoke-Something -foobar
# <- support.function
#                ^ keyword.operator
Invoke-Something -foobar value
# <- support.function
#                ^ keyword.operator
Invoke-Something -foobar:$true
# <- support.function
#                ^ keyword.operator
#                        ^ punctuation.definition.variable
#                         ^^^^ constant.language
Invoke-Something -foobar: $true
# <- support.function
#                ^ keyword.operator
Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
# <- support.function
#                ^      ^      ^           ^       ^ keyword.operator
#                           ^^ constant.numeric.integer
#                                           ^ source
Invoke-Something (1..20 | Invoke-Something) -p2 'value'
# <- support.function
Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
# <- support.function
#                ^      ^                         ^ keyword.operator
#                           ^^ constant.numeric.integer
#                              ^ keyword.operator.other
#                                ^ support.function
#                                                  ^ source
Invoke-Something -p1 {
# <- support.function
#                ^ keyword.operator
#                    ^ punctuation.section.braces.begin
    Invoke-Something -foobar:$true
#   ^ support.function
#                    ^ keyword.operator
#                            ^ punctuation.definition.variable
#                             ^^^^ constant.language
} | Invoke-Something
# <- punctuation.section.braces.end
# ^ keyword.operator.logical.pipe
#   ^ support.function
Invoke-Something -p1 value `
# <- support.function
#                ^ keyword.operator
#                          ^ punctuation.separator.continuation
    -p2 14.4 `
#   ^ keyword.operator
#       ^^^^ constant.numeric.integer
#            ^ punctuation.separator.continuation
    -p3 $value | Invoke-Something -verbose
#   ^ keyword.operator
#                                 ^ keyword.operator
#       ^ punctuation.definition.variable
#              ^ keyword.operator.logical.pipe
#                ^^^^^^^^^^^^^^^^ support.function

# Commands (Built-in variables)
ls *.ps1 -recurse
#  ^ keyword.operator
#        ^ keyword.operator

# Commands (executable files)
. .\scripts\myscript.ps1 -parameter 'value'
# <- keyword.operator.other
#                        ^ keyword.operator
#                                   ^^^^^^^ string.quoted.single
& tool.exe
# <- keyword.operator.other
# ^^^^^^^^ support.function
something.cmd
# <- support.function
øyvind.com # this should also highlight - TODO

# switch
switch ("fourteen") {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ string.quoted.double
#                 ^ punctuation.section.group.end
#                   ^ meta.scriptblock punctuation.section.braces.begin
#                    ^ meta.scriptblock punctuation.section.braces.end
switch -CaseSensitive ("fourteen") {}
# <- keyword.control
#      ^ keyword.operator
#                     ^ punctuation.section.group.begin
#                      ^ string.quoted.double
#                                ^ punctuation.section.group.end
#                                  ^ meta.scriptblock punctuation.section.braces.begin
#                                   ^ meta.scriptblock punctuation.section.braces.end
switch -Regex ("fourteen") {}
# <- keyword.control
#      ^ keyword.operator
#             ^ punctuation.section.group.begin
#              ^ string.quoted.double
#                        ^ punctuation.section.group.end
#                          ^ meta.scriptblock punctuation.section.braces.begin
#                           ^ meta.scriptblock punctuation.section.braces.end
switch -Wildcard ($a) {}
# <- keyword.control
#      ^ keyword.operator
#                ^ punctuation.section.group.begin
#                 ^ punctuation.definition.variable
#                   ^ punctuation.section.group.end
#                     ^ meta.scriptblock punctuation.section.braces.begin
#                      ^ meta.scriptblock punctuation.section.braces.end
switch -regex -file .\somefile.txt {}
# <- keyword.control
#      ^ keyword.operator
#             ^ keyword.operator
#                                  ^ meta.scriptblock punctuation.section.braces.begin
#                                   ^ meta.scriptblock punctuation.section.braces.end
switch (3) {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ constant.numeric.integer
#        ^ punctuation.section.group.end
#          ^ meta.scriptblock punctuation.section.braces.begin
#           ^ meta.scriptblock punctuation.section.braces.end
switch (4, 2) {}
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^ constant.numeric.integer
#          ^ constant.numeric.integer
#        ^ punctuation.separator
#           ^ punctuation.section.group.end
#             ^ meta.scriptblock punctuation.section.braces.begin
#              ^ meta.scriptblock punctuation.section.braces.end

switch -Regex -File $filePath {
# <- keyword.control
#      ^ keyword.operator
#             ^ keyword.operator
#                   ^ punctuation.definition.variable
#                             ^ meta.scriptblock punctuation.section.braces.begin
    '.' {}
#   ^^^ string.quoted.single
#       ^ meta.scriptblock punctuation.section.braces.begin
#        ^ meta.scriptblock punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.scriptblock punctuation.section.braces.begin
#            ^ meta.scriptblock punctuation.section.braces.end
}
# <- meta.scriptblock punctuation.section.braces.end

switch -Wildcard -CaseSensitive ($something) {
# <- keyword.control
#      ^ keyword.operator
#                ^ keyword.operator
#                               ^ punctuation.section.group.begin
#                                ^ punctuation.definition.variable
#                                 ^ variable.other.readwrite
#                                          ^ punctuation.section.group.end
#                                            ^ meta.scriptblock punctuation.section.braces.begin
    '.' {}
#   ^^^ string.quoted.single
#       ^ meta.scriptblock punctuation.section.braces.begin
#        ^ meta.scriptblock punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.scriptblock punctuation.section.braces.begin
#            ^ meta.scriptblock punctuation.section.braces.end
}
# <- meta.scriptblock punctuation.section.braces.end

switch ('this') {
# <- keyword.control
#      ^ punctuation.section.group.begin
#       ^^^^^^ string.quoted.single
#             ^ punctuation.section.group.end
#               ^ meta.scriptblock punctuation.section.braces.begin
    'this' {}
#   ^^^^^^ string.quoted.single
#          ^ meta.scriptblock punctuation.section.braces.begin
#           ^ meta.scriptblock punctuation.section.braces.end
    default {}
#   ^^^^^^^ keyword.control
#           ^ meta.scriptblock punctuation.section.braces.begin
#            ^ meta.scriptblock punctuation.section.braces.end
}
# <- meta.scriptblock punctuation.section.braces.end

# Functions and filters
functioN MyFunction{}
# <- storage.type
#        ^^^^^^^^^^ entity.name.function
#                  ^ punctuation.section.braces.begin
#                   ^ punctuation.section.braces.end
function My-Function         {}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#                            ^ punctuation.section.braces.begin
#                             ^ punctuation.section.braces.end
Function My.Function{}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#                   ^ punctuation.section.braces.begin
#                    ^ punctuation.section.braces.end
function My-Function.Other{}
# <- storage.type
#        ^^^^^^^^^^^^^^^^^ entity.name.function
#                         ^ punctuation.section.braces.begin
#                          ^ punctuation.section.braces.end
function Some.other.function{}
# <- storage.type
#        ^^^^^^^^^^^^^^^^^^^ entity.name.function
#                           ^ punctuation.section.braces.begin
#                            ^ punctuation.section.braces.end
FUNCTION MyFunction2 {}
# <- storage.type
#        ^^^^^^^^^^^ entity.name.function
#                    ^ punctuation.section.braces.begin
#                     ^ punctuation.section.braces.end
function New-File { }
# <- storage.type
#        ^^^^^^^^ entity.name.function
#                 ^ punctuation.section.braces.begin
#                   ^ punctuation.section.braces.end
function New-File ($Name) { }
# <- storage.type
#        ^^^^^^^^ entity.name.function
#                         ^ punctuation.section.braces.begin
#                           ^ punctuation.section.braces.end
function NewFile($Name) { }
# <- storage.type
#        ^^^^^^^ entity.name.function
#               ^ punctuation.section.group.begin
#                ^ punctuation.definition.variable
#                   ^ variable.other.readwrite
#                     ^ punctuation.section.group.end
#                       ^ punctuation.section.braces.begin
#                         ^ punctuation.section.braces.end
filter myfilter($param) {}
# <- storage.type
#      ^^^^^^^^ entity.name.function
#              ^ punctuation.section.group.begin
#               ^ punctuation.definition.variable
#                ^ variable.other.readwrite
#                     ^ punctuation.section.group.end
#                       ^ punctuation.section.braces.begin
#                        ^ punctuation.section.braces.end
Filter my-Filter ($param){}
# <- storage.type
#      ^^^^^^^^^ entity.name.function
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
#                  ^ punctuation.section.group.begin
#                   ^ punctuation.section.bracket.begin
#                    ^^^^^^ storage.type
#                          ^ punctuation.section.bracket.end
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
# <- meta.function storage.type
#        ^ meta.function entity.name.function
{
# <- punctuation.section.braces.begin

    Param
    # <- keyword.control
    (
    # <- punctuation.section.group.begin
        # Param1 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(Mandatory=$true,
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
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
        #                                               ^ punctuation.section.bracket.end
        #                                                ^ - meta.attribute
        [ValidateNotNullOrEmpty()]
        #^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^^^^^^^^^^^^^^^^^^^^^ support.function.attribute
        #                      ^ punctuation.section.group.begin
        #                       ^ punctuation.section.group.end
        #                        ^ punctuation.section.bracket.end
        [ValidateNotNull()]
        #^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^^^^^^^^^^^^^^ support.function.attribute
        #               ^ punctuation.section.group.begin
        #                ^ punctuation.section.group.end
        #                 ^ punctuation.section.bracket.end
        [ValidateNotNullOrEmpty()]
        #^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^^^^^^^^^^^^^^^^^^^^^ support.function.attribute
        #                      ^ punctuation.section.group.begin
        #                       ^ punctuation.section.group.end
        #                        ^ punctuation.section.bracket.end
        [ValidateCount(0,5)]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^^^^^^^^^^^^ support.function.attribute
        #             ^ punctuation.section.group.begin
        #              ^ constant.numeric.integer
        #               ^ punctuation.separator
        #                ^ constant.numeric.integer
        #                 ^ punctuation.section.group.end
        #                  ^ punctuation.section.bracket.end
        [ValidateSet("sun", "moon", "earth")]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^ support.function.attribute
        #           ^ punctuation.section.group.begin
        #            ^^^^ string.quoted.double
        #                 ^ punctuation.separator
        #                   ^^^^^^ string.quoted.double
        #                         ^ punctuation.separator
        #                           ^^^^^^^ string.quoted.double
        #                                  ^ punctuation.section.group.end
        #                                   ^ punctuation.section.bracket.end
        [Alias("p1")]
        #^^^^^^^^^^^^ meta.attribute
        # <- punctuation.section.bracket.begin
        # ^ support.function.attribute
        #     ^ punctuation.section.group.begin
        #      ^^^^ string.quoted.double
        #          ^ punctuation.section.group.end
        #           ^ punctuation.section.bracket.end
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
#             ^ entity.name.function
#                       ^ punctuation.section.braces.begin
    Node Whatever {
#                 ^ punctuation.section.braces.begin
    }
    # <- punctuation.section.braces.end
}
# <- punctuation.section.braces.end

# Redirection
notepad.exe > log.txt
# <- support.function
#           ^ keyword.operator.redirection
notepad.exe 1> log.txt
# <- support.function
#            ^ keyword.operator.redirection
notepad.exe 2>&1
# <- support.function
#            ^^ keyword.operator.redirection
notepad.exe 3>&1
# <- support.function
#            ^^ keyword.operator.redirection
notepad.exe 4>&1
# <- support.function
#            ^^ keyword.operator.redirection
notepad.exe 5>&1
# <- support.function
#            ^^ keyword.operator.redirection
notepad.exe 6>&1
# <- support.function
#            ^^ keyword.operator.redirection
notepad.exe 2>&1> log.txt
# <- support.function
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
#  ^ keyword.operator.comparison
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
#    ^^^^ constant.numeric.integer
#                    ^ string.quoted.double
    "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                            ^^ keyword.operator.string-format
#                                                  ^^^ constant.numeric.integer
    ("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
#                       ^^^^^^^^^^^^^ string.quoted.double
#            ^^ keyword.operator.string-format
#                                     ^^ keyword.operator.string-format
    "{0:R}" -f (1mb/2.0)
#                ^^ keyword.other
#           ^ keyword.operator.string-format
    "{0:00.0}" -f 4.12341234
#              ^ keyword.operator.string-format
    "{0:##.#}" -f 4.12341234
#          ^ string.quoted.double
#              ^ keyword.operator.string-format
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
#              ^ - storage.type
New-Object -TypeName System.Diagnostics.Process
#                                       ^^^^^^^ - keyword.control
New-Object -TypeName System.Data
#                           ^^^^ - keyword.control
@("any","array","has").foreach({ $_ })
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.scriptblock
@('any','array','has').foreach{ $_ }
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.scriptblock
@("any","array","has").where({ $_.Length -gt 3 })
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.scriptblock
@("any","array","has").where{ $_.Length -gt 3 }
# <- keyword.other.array.begin
# ^ meta.group.array-expression
#                      ^ keyword.control
#                               ^ meta.scriptblock
$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
# <- punctuation.definition.variable
#            ^ support.function
#                  ^ support.variable.drive
#                         ^ variable.other.readwrite
#                                   ^ string.quoted.double punctuation.definition.variable
#                                        ^ storage.type
$ScriptBlock | Out-File $file -Force
# <- punctuation.definition.variable
#            ^ keyword.operator.other
#                       ^ punctuation.definition.variable
#                             ^ keyword.operator.assignment
workflow w1 {}
# <- storage.type
#        ^ entity.name.function
#           ^ punctuation.section.braces.begin
#            ^ punctuation.section.braces.end
Workflow work { sequence {} }
# <- storage.type
#        ^ entity.name.function
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
#                        ^                                                                                 ^ punctuation.definition.variable
#                                      ^ keyword.operator.logical.pipe
#                                                           ^                 ^ meta.group.complex.subexpression punctuation.section.group.begin
#                                                                ^ storage.type
#                                                                                                      ^ ^ meta.group.complex.subexpression punctuation.section.group.end
"This is the Debugreference variable: $DebugPreference"
# <- string.quoted.double
#                                     ^ variable.language

$ConfirmPreference $DebugPreference $ErrorActionPreference $ErrorView $FormatEnumerationLimit $InformationPreference $LogCommandHealthEvent $LogCommandLifecycleEvent $LogEngineHealthEvent $LogEngineLifecycleEvent $LogProviderHealthEvent $LogProviderLifecycleEvent $MaximumAliasCount $MaximumDriveCount $MaximumErrorCount $MaximumFunctionCount $MaximumHistoryCount $MaximumVariableCount $OFS $OutputEncoding $PSCulture $PSDebugContext $PSDefaultParameterValues $PSEmailServer $PSItem $PSModuleAutoLoadingPreference $PSModuleAutoloadingPreference $PSSenderInfo $PSSessionApplicationName $PSSessionConfigurationName $PSSessionOption $ProgressPreference $VerbosePreference $WarningPreference $WhatIfPreference
# <- variable.language
#                   ^ variable.language          ^ variable.language      ^ variable.language               ^ variable.language                  ^ variable.language                   ^ variable.language                ^ variable.language        ^ variable.language             ^ variable.language             ^ variable.language                       ^ variable.language                        ^ variable.language               ^ variable.language                        ^ variable.language       ^ variable.language        ^ variable.language
#                                    ^ variable.language     ^ variable.language                 ^ variable.language                  ^ variable.language                  ^ variable.language                    ^ variable.language        ^ variable.language           ^ variable.language             ^ variable.language  ^ variable.language                           ^ variable.language                                        ^ variable.language               ^ variable.language
#                                                                                                                                                                                                                                                                                                                                                                                                       ^ variable.language             ^ variable.language                   ^ variable.language                                                                                                                     ^ variable.language          ^ variable.language
