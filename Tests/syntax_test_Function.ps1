# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

using module Microsoft.Management
#^^^^ keyword.control.import.powershell
#     ^^^^^^ keyword.control.import.powershell
#            ^^^^^^^^^^^^^^^^^^^^ meta.path.powershell
#                     ^ punctuation.accessor.dot.powershell
#                      ^^^^^^^^^^ support.type.powershell

function Test-Path {}
#        @@@@@@@@@ definition
<#
# <- punctuation.definition.comment.block.begin
    .Synopsis
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Short description
    .DESCRIPTION
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Long description
    .EXAMPLE
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Example of how to use this cmdlet
    .EXAMPLE
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Another example of how to use this cmdlet
    .INPUTS
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Inputs to this cmdlet (if any)
    .OUTPUTS
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        Output from this cmdlet (if any)
    .NOTES
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        General notes
    .COMPONENT
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        The component this cmdlet belongs to
    .ROLE
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        The role this cmdlet belongs to
    .FUNCTIONALITY
    # <- punctuation.definition.keyword
    # ^ keyword.other.documentation
        The functionality that best describes this cmdlet
    .ForwardHelpCategory Alias
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.block.powershell comment.documentation.embedded.powershell
#   ^ punctuation.definition.keyword.documentation.powershell
#    ^^^^^^^^^^^^^^^^^^^ keyword.other.documentation.powershell
#                        ^^^^^ support.type.powershell

    .parameter foo
#^^^^^^^^^^^^^^^^^ comment.block.powershell comment.documentation.embedded.powershell
#   ^ punctuation.definition.keyword.documentation.powershell
#    ^^^^^^^^^ keyword.other.documentation.param.powershell
#              ^^^ variable.parameter.powershell

    .LINK https://example.com
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.block.powershell comment.documentation.embedded.powershell
#   ^ punctuation.definition.keyword.documentation.powershell
#    ^^^^ keyword.other.documentation.powershell
#         ^^^^^^^^^^^^^^^^^^^ markup.underline.link.powershell

    This should not be considered documentaton -> .role
                                                  # ^ - keyword.operator.documentation
