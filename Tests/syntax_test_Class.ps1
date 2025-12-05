# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace system.management.automation
# <- keyword.control.using
#     ^^^^^^^^^ keyword.other
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter

# Define a class
class TypeName
# <- storage.type
#     ^^^^^^^^ entity.name.class
#     @@@@@@@@ definition
{
    # Property with validate set
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    [ValidateSet("val1", "Val2")]
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
    # <- punctuation.section.brackets.begin
    # ^^^^^^^^^^ support.function.attribute
    #           ^ punctuation.section.group.begin
    #            ^^^^^^ string.quoted.double
    #                  ^ punctuation.separator
    #                    ^^^^^^ string.quoted.double
    #                          ^ punctuation.section.group.end
    #                           ^ punctuation.section.brackets.end
    [string] $P1
    # <- punctuation.section.brackets.begin
    # ^^^^^ storage.type
    #      ^ punctuation.section.brackets.end
    #        ^ punctuation.definition.variable
    #         ^^ variable.other.readwrite

    # Static property
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    static [hashtable] $P2
    #^^^^^ storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^^^^^^^^^ storage.type
    #                ^ punctuation.section.brackets.end
    #                  ^ punctuation.definition.variable
    #                   ^^ variable.other.readwrite

    # Hidden property does not show as result of Get-Member
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    hidden [int] $P3
    #^^^^^ storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^ storage.type
    #          ^ punctuation.section.brackets.end
    #            ^ punctuation.definition.variable
    #             ^^ variable.other.readwrite

    # Constructor
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^ comment.line
    TypeName ([string] $s) {
        #    ^ punctuation.section.group.begin
        #     ^ punctuation.section.brackets.begin
        #      ^^^^^^ storage.type
        #            ^ punctuation.section.brackets.end
        #              ^ punctuation.definition.variable
        #               ^ variable.other.readwrite
        #                ^ punctuation.section.group.end
        $this.P1 = $s
        # <- punctuation.definition.variable
        # ^ variable.language
        #     ^^ variable.other.member
        #        ^ keyword.operator.assignment
        #          ^ punctuation.definition.variable
        #           ^ variable.other.readwrite
    }

    # Static method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^ comment.line
    static [void] MemberMethod1([hashtable] $h) {
    # <- storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^^^^ storage.type
    #           ^ punctuation.section.brackets.end
    #             ^^^^^^^^^^^^^ entity.name.function
    #             @@@@@@@@@@@@@ definition
    #                          ^ punctuation.section.group.begin
    #                           ^ punctuation.section.brackets.begin
    #                            ^^^^^^^^^ storage.type
    #                                     ^ punctuation.section.brackets.end
    #                                       ^ punctuation.definition.variable
    #                                        ^ variable.other.readwrite
    #                                         ^ punctuation.section.group.end
        [TypeName]::P2 = $h
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell meta.block.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^ support.type.powershell
#                ^ punctuation.section.brackets.end.powershell
#                 ^^ punctuation.accessor.double-colon.powershell
#                   ^^ variable.other.member.powershell
#                      ^ keyword.operator.assignment.powershell
#                        ^^ variable.other.readwrite.powershell
#                        ^ punctuation.definition.variable.powershell
    }

    # Instance method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    [int] MemberMethod2([int] $i) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^ storage.type.powershell
#       ^ punctuation.section.brackets.end.powershell
#         ^^^^^^^^^^^^^ entity.name.function.powershell
#         @@@@@@@@@@@@@ definition
#                      ^^^^^^^^^^ meta.group.powershell
#                      ^ punctuation.section.group.begin.powershell
#                       ^ punctuation.section.brackets.begin.powershell
#                        ^^^ storage.type.powershell
#                           ^ punctuation.section.brackets.end.powershell
#                             ^^ variable.other.readwrite.powershell
#                             ^ punctuation.definition.variable.powershell
#                               ^ punctuation.section.group.end.powershell
#                                 ^ meta.block.powershell punctuation.section.braces.begin.powershell
        return $this.P3
        # <- keyword.control
        #      ^ punctuation.definition.variable
        #       ^^^^ variable.language
        #            ^^ variable.other.member
    }
}

[TypeName]::MemberMethod1()
#           @@@@@@@@@@@@@ reference

$object.MemberMethod2()
#       @@@@@@@@@@@@@ reference
