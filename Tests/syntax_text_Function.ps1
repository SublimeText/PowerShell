# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using module Microsoft.Management
# <- keyword.control.using
#     ^ keyword.other
#            ^ variable.parameter

<#
# <- punctuation.definition.comment.block.begin
    .Synopsis
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Short description
    .DESCRIPTION
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Long description
    .EXAMPLE
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Example of how to use this cmdlet
    .EXAMPLE
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Another example of how to use this cmdlet
    .INPUTS
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Inputs to this cmdlet (if any)
    .OUTPUTS
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        Output from this cmdlet (if any)
    .NOTES
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        General notes
    .COMPONENT
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        The component this cmdlet belongs to
    .ROLE
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
        The role this cmdlet belongs to
    .FUNCTIONALITY
    # <- constant.string.documentation
    # ^ keyword.operator.documentation
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
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                   ^ meta.attribute keyword.operator.assignment
        #                    ^ meta.attribute punctuation.definition.variable
        #                     ^^^^ meta.attribute constant.language
        #                         ^ meta.attribute keyword.operator.other
                   ValueFromPipeline=$true,
        #          ^^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                           ^ meta.attribute keyword.operator.assignment
        #                            ^ meta.attribute punctuation.definition.variable
        #                             ^^^^ meta.attribute constant.language
        #                                 ^ meta.attribute keyword.operator.other
                   ValueFromPipelineByPropertyName = $true,
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                                          ^ meta.attribute keyword.operator.assignment
        #                                            ^ meta.attribute punctuation.definition.variable
        #                                             ^^^^ meta.attribute constant.language
        #                                                 ^ meta.attribute keyword.operator.other
                   ValueFromRemainingArguments=$false,
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                                     ^ meta.attribute keyword.operator.assignment
        #                                      ^ meta.attribute punctuation.definition.variable
        #                                       ^^^^^ meta.attribute constant.language
        #                                            ^ meta.attribute keyword.operator.other
                   Position=0,
        #          ^^^^^^^^ meta.attribute variable.parameter.attribute
        #                  ^ meta.attribute keyword.operator.assignment
        #                   ^ meta.attribute constant.numeric.integer
        #                    ^ meta.attribute keyword.operator.other
                   ParameterSetName = 'Parameter Set 1')]
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                           ^ meta.attribute keyword.operator.assignment
        #                             ^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                              ^ meta.attribute punctuation.section.group.end
        #                                               ^ meta.attribute punctuation.section.bracket.end
        [ValidateNotNullOrEmpty()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                      ^ meta.attribute punctuation.section.group.begin
        #                       ^ meta.attribute punctuation.section.group.end
        #                        ^ meta.attribute punctuation.section.bracket.end
        [ValidateNotNull()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #               ^ meta.attribute punctuation.section.group.begin
        #                ^ meta.attribute punctuation.section.group.end
        #                 ^ meta.attribute punctuation.section.bracket.end
        [ValidateNotNullOrEmpty()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                      ^ meta.attribute punctuation.section.group.begin
        #                       ^ meta.attribute punctuation.section.group.end
        #                        ^ meta.attribute punctuation.section.bracket.end
        [ValidateCount(0,5)]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #             ^ meta.attribute punctuation.section.group.begin
        #              ^ meta.attribute constant.numeric.integer
        #               ^ meta.attribute keyword.operator.other
        #                ^ meta.attribute constant.numeric.integer
        #                 ^ meta.attribute punctuation.section.group.end
        #                  ^ meta.attribute punctuation.section.bracket.end
        [ValidateSet("sun", "moon", "earth")]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #           ^ meta.attribute punctuation.section.group.begin
        #            ^^^^ meta.attribute string.quoted.double
        #                 ^ meta.attribute keyword.operator.other
        #                   ^^^^^^ meta.attribute string.quoted.double
        #                         ^ meta.attribute keyword.operator.other
        #                           ^^^^^^^ meta.attribute string.quoted.double
        #                                  ^ meta.attribute punctuation.section.group.end
        #                                   ^ meta.attribute punctuation.section.bracket.end
        [Alias("p1")]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #     ^ meta.attribute punctuation.section.group.begin
        #      ^^^^ meta.attribute string.quoted.double
        #          ^ meta.attribute punctuation.section.group.end
        #           ^ meta.attribute punctuation.section.bracket.end
        $Param1,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ keyword.operator.other

        # Param2 help description
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
        [AllowNull()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^ meta.attribute punctuation.section.group.end
        #           ^ meta.attribute punctuation.section.bracket.end
        [AllowEmptyCollection()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                    ^ meta.attribute punctuation.section.group.begin
        #                     ^ meta.attribute punctuation.section.group.end
        #                      ^ meta.attribute punctuation.section.bracket.end
        [AllowEmptyString()]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #                ^ meta.attribute punctuation.section.group.begin
        #                 ^ meta.attribute punctuation.section.group.end
        #                  ^ meta.attribute punctuation.section.bracket.end
        [ValidateScript({$true})]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #              ^ meta.attribute punctuation.section.group.begin
        #               ^ meta.scriptblock meta.attribute
        #                ^ meta.attribute punctuation.definition.variable
        #                 ^^^^ meta.scriptblock constant.language
        #                     ^ meta.scriptblock meta.attribute
        #                      ^ meta.attribute punctuation.section.group.end
        #                       ^ meta.attribute punctuation.section.bracket.end
        [ValidateRange(0,5)]
        # <- meta.attribute punctuation.section.bracket.begin
        # ^ meta.attribute support.function.attribute
        #             ^ meta.attribute punctuation.section.group.begin
        #              ^ meta.attribute constant.numeric.integer
        #               ^ meta.attribute keyword.operator.other
        #                ^ meta.attribute constant.numeric.integer
        #                 ^ meta.attribute punctuation.section.group.end
        #                  ^ meta.attribute punctuation.section.bracket.end
        [int32]
        # <- punctuation.section.bracket.begin
        # ^ storage.type
        #     ^ punctuation.section.bracket.end
        $Param2,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ keyword.operator.other

        # Param3 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Another Parameter Set')]
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
        #                ^ meta.attribute keyword.operator.other
        #                 ^^ meta.attribute constant.numeric.integer
        #                   ^ meta.attribute punctuation.section.group.end
        #                    ^ meta.attribute punctuation.section.bracket.end
        [String]
        # <- punctuation.section.bracket.begin
        # ^ storage.type
        #      ^ punctuation.section.bracket.end
        $Param3,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ keyword.operator.other

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
        #                           ^ meta.scriptblock support.variable.automatic
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
        #      ^ keyword.operator.other

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
