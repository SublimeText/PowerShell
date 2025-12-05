# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"


    Add-Type -Language CSharp @"
#   ^^^^^^^^ support.function.powershell
#            ^^^^^^^^^ variable.parameter.option.powershell
#            ^ punctuation.definition.parameter.powershell
#                             ^^ meta.string.interpolated.powershell string.quoted.double.powershell punctuation.definition.string.begin.powershell
    using System;
#^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell source.cs.embedded
#   ^^^^^ keyword.control.import.cs
#         ^^^^^^ meta.path.cs
    using System.Runtime.InteropServices;
    public class ClassGetForegroundWindow {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell source.cs.embedded
#   ^^^^^^ storage.modifier.access.cs
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.cs
#                ^^^^^^^^^^^^^^^^^^^^^^^^ entity.name.class.cs
#                                         ^ meta.class.body.cs meta.block.cs punctuation.section.block.begin.cs
        [DllImport("user32.dll")]
        public static extern IntPtr GetForegroundWindow();
    }
"@
#^ meta.string.powershell string.quoted.double.powershell punctuation.definition.string.end.powershell - source.cs
