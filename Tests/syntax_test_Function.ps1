# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"

using module Microsoft.Management
# <- keyword.control.using
#     ^ keyword.other
#            ^ variable.parameter

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

    This should not be considered documentaton -> .role
                                                  # ^ - keyword.operator.documentation
#>
# <- punctuation.definition.comment.block.end
function Verb-Noun {
# <- meta.function storage.type
#        ^ meta.function entity.name.function
    [CmdletBinding(DefaultParameterSetName  = 'Parameter Set 1',
    # <- meta.attribute punctuation.section.bracket.begin
    # ^ meta.attribute support.function.attribute
    #             ^ meta.attribute punctuation.section.group.begin
    #              ^ meta.attribute variable.parameter.attribute
    #                                       ^ meta.attribute keyword.operator.assignment
    #                                         ^ meta.attribute string.quoted.single
                   SupportsShouldProcess    = $true,
                #  ^^^^^^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
                #                           ^ meta.attribute keyword.operator.assignment
                #                             ^ meta.attribute punctuation.definition.variable
                #                              ^^^^ meta.attribute constant.language
                   PositionalBinding        = $false,
                #  ^^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
                #                           ^ meta.attribute keyword.operator.assignment
                #                             ^ meta.attribute punctuation.definition.variable
                #                              ^^^^^ meta.attribute constant.language
                   HelpUri                  = 'http://www.microsoft.com/',
                #  ^^^^^^^ meta.attribute variable.parameter.attribute
                #                           ^ meta.attribute keyword.operator.assignment
                #                              ^ meta.attribute string.quoted.single
                   ConfirmImpact            = 'Medium')]
                #  ^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
                #                           ^ meta.attribute keyword.operator.assignment
                #                              ^ meta.attribute string.quoted.single
                #                                     ^ meta.attribute punctuation.section.group.end
                #                                      ^ meta.attribute punctuation.section.bracket.end
    [Alias()]
    # <- meta.attribute punctuation.section.bracket.begin
    # ^ meta.attribute support.function.attribute
    #     ^ meta.attribute punctuation.section.group.begin
    #      ^ meta.attribute punctuation.section.group.end
    #       ^ meta.attribute punctuation.section.bracket.end
    [OutputType([String])]
    # <- meta.attribute punctuation.section.bracket.begin
    # ^ meta.attribute support.function.attribute
    #          ^ meta.attribute punctuation.section.group.begin
    #           ^ meta.attribute punctuation.section.bracket.begin
    #            ^^^^^^ meta.attribute storage.type
    #                  ^ meta.attribute punctuation.section.bracket.end
    #                   ^ meta.attribute punctuation.section.group.end
    #                    ^ meta.attribute punctuation.section.bracket.end
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
        #                                             ^ punctuation.section.bracket.end
        #                                               ^ - meta.attribute
        [AllowNull()]
        #^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^ meta.attribute punctuation.section.group.end
        #           ^ meta.attribute punctuation.section.bracket.end
        [AllowEmptyCollection()]
        #^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                    ^ meta.attribute punctuation.section.group.begin
        #                     ^ meta.attribute punctuation.section.group.end
        #                      ^ meta.attribute punctuation.section.bracket.end
        [AllowEmptyString()]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                ^ meta.attribute punctuation.section.group.begin
        #                 ^ meta.attribute punctuation.section.group.end
        #                  ^ meta.attribute punctuation.section.bracket.end
        [ValidateScript({$true})]
        #^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^^^^^^^^^^^^^ support.function.attribute
        #              ^ punctuation.section.group.begin
        #               ^ meta.attribute
        #                ^ punctuation.definition.variable
        #                 ^^^^ constant.language
        #                     ^ meta.attribute
        #                      ^ punctuation.section.group.end
        #                       ^ punctuation.section.bracket.end
        [ValidateRange(0,5)]
        #^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^^^^^^^^^^^^ support.function.attribute
        #             ^ punctuation.section.group.begin
        #              ^ constant.numeric.integer
        #               ^ punctuation.separator
        #                ^ constant.numeric.integer
        #                 ^ punctuation.section.group.end
        #                  ^ punctuation.section.bracket.end
        [int32]
        # <- punctuation.section.bracket.begin
        #^^^^^ storage.type
        #     ^ punctuation.section.bracket.end
        $Param2,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param3 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Another Parameter Set')]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                                  ^ meta.attribute punctuation.section.group.end
        #                                                   ^ meta.attribute punctuation.section.bracket.end
        [ValidatePattern("[a-z]*")]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #               ^ meta.attribute punctuation.section.group.begin
        #                ^^^^^^^^ meta.attribute string.quoted.double
        #                        ^ meta.attribute punctuation.section.group.end
        #                         ^ meta.attribute punctuation.section.bracket.end
        [ValidateLength(0,15)]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #              ^ meta.attribute punctuation.section.group.begin
        #               ^ meta.attribute constant.numeric.integer
        #                ^ punctuation.separator
        #                 ^^ meta.attribute constant.numeric.integer
        #                   ^ meta.attribute punctuation.section.group.end
        #                    ^ meta.attribute punctuation.section.bracket.end
        [String]
        # <- punctuation.section.bracket.begin
        #^^^^^^ storage.type
        #      ^ punctuation.section.bracket.end
        $Param3,
        # <- punctuation.definition.variable
        #^^^^^^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param4 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                            ^ meta.attribute punctuation.section.group.end
        #                                             ^ meta.attribute punctuation.section.bracket.end
        [ValidateScript({Test-Path $_})] #Make sure cmdlets don't break highlighting
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #              ^ meta.attribute punctuation.section.group.begin
        #               ^ meta.attribute meta.scriptblock
        #                ^^^^^^^^^ meta.scriptblock support.function
        #                          ^ meta.scriptblock punctuation.definition.variable
        #                           ^ meta.scriptblock variable.language
        #                            ^ meta.attribute meta.scriptblock
        #                             ^ meta.attribute punctuation.section.group.end
        #                              ^ meta.attribute punctuation.section.bracket.end
        [string]
        # <- punctuation.section.bracket.begin
        # ^ storage.type
        #      ^ punctuation.section.bracket.end
        $Param4,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param5 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                            ^ meta.attribute punctuation.section.group.end
        #                                             ^ meta.attribute punctuation.section.bracket.end
        [ValidatePattern('(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')] # this regex shouldn't break highlighting
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #               ^ meta.attribute punctuation.section.group.begin
        #                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                                                                         ^ meta.attribute punctuation.section.group.end
        #                                                                                          ^ meta.attribute punctuation.section.bracket.end
        #                                                                                            ^ comment.line punctuation.definition.comment
        #                                                                                             ^ comment.line
        [string]
        # <- punctuation.section.bracket.begin
        # ^ storage.type
        #      ^ punctuation.section.bracket.end
        $Param5
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        )
        # <- punctuation.section.group.end

    Begin
    # <- keyword.control
    {
    }
    Process {
    # <- keyword.control
        if ($pscmdlet.ShouldProcess("Target", "Operation")) {
        # <- keyword.control
        #  ^ punctuation.section.group.begin
        #   ^ punctuation.definition.variable
        #    ^^^^^^^^ variable.language
        #             ^^^^^^^^^^^^^ variable.other.member
        #                          ^ punctuation.section.group.begin
        #                                                ^ punctuation.section.group.end
        #                                                 ^ punctuation.section.group.end
        }
    }
    End {
    # <- keyword.control

    }
}
