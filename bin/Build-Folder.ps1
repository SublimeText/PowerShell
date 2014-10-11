<#
    .SYNOPSIS
    Builds a version of the Sublime Text PowerShell package and deploys it
    locally to Data/Packages/PowerShell.

    .DESCRIPTION
    Builds a version of the Sublime Text PowerShell package and deploys it
    locally to Data/Packages/PowerShell.
#>
[CmdletBinding()]
param([switch]$Release)

$script:thisDir = split-path $MyInvocation.MyCommand.Path -parent

. (join-path $script:thisDir "Config.ps1")
if(!$?){
    write-error "Could not read configuration file."
    exit 1
}

$installedPackages = (GetConfigValue 'global-win' 'installed-packages')
$packagesFolder = "$installedPackages/../Packages"
$pathToPowerShellPackage = "$packagesFolder/PowerShell"

# Deploy package locally.
push-location $thisDir
    push-location '..'
        if (test-path $pathToPowerShellPackage) {
            write-verbose "Deleting old files..."
            remove-item "$pathToPowerShellPackage/*" -recurse -force
        }
        else {
            write-verbose "Creating target directory..."
            new-item -itemtype 'directory' $pathToPowerShellPackage
        }
        write-verbose "Copying files..."
        copy-item * -recurse -force -exclude ".git" $pathToPowerShellPackage
    pop-location
pop-location

# Restart editor.
write-verbose "Restarting editor..."
get-process "sublime_text" -erroraction 'silentlycontinue' | `
    stop-process -erroraction 'silentlycontinue'

start-sleep -milliseconds 250

$editor = (GetConfigValue 'global-win' 'editor')
if(!$?){
    write-error "Could not locate editor command."
    exit 1
}

&$editor
