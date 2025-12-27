# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

###[ Single Quoted Strings ]###################################################

    'This is a single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - meta.string.interpolated
#   ^ punctuation.definition.string.begin.powershell
#                                   ^ punctuation.definition.string.end.powershell

    'This is a
#   ^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - meta.string.interpolated
#   ^ punctuation.definition.string.begin.powershell
    single quoted string.'
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - meta.string.interpolated
#                        ^ punctuation.definition.string.end.powershell

    'This #also'
#   ^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - comment
#   ^ punctuation.definition.string.begin.powershell
#              ^ punctuation.definition.string.end.powershell

    'This "string" is nice.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - constant
#   ^ punctuation.definition.string.begin.powershell
#                          ^ punctuation.definition.string.end.powershell

    '$This is a single ''quoted'' string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - meta.string.interpolated
#   ^ punctuation.definition.string.begin.powershell
#                      ^^ constant.character.escape.powershell
#                              ^^ constant.character.escape.powershell
#                                        ^ punctuation.definition.string.end.powershell

    '$(Invoke-Something)'
#   ^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - meta.interpolation - variable - support
#   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell

    'Not escape chars: `", `n, `$, `b, `"'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell - constant
#   ^ punctuation.definition.string.begin.powershell
#                                        ^ punctuation.definition.string.end.powershell

    ‘curly ‘‘quotes'’ are equivalent to straight ones'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#          ^^ constant.character.escape.powershell
#                  ^^ constant.character.escape.powershell
#                                                    ^ punctuation.definition.string.end.powershell

    @'
#   ^^ meta.string.powershell string.quoted.single.heredoc.powershell punctuation.definition.string.begin.powershell - meta.string.interpolated
    A 'single quoted' "heredoc"
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.heredoc.powershell - punctuation
    '@
#^^^^^ meta.string.powershell string.quoted.single.heredoc.powershell - punctuation
'@
#^ meta.string.powershell string.quoted.single.heredoc.powershell punctuation.definition.string.end.powershell

    @'
    using System;
#^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.heredoc.powershell source.cs
#   ^^^^^ keyword.control.import.cs
#         ^^^^^^ meta.path.cs
#               ^ punctuation.terminator
'@

###[ Double Quoted Strings ]###################################################

    "This is a double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#                                   ^ punctuation.definition.string.end.powershell

    "This is a
#   ^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
    double quoted string."
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                        ^ punctuation.definition.string.end.powershell

    "This #also"
#   ^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell - comment
#   ^ punctuation.definition.string.begin.powershell
#              ^ punctuation.definition.string.end.powershell

    "This 'string' is nice."
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell - constant
#   ^ punctuation.definition.string.begin.powershell
#                          ^ punctuation.definition.string.end.powershell

    "$This is a double ""quoted"" string."
#   ^ meta.string string.quoted.double
#    ^^^^^ meta.string meta.interpolation variable.language - string
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double - meta.interpolation
#                      ^^ constant.character.escape
#                              ^^ constant.character.escape

    # In double-quoted strings, only the variable should be highlighted, not the property
    "This is my $variable.Name!"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^^^^^^^^^^^^ string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#               ^^^^^^^^^ meta.interpolation.powershell variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell
#                        ^^^^^^^ string.quoted.double.powershell - meta.interpolation - variable - punctuation.accessor
#                              ^ punctuation.definition.string.end.powershell

    # When used in a subexpression, both should be highlighted
    "This is my $($variable.Name)!"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^^^^^^^^^^^^ string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#               ^^^^^^^^^^^^^^^^^ meta.interpolation.powershell - string
#               ^^ punctuation.section.interpolation.begin.powershell
#                 ^^^^^^^^^^^^^^ source.powershell.embedded
#                 ^^^^^^^^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
#                          ^ punctuation.accessor.dot.powershell
#                           ^^^^ variable.other.member.powershell
#                               ^ punctuation.section.interpolation.end.powershell
#                                ^^ string.quoted.double.powershell - meta.interpolation
#                                 ^ punctuation.definition.string.end.powershell

    # When used in a subexpression, still don't extend past its closing
    "This is my $($variable.Name).Name!"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^^^^^^^^^^^^ string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#               ^^^^^^^^^^^^^^^^^ meta.interpolation.powershell
