param([switch]$Release)

$script:thisDir = split-path $MyInvocation.MyCommand.Path -parent

. (join-path $script:thisDir "Config.ps1")

if(!$?){
	write-error "Could not read config."
	exit 1
}

# copy to local folder
push-location $thisDir
    push-location '..'
        $installedPackages = (GetConfigValue 'global-win' 'installed-packages')
        write-output "copying files..."
        # TODO: Perhaps we should delete the folder first.
        copy-item * -recurse -force -exclude ".git" "$installedPackages/../Packages/PowerShell"
    pop-location
pop-location

write-output "restarting editor... bye!"
start-sleep -milliseconds 100
get-process "sublime_text" | stop-process
start-sleep -milliseconds 250
# sss
$editor = (GetConfigValue 'global-win' 'editor')
if(!$?){
	write-error "Could not locate editor command."
	exit 1
}

&$editor
