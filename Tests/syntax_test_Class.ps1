# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace system.management.automation
# <- keyword.control.using
#     ^^^^^^^^^ keyword.other
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter

# Define a class
class TypeName
# <- storage.type
#     ^ entity.name.class
{
    # Property with validate set
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    [ValidateSet("val1", "Val2")]
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
    # <- punctuation.section.bracket.begin
    # ^^^^^^^^^^ support.function.attribute
    #           ^ punctuation.section.group.begin
    #            ^^^^^^ string.quoted.double
    #                  ^ punctuation.separator
    #                    ^^^^^^ string.quoted.double
    #                          ^ punctuation.section.group.end
    #                           ^ punctuation.section.bracket.end
    [string] $P1
    # <- punctuation.section.bracket.begin
    # ^^^^^ storage.type
    #      ^ punctuation.section.bracket.end
    #        ^ punctuation.definition.variable
    #         ^^ variable.other.readwrite

    # Static property
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    static [hashtable] $P2
    #^^^^^ storage.modifier
    #      ^ punctuation.section.bracket.begin
    #       ^^^^^^^^^ storage.type
    #                ^ punctuation.section.bracket.end
    #                  ^ punctuation.definition.variable
    #                   ^^ variable.other.readwrite

    # Hidden property does not show as result of Get-Member
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    hidden [int] $P3
    #^^^^^ storage.modifier
    #      ^ punctuation.section.bracket.begin
    #       ^ storage.type
    #          ^ punctuation.section.bracket.end
    #            ^ punctuation.definition.variable
    #             ^^ variable.other.readwrite

    # Constructor
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^ comment.line
    TypeName ([string] $s) {
        #    ^ punctuation.section.group.begin
        #     ^ punctuation.section.bracket.begin
        #      ^^^^^^ storage.type
        #            ^ punctuation.section.bracket.end
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
    #      ^ punctuation.section.bracket.begin
    #       ^^^^ storage.type
    #           ^ punctuation.section.bracket.end
    #                          ^ punctuation.section.group.begin
    #                           ^ punctuation.section.bracket.begin
    #                            ^^^^^^^^^ storage.type
    #                                     ^ punctuation.section.bracket.end
    #                                       ^ punctuation.definition.variable
    #                                        ^ variable.other.readwrite
    #                                         ^ punctuation.section.group.end
        [TypeName]::P2 = $h
        # <- punctuation.section.bracket.begin
        # ^ storage.type
        #        ^ punctuation.section.bracket.end
        #              ^ keyword.operator.assignment
        #                ^ punctuation.definition.variable
        #                 ^ variable.other.readwrite
    }

    # Instance method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    [int] MemberMethod2([int] $i) {
    # <- punctuation.section.bracket.begin
    # ^ storage.type
    #   ^ punctuation.section.bracket.end
    #                  ^ punctuation.section.group.begin
    #                   ^ punctuation.section.bracket.begin
    #                    ^^^ storage.type
    #                       ^ punctuation.section.bracket.end
    #                         ^ punctuation.definition.variable
    #                          ^ variable.other.readwrite
    #                           ^ punctuation.section.group.end
        $this.P3 = $i
        # <- punctuation.definition.variable
        # ^^^ variable.language
        #     ^^ variable.other.member
        #        ^ keyword.operator.assignment
        #          ^ punctuation.definition.variable
        #           ^ variable.other.readwrite
        return $this.P3
        # <- keyword.control
        #      ^ punctuation.definition.variable
        #       ^^^^ variable.language
        #            ^^ variable.other.member
    }
}