#               ^^ punctuation.section.interpolation.begin.powershell
#                 ^^^^^^^^^^^^^^ source.powershell.embedded
#                 ^^^^^^^^^ variable.other.readwrite.powershell
#                 ^ punctuation.definition.variable.powershell
#                          ^ punctuation.accessor.dot.powershell
#                           ^^^^ variable.other.member.powershell
#                               ^ punctuation.section.interpolation.end.powershell
#                                ^^^^^^^ string.quoted.double.powershell
#                                      ^ punctuation.definition.string.end.powershell

    # $ENV:ComputerName should be highlighted
    "This is the name of my computer: $ENV:ComputerName"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#                                     ^^^^^^^^^^^^^^^^^ meta.interpolation.powershell variable.other.readwrite.powershell
#                                     ^ punctuation.definition.variable.powershell
#                                      ^^^ support.variable.drive.powershell
#                                         ^ punctuation.accessor.colon.powershell
#                                                      ^ string.quoted.double.powershell punctuation.definition.string.end.powershell

    # Here as well
    "This is the name of my computer: ${ENV:ComputerName}"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#                                     ^^^^^^^^^^^^^^^^^^^ meta.interpolation.powershell variable.other.readwrite.powershell
#                                     ^ punctuation.definition.variable.powershell
#                                      ^ punctuation.section.interpolation.begin.powershell
#                                       ^^^ support.variable.drive.powershell
#                                          ^ punctuation.accessor.colon.powershell
#                                                       ^ punctuation.section.interpolation.end.powershell
#                                                        ^ string.quoted.double.powershell punctuation.definition.string.end.powershell

    # The @splat references only work in argument mode, should not highlight in strings
    "This is a @double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell - variable - punctuation.definition.variable
#   ^ punctuation.definition.string.begin.powershell
#                                    ^ punctuation.definition.string.end.powershell

    # Double check scopes for automatic variables in strings
    "$_ $$ $Pwd"
#   ^^^^^^^^^^^^ meta.string.interpolated.powershell
#   ^ string.quoted.double.powershell punctuation.definition.string.begin.powershell
#    ^^ meta.interpolation.powershell variable.language.powershell - string
#    ^ punctuation.definition.variable.powershell
#      ^ string.quoted.double.powershell
#       ^^ meta.interpolation.powershell variable.language.powershell - string
#       ^ punctuation.definition.variable.powershell
#         ^ string.quoted.double.powershell
#          ^^^^ meta.interpolation.powershell variable.language.powershell - string
#          ^ punctuation.definition.variable.powershell
#              ^ string.quoted.double.powershell punctuation.definition.string.end.powershell

    "$(Invoke-Something)"
#   ^ meta.string string.quoted.double
#    ^^^^^^^^^^^^^^^^^^^ meta.string meta.interpolation - string
#    ^^ punctuation.section.interpolation.begin
#      ^^^^^^^^^^^^^^^^ support.function
#                      ^ punctuation.section.interpolation.end
#      @@@@@@@@@@@@@@@@ reference

    “curly ““quotes"” are equivalent to straight ones"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#          ^^ constant.character.escape.powershell
#                  ^^ constant.character.escape.powershell
#                                                    ^ punctuation.definition.string.end.powershell

    # Double quoted here-string
    @"
#   ^^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell punctuation.definition.string.begin.powershell
    $This is a 'double quoted'
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell
#^^^ string.quoted.double.heredoc.powershell
#   ^^^^^ meta.interpolation.powershell variable.language.powershell
#   ^ punctuation.definition.variable.powershell
#        ^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.heredoc.powershell
    Isn't it "nice"??
#^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell - punctuation
    There is no @splatting here!
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell
    "@
