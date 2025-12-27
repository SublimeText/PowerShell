# SYNTAX TEST partial-symbols "Packages/PowerShell/PowerShell.sublime-syntax"


    data TextMsgs {
#   ^^^^^^^^^^^^^^^ meta.block.data.powershell
#   ^^^^ keyword.control.context.powershell
#        ^^^^^^^^ entity.name.section.powershell
#                 ^ punctuation.section.block.begin.powershell
        ConvertFrom-StringData -StringData @'
#       @@@@@@@@@@@@@@@@@@@@@@ reference
            Text001 = Windows 7
            Text002 = Windows Server 2008 R2
'@
    }

    $TextMsgs
