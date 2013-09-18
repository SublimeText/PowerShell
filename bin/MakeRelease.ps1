param([switch]$DontUpload=$False)

# PowerShell 3 defines PSScriptRoot in scripts
$root = split-path $PSScriptRoot -parent
$dist = Join-Path $root "dist"
push-location $root

    if(Test-Path $dist) {
	    Write-Warning "Removing $dist\*"
    	remove-item $dist\* -recurse -force
    }
	# Ensure MANIFEST reflects all changes to file system.
	remove-item ".\MANIFEST" -ErrorAction silentlycontinue

	python (Join-Path $root .\setup.py) spa | Write-Host -fore cyan

	(get-item ".\dist\PowerShell.sublime-package").fullname | clip.exe

pop-location