#^^^^^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell - punctuation
"@
#^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell punctuation.definition.string.end.powershell


    "Escaped chars: `", `n, `$, `b, `t, `e, `u{10ffff}, `""
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#                   ^^ constant.character.escape.powershell
#                       ^^ constant.character.escape.powershell
#                           ^^ constant.character.escape.powershell
#                               ^^ constant.character.escape.powershell
#                                   ^^ constant.character.escape.powershell
#                                       ^^ constant.character.escape.powershell
#                                           ^^^^^^^^^^ constant.character.escape.powershell
#                                                       ^^ constant.character.escape.powershell
#                                                         ^ punctuation.definition.string.end.powershell

    @"
    using System;
#^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.heredoc.powershell source.cs
#   ^^^^^ keyword.control.import.cs
#         ^^^^^^ meta.path.cs
#               ^ punctuation.terminator
"@


###[ Regular Expressions ]#####################################################

    'book' -match 'oo'
#   ^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#        ^ punctuation.definition.string.end.powershell
#          ^^^^^^ keyword.operator.logical.powershell
#          ^ punctuation.definition.keyword.powershell
#                 ^^^^ meta.string.powershell
#                 ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                  ^^ source.regexp.embedded
#                    ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'big' -match 'b[iou]g'
#   ^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#       ^ punctuation.definition.string.end.powershell
#         ^^^^^^ keyword.operator.logical.powershell
#         ^ punctuation.definition.keyword.powershell
#                ^^^^^^^^^ meta.string.powershell
#                ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                 ^^^^^^^ source.regexp.embedded
#                        ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    42 -match '[0-9][0-9]'
#   ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#      ^^^^^^ keyword.operator.logical.powershell
#      ^ punctuation.definition.keyword.powershell
#             ^^^^^^^^^^^^ meta.string.powershell
#             ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#              ^^^^^^^^^^ source.regexp.embedded
#                        ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'a1\ ' -match '....'
#   ^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#        ^ punctuation.definition.string.end.powershell
#          ^^^^^^ keyword.operator.logical.powershell
#          ^ punctuation.definition.keyword.powershell
#                 ^^^^^^ meta.string.powershell
#                 ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                  ^^^^ source.regexp.embedded keyword.other.any.regexp
#                      ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'ACCOUNT NAME:    Administrator' -match 'ACCOUNT NAME:\s*\w*'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#                                  ^ punctuation.definition.string.end.powershell
#                                    ^^^^^^ keyword.operator.logical.powershell
#                                    ^ punctuation.definition.keyword.powershell
#                                           ^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell
#                                           ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                                            ^^^^^^^^^^^^^^^^^^^ source.regexp.embedded
#                                                         ^^ keyword.control.character-class.regexp
#                                                           ^ keyword.operator.quantifier.regexp
#                                                            ^^ keyword.control.character-class.regexp
#                                                              ^ keyword.operator.quantifier.regexp
#                                                               ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'SERVER01' -match '[A-Z]+-?\d\d'
#   ^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#            ^ punctuation.definition.string.end.powershell
#              ^^^^^^ keyword.operator.logical.powershell
#              ^ punctuation.definition.keyword.powershell
#                     ^^^^^^^^^^^^^^ meta.string.powershell
#                     ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                      ^^^^^^^^^^^^ source.regexp.embedded
#                      ^^^^^ meta.set.regexp
#                           ^ keyword.operator.quantifier.regexp
#                             ^ keyword.operator.quantifier.regexp
#                              ^^^^ keyword.control.character-class.regexp
#                                  ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    '111-222-3333' -match '\d{3}-\d{3}-\d{4}'
#   ^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#                ^ punctuation.definition.string.end.powershell
#                  ^^^^^^ keyword.operator.logical.powershell
#                  ^ punctuation.definition.keyword.powershell
#                         ^^^^^^^^^^^^^^^^^^^ meta.string.powershell
#                         ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                          ^^^^^^^^^^^^^^^^^ source.regexp.embedded
#                          ^^ keyword.control.character-class.regexp
#                            ^^^ keyword.operator.quantifier.regexp
#                                ^^ keyword.control.character-class.regexp
#                                  ^^^ keyword.operator.quantifier.regexp
#                                      ^^ keyword.control.character-class.regexp
#                                        ^^^ keyword.operator.quantifier.regexp
#                                           ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'fishing' -match '^fish$'
#   ^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#           ^ punctuation.definition.string.end.powershell
#             ^^^^^^ keyword.operator.logical.powershell
#             ^ punctuation.definition.keyword.powershell
#                    ^^^^^^^^ meta.string.powershell
#                    ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                     ^^^^^^ source.regexp.embedded
#                     ^ keyword.control
#                          ^ keyword.control
#                           ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    '3.141' -match '3\.\d{2,}'
#   ^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#         ^ punctuation.definition.string.end.powershell
#           ^^^^^^ keyword.operator.logical.powershell
#           ^ punctuation.definition.keyword.powershell
#                  ^^^^^^^^^^^ meta.string.powershell
#                  ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                   ^^^^^^^^^ source.regexp.embedded
#                    ^^ constant.character.escape.regexp
#                      ^^ keyword.control.character-class.regexp
#                        ^^^^ keyword.operator.quantifier.regexp
#                            ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'The last logged on user was CONTOSO\jsmith' -match '(.+was )(.+)'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#                                              ^ punctuation.definition.string.end.powershell
#                                                ^^^^^^ keyword.operator.logical.powershell
#                                                ^ punctuation.definition.keyword.powershell
#                                                       ^^^^^^^^^^^^^^ meta.string.powershell
#                                                       ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                                                        ^^^^^^^^^^^^ source.regexp.embedded
#                                                         ^ keyword.other.any.regexp
#                                                          ^ keyword.operator.quantifier.regexp
#                                                                 ^ keyword.other.any.regexp
#                                                                  ^ keyword.operator.quantifier.regexp
#                                                                    ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    $string -match 'was (?<domain>.+)\\(?<user>.+)'
#   ^^^^^^^ variable.other.readwrite.powershell
#   ^ punctuation.definition.variable.powershell
#           ^^^^^^ keyword.operator.logical.powershell
#           ^ punctuation.definition.keyword.powershell
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell
#                  ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.regexp.embedded
#                                                 ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    'Hello World' -replace '(\w+) \w+', '$1 Universe'
#   ^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#               ^ punctuation.definition.string.end.powershell
#                 ^^^^^^^^ keyword.operator.string.powershell
#                 ^ punctuation.definition.keyword.powershell
#                          ^^^^^^^^^^^ meta.string.powershell
#                          ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                           ^^^^^^^^^ source.regexp.embedded
#                            ^^ keyword.control.character-class.regexp
#                              ^ keyword.operator.quantifier.regexp
#                                 ^^ keyword.control.character-class.regexp
#                                   ^ keyword.operator.quantifier.regexp
#                                    ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
#                                     ^ punctuation.separator.sequence.powershell
#                                       ^^^^^^^^^^^^^ meta.string.powershell
#                                       ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                                        ^^^^^^^^^^^ source.regexp.embedded
#                                                   ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    "Hello World" -replace "(\w+) \w+", "`$1 Universe"
    '5.72' -replace '(.+)', '$$$1'
