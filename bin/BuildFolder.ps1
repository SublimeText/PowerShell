<#
    .SYNOPSIS
    Builds a version of the Sublime Text PowerShell package and deploys it
    locally to Data/Packages/PowerShell.

    .DESCRIPTION
    Builds a version of the Sublime Text PowerShell package and deploys it
    locally to Data/Packages/PowerShell.

    Requires a configuration file in ~\.sublime-package-dev.json.
    
    This file must contain the following keys:

        {
            "pathToSublimeText": ...\sublime_text.exe,
            "pathToSublimeTextData": ...
        }
#>
[CmdletBinding()]
param([switch]$Release)

. $PSScriptRoot\Config.ps1

$pathToInstalledPackages = join-path (GetConfigValue pathToSublimeTextData) 'Installed Packages'
test-path $pathToInstalledPackages -erroraction stop > $null
$pathToPackages = join-path (GetConfigValue pathToSublimeTextData) 'Packages'
test-path $pathToPackages -erroraction stop > $null
$pathToPowerShellPackage = join-path $pathToPackages 'PowerShell'

# Deploy package locally.
push-location $PSScriptRoot\..
    if (test-path $pathToPowerShellPackage) {
        write-verbose "Deleting old files..."
        remove-item $pathToPowerShellPackage\* -recurse
    }
    else {
        write-verbose "Creating target directory..."
        new-item -itemtype directory $pathToPowerShellPackage
    }
    write-verbose "Copying files..."
    copy-item * -recurse -exclude 'dist' $pathToPowerShellPackage
pop-location

# Restart editor.
write-verbose "Restarting editor..."
get-process sublime_text -erroraction silentlycontinue | stop-process -erroraction silentlycontinue
start-sleep -milliseconds 250

$editor = GetConfigValue pathToSublimeText
if(!(test-path $editor -erroraction stop)){
    write-error "Could not locate editor executable in '$editor'."
    exit 1
}
& $editor