#>
# <- punctuation.definition.comment.block.end
function Verb-Noun {
#^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#^^^^^^^ keyword.declaration.function.powershell
#        ^^^^^^^^^ entity.name.function.powershell
#        @@@@@@@@@ definition
#                  ^ punctuation.section.block.begin.powershell
    [CmdletBinding(DefaultParameterSetName  = 'Parameter Set 1',
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                           ^ keyword.operator.assignment.powershell
#                                             ^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                             ^ punctuation.definition.string.begin.powershell
#                                                             ^ punctuation.definition.string.end.powershell
#                                                              ^ punctuation.separator.sequence.powershell
                   SupportsShouldProcess    = $true,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                           ^ keyword.operator.assignment.powershell
#                                             ^^^^^ constant.language.boolean.true.powershell
#                                             ^ punctuation.definition.variable.powershell
#                                                  ^ punctuation.separator.sequence.powershell
                   PositionalBinding        = $false,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                           ^ keyword.operator.assignment.powershell
#                                             ^^^^^^ constant.language.boolean.false.powershell
#                                             ^ punctuation.definition.variable.powershell
#                                                   ^ punctuation.separator.sequence.powershell
                   HelpUri                  = 'http://www.microsoft.com/',
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.attribute.powershell
#                  ^^^^^^^ variable.parameter.attribute.powershell
#                                           ^ keyword.operator.assignment.powershell
#                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                             ^ punctuation.definition.string.begin.powershell
#                                                                       ^ punctuation.definition.string.end.powershell
#                                                                        ^ punctuation.separator.sequence.powershell
                   ConfirmImpact            = 'Medium')]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                           ^ keyword.operator.assignment.powershell
#                                             ^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                             ^ punctuation.definition.string.begin.powershell
#                                                    ^ punctuation.definition.string.end.powershell
#                                                     ^ punctuation.section.group.end.powershell
#                                                      ^ punctuation.section.brackets.end.powershell
    [Alias()]
#^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^^ meta.attribute.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^ support.function.attribute.powershell
#         ^ punctuation.section.group.begin.powershell
#          ^ punctuation.section.group.end.powershell
#           ^ punctuation.section.brackets.end.powershell
    [OutputType([String])]
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^^^^ support.function.attribute.powershell
#              ^ punctuation.section.group.begin.powershell
#               ^ punctuation.section.brackets.begin.powershell
#                ^^^^^^ support.type.powershell
#                      ^ punctuation.section.brackets.end.powershell
#                       ^ punctuation.section.group.end.powershell
#                        ^ punctuation.section.brackets.end.powershell
    Param
#^^^^^^^^ meta.function.powershell
#   ^^^^^ keyword.declaration.parameter.powershell
    (
#^^^^ meta.function.powershell
#   ^ meta.block.parameters.powershell punctuation.section.block.begin.powershell
        # Param1 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(Mandatory=$true,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^ variable.parameter.attribute.powershell
#                           ^ keyword.operator.assignment.powershell
#                            ^^^^^ constant.language.boolean.true.powershell
#                            ^ punctuation.definition.variable.powershell
#                                 ^ punctuation.separator.sequence.powershell
                   ValueFromPipeline=$true,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                   ^ keyword.operator.assignment.powershell
#                                    ^^^^^ constant.language.boolean.true.powershell
#                                    ^ punctuation.definition.variable.powershell
#                                         ^ punctuation.separator.sequence.powershell
                   ValueFromPipelineByPropertyName = $true,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                                  ^ keyword.operator.assignment.powershell
#                                                    ^^^^^ constant.language.boolean.true.powershell
#                                                    ^ punctuation.definition.variable.powershell
#                                                         ^ punctuation.separator.sequence.powershell
                   ValueFromRemainingArguments=$false,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                             ^ keyword.operator.assignment.powershell
#                                              ^^^^^^ constant.language.boolean.false.powershell
#                                              ^ punctuation.definition.variable.powershell
#                                                    ^ punctuation.separator.sequence.powershell
                   Position=0,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell meta.attribute.powershell
#                  ^^^^^^^^ variable.parameter.attribute.powershell
#                          ^ keyword.operator.assignment.powershell
#                           ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                            ^ punctuation.separator.sequence.powershell
                   ParameterSetName = 'Parameter Set 1')]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell meta.attribute.powershell
#                  ^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                   ^ keyword.operator.assignment.powershell
#                                     ^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                     ^ punctuation.definition.string.begin.powershell
#                                                     ^ punctuation.definition.string.end.powershell
#                                                      ^ punctuation.section.group.end.powershell
#                                                       ^ punctuation.section.brackets.end.powershell
        [ValidateNotNullOrEmpty()]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^^^^^^^^^ support.function.attribute.powershell
#                              ^ punctuation.section.group.begin.powershell
#                               ^ punctuation.section.group.end.powershell
#                                ^ punctuation.section.brackets.end.powershell
        [ValidateNotNull()]
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^^ support.function.attribute.powershell
#                       ^ punctuation.section.group.begin.powershell
#                        ^ punctuation.section.group.end.powershell
#                         ^ punctuation.section.brackets.end.powershell
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
        #              ^ constant.numeric.value
        #               ^ punctuation.separator
        #                ^ constant.numeric.value
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
        $Param1,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param2 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # ^^^^^^^^ support.function.attribute
        #          ^^^^^^^^^^^^^^^^ variable.parameter.attribute
        #                          ^ keyword.operator.assignment
        #                            ^^^^^^^^^^^^^^^^ string.quoted.single
        #                                            ^ punctuation.section.group.end
        #                                             ^ punctuation.section.brackets.end
        #                                               ^ - meta.attribute
        [AllowNull()]
        #^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^ meta.attribute punctuation.section.group.end
        #           ^ meta.attribute punctuation.section.brackets.end
        [AllowEmptyCollection()]
        #^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #                    ^ meta.attribute punctuation.section.group.begin
        #                     ^ meta.attribute punctuation.section.group.end
        #                      ^ meta.attribute punctuation.section.brackets.end
        [AllowEmptyString()]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #                ^ meta.attribute punctuation.section.group.begin
        #                 ^ meta.attribute punctuation.section.group.end
        #                  ^ meta.attribute punctuation.section.brackets.end
        [ValidateScript({$true})]
        #^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^^^^^^^^^^^^^ support.function.attribute
        #              ^ punctuation.section.group.begin
        #               ^ meta.attribute
        #                ^ punctuation.definition.variable
        #                 ^^^^ constant.language
        #                     ^ meta.attribute
        #                      ^ punctuation.section.group.end
        #                       ^ punctuation.section.brackets.end
        [ValidateRange(0,5)]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^^^^^^^^^^^^ support.function.attribute
        #             ^ punctuation.section.group.begin
        #              ^ constant.numeric.value
        #               ^ punctuation.separator
        #                ^ constant.numeric.value
        #                 ^ punctuation.section.group.end
        #                  ^ punctuation.section.brackets.end
        [int32]
