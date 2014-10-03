## You can't trust the variables that are available in a console, they're not a complete list.
## So we should fall back to whatever is documented (please Update-Help first):
## The documents have the variables on lines by themselves 
## Variables can't have any of these characters in them (including space):  ,.:[]\*
$result = ( @(
     (get-help about_Preference_Variables | out-string -width 10e6)+
     (get-help about_Automatic_Variables  | out-string -width 10e6)
   ) -split "[\r\n]+" -match '^\s*\$[^ ,.:+*\[\]\\]+\s*$' -replace " " -replace '^\$' | 
        sort-object -unique | foreach-object { [regex]::escape($_)}
) -join '|'


# clip.exe method will fail on older OSes
# We could test for Vista or higher with:
### if([System.Environment]::OSVersion.Version.Major -gt 5
###    $result | clip.exe
### }
# But this method pretty much "always" works (perhaps not on Server Core?)
Add-Type -Assembly System.Windows.Forms
[System.Windows.Forms.Clipboard]::SetText( $result )