#   ^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#        ^ punctuation.definition.string.end.powershell
#          ^^^^^^^^ keyword.operator.string.powershell
#          ^ punctuation.definition.keyword.powershell
#                   ^^^^^^ meta.string.powershell
#                   ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                    ^^^^ source.regexp.embedded
#                     ^ keyword.other.any.regexp
#                      ^ keyword.operator.quantifier.regexp
#                        ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
#                         ^ punctuation.separator.sequence.powershell
#                           ^^^^^^ meta.string.powershell
#                           ^ string.quoted.single.powershell punctuation.definition.string.begin.powershell
#                            ^^^^ source.regexp.embedded
#                                ^ string.quoted.single.powershell punctuation.definition.string.end.powershell
    "5.72" -replace "(.+)", "`$`$`$1"

###[ String Formatting ]#######################################################

    "{0:N2}" -f $a
#   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^ constant.other.format-spec.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell

    "{0:D8}" -f $a
#   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^ constant.other.format-spec.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell

    "{0:C2}" -f $a
#   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^ constant.other.format-spec.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell

    "{0:P0}" -f $a
#   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^ constant.other.format-spec.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell

    "{0:X0}" -f $a
#   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^ constant.other.format-spec.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^ variable.other.readwrite.powershell
#               ^ punctuation.definition.variable.powershell

    (1.11).ToString("#.#")