#^^^^^^^^^^^^^^ meta.function.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^ storage.type.powershell
#             ^ punctuation.section.brackets.end.powershell
        $Param2,
#^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^^^^^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#              ^ punctuation.separator.sequence.powershell

        # Param3 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Another Parameter Set')]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                  ^ keyword.operator.assignment.powershell
#                                   ^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                   ^ punctuation.definition.string.begin.powershell
#                                                         ^ punctuation.definition.string.end.powershell
#                                                          ^ punctuation.section.group.end.powershell
#                                                           ^ punctuation.section.brackets.end.powershell
        [ValidatePattern("[a-z]*")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^^ support.function.attribute.powershell
#                       ^ punctuation.section.group.begin.powershell
#                        ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                        ^ punctuation.definition.string.begin.powershell
#                               ^ punctuation.definition.string.end.powershell
#                                ^ punctuation.section.group.end.powershell
#                                 ^ punctuation.section.brackets.end.powershell
        [ValidateLength(0,15)]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^ support.function.attribute.powershell
#                      ^ punctuation.section.group.begin.powershell
#                       ^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                        ^ punctuation.separator.sequence.powershell
#                         ^^ meta.number.integer.decimal.powershell constant.numeric.value.powershell
#                           ^ punctuation.section.group.end.powershell
#                            ^ punctuation.section.brackets.end.powershell
        [String]
#^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^ support.type.powershell
#              ^ punctuation.section.brackets.end.powershell
        $Param3,
#^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#              ^ punctuation.separator.sequence.powershell

        # Param4 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                  ^ keyword.operator.assignment.powershell
#                                   ^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                   ^ punctuation.definition.string.begin.powershell
#                                                   ^ punctuation.definition.string.end.powershell
#                                                    ^ punctuation.section.group.end.powershell
#                                                     ^ punctuation.section.brackets.end.powershell
        [ValidateScript({Test-Path $_})] # Make sure cmdlets don't break highlighting
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^ support.function.attribute.powershell
#                      ^ punctuation.section.group.begin.powershell
#                       ^^^^^^^^^^^^^^ meta.block.powershell
#                       ^ punctuation.section.braces.begin.powershell
#                        ^^^^^^^^^ meta.function-call.powershell support.function.powershell
#                        @@@@@@@@@ reference
#                                 ^^^ meta.function-call.arguments.powershell
#                                  ^^ variable.language.powershell
#                                  ^ punctuation.definition.variable.powershell
#                                    ^ punctuation.section.braces.end.powershell
#                                     ^ punctuation.section.group.end.powershell
#                                      ^ punctuation.section.brackets.end.powershell
#                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
#                                        ^ punctuation.definition.comment.powershell
        [string]
#^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^ storage.type.powershell
#              ^ punctuation.section.brackets.end.powershell
        $Param4,
#^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
#              ^ punctuation.separator.sequence.powershell

        # Param5 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^ support.function.attribute.powershell
#                 ^ punctuation.section.group.begin.powershell
#                  ^^^^^^^^^^^^^^^^ variable.parameter.attribute.powershell
#                                  ^ keyword.operator.assignment.powershell
#                                   ^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                                   ^ punctuation.definition.string.begin.powershell
#                                                   ^ punctuation.definition.string.end.powershell
#                                                    ^ punctuation.section.group.end.powershell
#                                                     ^ punctuation.section.brackets.end.powershell
        [ValidatePattern('(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')] # this regex shouldn't break highlighting
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^^^^^^^^ support.function.attribute.powershell
#                       ^ punctuation.section.group.begin.powershell
#                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.powershell string.quoted.single.powershell
#                        ^ punctuation.definition.string.begin.powershell
#                              ^^^^^^^ constant.other.placeholder.powershell
#                              ^ punctuation.definition.placeholder.begin.powershell
#                                ^ punctuation.separator.powershell
#                                    ^ punctuation.definition.placeholder.end.powershell
#                                                                   ^^^^^^ constant.other.placeholder.powershell
#                                                                   ^ punctuation.definition.placeholder.begin.powershell
#                                                                     ^ punctuation.separator.powershell
#                                                                        ^ punctuation.definition.placeholder.end.powershell
#                                                                                         ^^^^ constant.other.placeholder.powershell
#                                                                                         ^ punctuation.definition.placeholder.begin.powershell
#                                                                                           ^ punctuation.separator.powershell
#                                                                                            ^ punctuation.definition.placeholder.end.powershell
#                                                                                                ^ punctuation.definition.string.end.powershell
#                                                                                                 ^ punctuation.section.group.end.powershell
#                                                                                                  ^ punctuation.section.brackets.end.powershell
#                                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
#                                                                                                    ^ punctuation.definition.comment.powershell
        [string]
#^^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^ storage.type.powershell
#              ^ punctuation.section.brackets.end.powershell
        $Param5
#^^^^^^^^^^^^^^ meta.function.powershell meta.block.parameters.powershell
#       ^^^^^^^ variable.other.readwrite.powershell
#       ^ punctuation.definition.variable.powershell
    )
