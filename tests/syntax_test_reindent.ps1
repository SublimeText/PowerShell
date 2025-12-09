# SYNTAX TEST reindent "Packages/PowerShell/PowerShell.sublime-syntax"
Function Get-ForegroundWindow {
    Add-Type @"
    using System; using System.Runtime.InteropServices; public class ClassGetForegroundWindow {
        [DllImport("user32.dll")]
        public static extern IntPtr GetForegroundWindow();
    }
"@

    return [ClassGetForegroundWindow]::GetForegroundWindow()
}

Get-ForegroundWindow

if ($true) {
    Write-Host 'test'
} elseif ($false) {
    Write-Host 'test2'
} else {
    Write-Host 'test3'
}
