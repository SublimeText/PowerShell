# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string
#^^^^^^^^^^^ string.quoted.double
#           ^^^^^^^^^ meta.interpolation variable.other.readwrite - string
#           ^ punctuation.definition.variable
#                    ^^^^^^ string.quoted.double - meta.interpolation - variable - punctuation
#                          ^ punctuation.definition.string.end

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string
#^^^^^^^^^^^ string.quoted.double
#           ^^^^^^^^^^^^^^^^^ meta.interpolation - string
#                            ^^ string.quoted.double - meta.interpolation
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
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                 ^^^^^^^^^^^^^^^^^ meta.interpolation - string
#                                 ^ punctuation.definition.variable
#                                  ^^^^ support.variable.drive
#                                      ^^^^^^^^^^^^ variable.other.readwrite
#                                                  ^ punctuation.definition.string.end

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"
# <- punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                 ^^^^^^^^^^^^^^^^^^^ meta.interpolation - string
#                                 ^ punctuation.definition.variable
#                                  ^ punctuation.section.braces.begin
#                                   ^^^^ support.variable.drive
#                                       ^^^^^^^^^^^^ variable.other.readwrite
#                                                    ^ punctuation.definition.string.end

# The @splat references only work in argument mode, should not highlight in strings
"This is a @double quoted string."
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
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
#^^^^^^^^^^^^^^^^^ meta.string string.quoted.single
#                ^ punctuation.definition.string.end


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
#      @@@@@@@@@@@@@@@@ reference
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
@'
#<- meta.string string.quoted.single.heredoc punctuation.definition.string.begin
A 'single quoted' "heredoc"
'@
#<- meta.string string.quoted.single.heredoc punctuation.definition.string.end


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
#    ^^^^ meta.number.float.decimal constant.numeric.value
#                  ^ punctuation.section.group.begin
#                    ^ string.quoted.double
    "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                            ^^ keyword.operator.string-format
#                                                  ^^^ meta.number.integer.decimal constant.numeric.value
    ("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
#            ^^ keyword.operator.string-format
#               ^^^^ meta.number.float.decimal constant.numeric.value
#                       ^^^^^^^^^^^^^ string.quoted.double
#                                     ^^ keyword.operator.string-format
    "{0:R}" -f (1mb/2.0)
#           ^ keyword.operator.string-format
#               ^ meta.number.integer.decimal constant.numeric.value
#                ^^ meta.number.integer.decimal constant.numeric.suffix
    "{0:00.0}" -f 4.12341234
#              ^ keyword.operator.string-format
    "{0:##.#}" -f 4.12341234
#          ^ string.quoted.double
#              ^ keyword.operator.string-format
#                 ^^^^^^^^^^ meta.number.float.decimal constant.numeric.value
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
