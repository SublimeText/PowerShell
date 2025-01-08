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
#^^^^^^^^^^^^^^^^^ meta.function
#^^^^^^^ storage.type
#        ^^^^^^^^^ entity.name.function
#        @@@@@@@@@ definition
    [CmdletBinding(DefaultParameterSetName  = 'Parameter Set 1',
    # <- meta.attribute punctuation.section.brackets.begin
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
                #                                      ^ meta.attribute punctuation.section.brackets.end
    [Alias()]
    # <- meta.attribute punctuation.section.brackets.begin
    # ^ meta.attribute support.function.attribute
    #     ^ meta.attribute punctuation.section.group.begin
    #      ^ meta.attribute punctuation.section.group.end
    #       ^ meta.attribute punctuation.section.brackets.end
    [OutputType([String])]
    # <- meta.attribute punctuation.section.brackets.begin
    # ^ meta.attribute support.function.attribute
    #          ^ meta.attribute punctuation.section.group.begin
    #           ^ meta.attribute punctuation.section.brackets.begin
    #            ^^^^^^ meta.attribute storage.type
    #                  ^ meta.attribute punctuation.section.brackets.end
    #                   ^ meta.attribute punctuation.section.group.end
    #                    ^ meta.attribute punctuation.section.brackets.end
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
        #              ^ constant.numeric.integer
        #               ^ punctuation.separator
        #                ^ constant.numeric.integer
        #                 ^ punctuation.section.group.end
        #                  ^ punctuation.section.brackets.end
        [int32]
        # <- punctuation.section.brackets.begin
        #^^^^^ storage.type
        #     ^ punctuation.section.brackets.end
        $Param2,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param3 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Another Parameter Set')]
        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                                  ^ meta.attribute punctuation.section.group.end
        #                                                   ^ meta.attribute punctuation.section.brackets.end
        [ValidatePattern("[a-z]*")]
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #               ^ meta.attribute punctuation.section.group.begin
        #                ^^^^^^^^ meta.attribute string.quoted.double
        #                        ^ meta.attribute punctuation.section.group.end
        #                         ^ meta.attribute punctuation.section.brackets.end
        [ValidateLength(0,15)]
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #              ^ meta.attribute punctuation.section.group.begin
        #               ^ meta.attribute constant.numeric.integer
        #                ^ punctuation.separator
        #                 ^^ meta.attribute constant.numeric.integer
        #                   ^ meta.attribute punctuation.section.group.end
        #                    ^ meta.attribute punctuation.section.brackets.end
        [String]
        # <- punctuation.section.brackets.begin
        #^^^^^^ storage.type
        #      ^ punctuation.section.brackets.end
        $Param3,
        # <- punctuation.definition.variable
        #^^^^^^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param4 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                            ^ meta.attribute punctuation.section.group.end
        #                                             ^ meta.attribute punctuation.section.brackets.end
        [ValidateScript({Test-Path $_})] #Make sure cmdlets don't break highlighting
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #              ^ meta.attribute punctuation.section.group.begin
        #               ^ meta.attribute meta.block
        #                ^^^^^^^^^ meta.block support.function
        #                          ^ meta.block punctuation.definition.variable
        #                           ^ meta.block variable.language
        #                            ^ meta.attribute meta.block
        #                             ^ meta.attribute punctuation.section.group.end
        #                              ^ meta.attribute punctuation.section.brackets.end
        [string]
        # <- punctuation.section.brackets.begin
        # ^ storage.type
        #      ^ punctuation.section.brackets.end
        $Param4,
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        #      ^ punctuation.separator

        # Param5 help description
        # <- comment.line punctuation.definition.comment
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #         ^ meta.attribute punctuation.section.group.begin
        #          ^^^^^^^^^^^^^^^^ meta.attribute variable.parameter.attribute
        #                          ^ meta.attribute keyword.operator.assignment
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                            ^ meta.attribute punctuation.section.group.end
        #                                             ^ meta.attribute punctuation.section.brackets.end
        [ValidatePattern('(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')] # this regex shouldn't break highlighting
        # <- meta.attribute punctuation.section.brackets.begin
        # ^ meta.attribute support.function.attribute
        #               ^ meta.attribute punctuation.section.group.begin
        #                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute string.quoted.single
        #                                                                                         ^ meta.attribute punctuation.section.group.end
        #                                                                                          ^ meta.attribute punctuation.section.brackets.end
        #                                                                                            ^ comment.line punctuation.definition.comment
        #                                                                                             ^ comment.line
        [string]
        # <- punctuation.section.brackets.begin
        # ^ storage.type
        #      ^ punctuation.section.brackets.end
        $Param5
        # <- punctuation.definition.variable
        # ^ variable.other.readwrite
        )
        # <- punctuation.section.group.end

    Begin
   #^^^^^ keyword.context.block.begin
    {
    }
    Process {
    # <- keyword.context.block.process
        if ($pscmdlet.ShouldProcess("Target", "Operation")) {
        # <- keyword.control
        #  ^ punctuation.section.group.begin
        #   ^ punctuation.definition.variable
        #    ^^^^^^^^ variable.language
        #             ^^^^^^^^^^^^^ variable.function
        #             @@@@@@@@@@@@@ reference
        #                          ^ punctuation.section.arguments.begin
        #                           ^^^^^^^^ string.quoted.double
        #                                   ^ punctuation.separator
        #                                     ^^^^^^^^^^^ string.quoted.double
        #                                                ^ punctuation.section.arguments.end
        #                                                 ^ punctuation.section.group.end
        }
    }
    End {
   #^^^ keyword.context.block.end

    }
}