#   ^^^^^^ meta.group.powershell
#   ^ punctuation.section.group.begin.powershell
#    ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#     ^ punctuation.separator.decimal.powershell
#        ^ punctuation.section.group.end.powershell
#         ^ punctuation.accessor.dot.powershell
#          ^^^^^^^^ meta.function-call.powershell variable.function.powershell
#          @@@@@@@@ reference
#                  ^^^^^^^ meta.function-call.arguments.powershell
#                  ^ punctuation.section.arguments.begin.powershell
#                   ^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                   ^ punctuation.definition.string.begin.powershell
#                       ^ punctuation.definition.string.end.powershell
#                        ^ punctuation.section.arguments.end.powershell

    "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#           ^^^^^^ constant.other.placeholder.powershell
#           ^ punctuation.definition.placeholder.begin.powershell
#             ^ punctuation.separator.powershell
#                ^ punctuation.definition.placeholder.end.powershell
#                  ^^^^^^^^ constant.other.placeholder.powershell
#                  ^ punctuation.definition.placeholder.begin.powershell
#                    ^ punctuation.separator.powershell
#                       ^ punctuation.separator.format-spec.powershell
#                        ^ constant.other.format-spec.powershell
#                         ^ punctuation.definition.placeholder.end.powershell
#                          ^ punctuation.definition.string.end.powershell
#                            ^^ keyword.operator.string-format.powershell
#                            ^ punctuation.definition.keyword.powershell
#                               ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                               ^ punctuation.definition.string.begin.powershell
#                                     ^ punctuation.definition.string.end.powershell
#                                      ^ punctuation.separator.sequence.powershell
#                                        ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                                        ^ punctuation.definition.string.begin.powershell
#                                               ^ punctuation.definition.string.end.powershell
#                                                ^ punctuation.separator.sequence.powershell
#                                                  ^^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell

    ("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
#   ^^^^^^^^^^^^^^^^^ meta.group.powershell
#   ^ punctuation.section.group.begin.powershell
#    ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#    ^ punctuation.definition.string.begin.powershell
#     ^^^^^ constant.other.placeholder.powershell
#     ^ punctuation.definition.placeholder.begin.powershell
#       ^ punctuation.separator.powershell
#         ^ punctuation.definition.placeholder.end.powershell
#          ^ punctuation.definition.string.end.powershell
#            ^^ keyword.operator.string-format.powershell
#            ^ punctuation.definition.keyword.powershell
#               ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                ^ punctuation.separator.decimal.powershell
#                   ^ punctuation.section.group.end.powershell
#                    ^ punctuation.separator.sequence.powershell
#                      ^^^^^^^^^^^^^^^^^^^^^^^ meta.group.powershell
#                      ^ punctuation.section.group.begin.powershell
#                       ^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                       ^ punctuation.definition.string.begin.powershell
#                        ^^^^^^^^^^^ constant.other.placeholder.powershell
#                        ^ punctuation.definition.placeholder.begin.powershell
#                          ^ punctuation.separator.powershell
#                            ^ punctuation.separator.format-spec.powershell
#                             ^^^^^ constant.other.format-spec.powershell
#                                  ^ punctuation.definition.placeholder.end.powershell
#                                   ^ punctuation.definition.string.end.powershell
#                                     ^^ keyword.operator.string-format.powershell
#                                     ^ punctuation.definition.keyword.powershell
#                                        ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                                          ^ punctuation.separator.decimal.powershell
#                                            ^ punctuation.section.group.end.powershell

    "{0:R}" -f (1mb/2.0)
#   ^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^ constant.other.format-spec.powershell
#        ^ punctuation.definition.placeholder.end.powershell
#         ^ punctuation.definition.string.end.powershell
#           ^^ keyword.operator.string-format.powershell
#           ^ punctuation.definition.keyword.powershell
#              ^^^^^^^^^ meta.group.powershell
#              ^ punctuation.section.group.begin.powershell
#               ^^^ meta.number.integer.decimal.powershell
#               ^ constant.numeric.value.powershell
#                ^^ constant.numeric.suffix.powershell
#                  ^ keyword.operator.arithmetic.powershell
#                   ^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                    ^ punctuation.separator.decimal.powershell
#                      ^ punctuation.section.group.end.powershell

    "{0:00.0}" -f 4.12341234
#   ^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^ constant.other.format-spec.powershell
#           ^ punctuation.definition.placeholder.end.powershell
#            ^ punctuation.definition.string.end.powershell
#              ^^ keyword.operator.string-format.powershell
#              ^ punctuation.definition.keyword.powershell
#                 ^^^^^^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                  ^ punctuation.separator.decimal.powershell

    "{0:##.#}" -f 4.12341234
#   ^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^ constant.other.format-spec.powershell
#           ^ punctuation.definition.placeholder.end.powershell
#            ^ punctuation.definition.string.end.powershell
#              ^^ keyword.operator.string-format.powershell
#              ^ punctuation.definition.keyword.powershell
#                 ^^^^^^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                  ^ punctuation.separator.decimal.powershell

    "{0:#,#.#}" -f 1234.121234
#   ^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^ constant.other.format-spec.powershell
#        ^ punctuation.separator.powershell
#            ^ punctuation.definition.placeholder.end.powershell
#             ^ punctuation.definition.string.end.powershell
#               ^^ keyword.operator.string-format.powershell
#               ^ punctuation.definition.keyword.powershell
#                  ^^^^^^^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                      ^ punctuation.separator.decimal.powershell

    "{0:##,,.000}" -f 1048576
#   ^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^ constant.other.format-spec.powershell
#         ^^ punctuation.separator.powershell
#               ^ punctuation.definition.placeholder.end.powershell
#                ^ punctuation.definition.string.end.powershell
#                  ^^ keyword.operator.string-format.powershell
#                  ^ punctuation.definition.keyword.powershell
#                     ^^^^^^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell

    "{this is not a #comment}"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell - comment - constant.other.placeholder
#   ^ punctuation.definition.string.begin.powershell
#                            ^ punctuation.definition.string.end.powershell

    "{0:##.#E000}" -f 2.71828
#   ^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^ constant.other.format-spec.powershell
#               ^ punctuation.definition.placeholder.end.powershell
#                ^ punctuation.definition.string.end.powershell
#                  ^^ keyword.operator.string-format.powershell
#                  ^ punctuation.definition.keyword.powershell
#                     ^^^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                      ^ punctuation.separator.decimal.powershell

    "{0:#.00'##'}" -f 2.71828
#   ^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^ constant.other.format-spec.powershell
#                ^ punctuation.definition.string.end.powershell
#                  ^^ keyword.operator.string-format.powershell
#                  ^ punctuation.definition.keyword.powershell
#                     ^^^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                      ^ punctuation.separator.decimal.powershell

    "{0:#.00""##""}" -f 2.71828
#   ^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#     ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^^^ constant.other.format-spec.powershell
#           ^^ constant.character.escape.powershell
#               ^^ constant.character.escape.powershell
#                 ^ punctuation.definition.placeholder.end.powershell
#                  ^ punctuation.definition.string.end.powershell

    "{0:#.00`u{00b5}}" -f 2.54
#   ^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#     ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^^^^^ meta.format-spec.powershell constant.other.format-spec.powershell
#           ^^^^^^^^ constant.character.escape.powershell
#                   ^ punctuation.definition.placeholder.end.powershell
#                    ^ punctuation.definition.string.end.powershell
#                      ^^ keyword.operator.string-format.powershell
#                      ^ punctuation.definition.keyword.powershell
#                         ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                          ^ punctuation.separator.decimal.powershell

    "{0:POS;NEG;ZERO}" -f -14
#   ^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^^^^^ constant.other.format-spec.powershell
#          ^ punctuation.separator.powershell
#              ^ punctuation.separator.powershell
#                   ^ punctuation.definition.placeholder.end.powershell
#                    ^ punctuation.definition.string.end.powershell
#                      ^^ keyword.operator.string-format.powershell
#                      ^ punctuation.definition.keyword.powershell
#                         ^ keyword.operator.unary.powershell
#                          ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell

    "{0:$## Please}" -f 14
#   ^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell - comment
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^^^ constant.other.format-spec.powershell
#                 ^ punctuation.definition.placeholder.end.powershell
#                  ^ punctuation.definition.string.end.powershell
#                    ^^ keyword.operator.string-format.powershell
#                    ^ punctuation.definition.keyword.powershell
#                       ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell

    "{0,-8:P1}" -f 1.75
#   ^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.powershell
#         ^ punctuation.separator.format-spec.powershell
#          ^^ constant.other.format-spec.powershell
#            ^ punctuation.definition.placeholder.end.powershell
#             ^ punctuation.definition.string.end.powershell
#               ^^ keyword.operator.string-format.powershell
#               ^ punctuation.definition.keyword.powershell
#                  ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                   ^ punctuation.separator.decimal.powershell

    "{0,10:N3}{1,10:N3}{2,10:N3}{3,10:N3}" -f 0.2, 0.3, 0.45, 0.91
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.powershell
#         ^ punctuation.separator.format-spec.powershell
#          ^^ constant.other.format-spec.powershell
#            ^ punctuation.definition.placeholder.end.powershell
#             ^ punctuation.definition.placeholder.begin.powershell
#               ^ punctuation.separator.powershell
#                  ^ punctuation.separator.format-spec.powershell
#                   ^^ constant.other.format-spec.powershell
#                     ^ punctuation.definition.placeholder.end.powershell
#                      ^ punctuation.definition.placeholder.begin.powershell
#                        ^ punctuation.separator.powershell
#                           ^ punctuation.separator.format-spec.powershell
#                            ^^ constant.other.format-spec.powershell
#                              ^ punctuation.definition.placeholder.end.powershell
#                               ^ punctuation.definition.placeholder.begin.powershell
#                                 ^ punctuation.separator.powershell
#                                    ^ punctuation.separator.format-spec.powershell
#                                     ^^ constant.other.format-spec.powershell
#                                       ^ punctuation.definition.placeholder.end.powershell
#                                        ^ punctuation.definition.string.end.powershell
#                                          ^^ keyword.operator.string-format.powershell
#                                          ^ punctuation.definition.keyword.powershell
#                                             ^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                                              ^ punctuation.separator.decimal.powershell
#                                                ^ punctuation.separator.sequence.powershell
#                                                  ^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                                                   ^ punctuation.separator.decimal.powershell
#                                                     ^ punctuation.separator.sequence.powershell
#                                                       ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                                                        ^ punctuation.separator.decimal.powershell
#                                                           ^ punctuation.separator.sequence.powershell
#                                                             ^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                                                              ^ punctuation.separator.decimal.powershell

    # Single-quoted format string
    '{0:00000.000}' -f 7.125
#   ^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#   ^ punctuation.definition.string.begin.powershell
#    ^^^^^^^^^^^^^ constant.other.placeholder.powershell
#    ^ punctuation.definition.placeholder.begin.powershell
#      ^ punctuation.separator.format-spec.powershell
#       ^^^^^^^^^ constant.other.format-spec.powershell
#                ^ punctuation.definition.placeholder.end.powershell
#                 ^ punctuation.definition.string.end.powershell
#                   ^^ keyword.operator.string-format.powershell
#                   ^ punctuation.definition.keyword.powershell
#                      ^^^^^ meta.number.float.decimal.powershell constant.numeric.value.powershell
#                       ^ punctuation.separator.decimal.powershell