#^^^^ meta.function.powershell meta.block.parameters.powershell
#   ^ punctuation.section.block.end.powershell

    Begin
#^^^^^^^^ meta.function.powershell
#   ^^^^^ keyword.context.block.powershell
    {
#^^^^ meta.function.powershell
#   ^ punctuation.section.block.begin.powershell
    }
    Process {
#^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^ keyword.context.block.powershell
#           ^ punctuation.section.block.begin.powershell
        if ($pscmdlet.ShouldProcess("Target", "Operation")) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#       ^^ keyword.control.conditional.if.powershell
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.powershell
#          ^ punctuation.section.group.begin.powershell
#           ^^^^^^^^^ variable.language.powershell
#           ^ punctuation.definition.variable.powershell
#                    ^ punctuation.accessor.dot.powershell
#                     ^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#                     @@@@@@@@@@@@@ reference
#                                  ^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.powershell
#                                  ^ punctuation.section.arguments.begin.powershell
#                                   ^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                                   ^ punctuation.definition.string.begin.powershell
#                                          ^ punctuation.definition.string.end.powershell
#                                           ^ punctuation.separator.sequence.powershell
#                                             ^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                                             ^ punctuation.definition.string.begin.powershell
#                                                       ^ punctuation.definition.string.end.powershell
#                                                        ^ punctuation.section.arguments.end.powershell
#                                                         ^ punctuation.section.group.end.powershell
#                                                           ^ meta.block.powershell punctuation.section.braces.begin.powershell
        }
    }
    End {
#^^^^^^^^ meta.function.powershell
#   ^^^ keyword.context.block.powershell
#       ^ punctuation.section.block.begin.powershell

    }
    clean { }
#^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^ keyword.context.block.powershell
#         ^ punctuation.section.block.begin.powershell
#           ^ punctuation.section.block.end.powershell
}
