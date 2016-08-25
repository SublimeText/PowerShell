$packageName = "ms-vscode.PowerShell-0.7.1"

# Find the path to the Sublime Text packages folder
if ($IsLinux) {
    $basePackagesPath = "$HOME/.config/sublime-text-3/Packages/"
}
elseif ($IsOSX) {
    $basePackagesPath = "$HOME/Library/Application Support/Sublime Package 3/Packages/"
}
else {
    # Assumption is that $IsWindows is true or it doesn't exist
    # because we're using Windows PowerShell
    $basePackagesPath = "$env:APPDATA\Sublime Text 3\Packages\"
}

$packagePath = Join-Path $basePackagesPath "PowerShell"

# Does the package path exist?
if (Test-Path $packagePath) {
    Write-Error "The PowerShell package already exists at the following path: $packagePath.  We do not automatically delete this path in case you need to back up your current installation.`r`n`r`nPlease move or delete this path before continuing.`r`n`r`n" -ErrorAction Stop
}

# Clone the package repo into the packages path
git clone -b editor-services https://github.com/daviwil/SublimePowerShell.git $packagePath

# Create the modules path and download modules into it
$modulesPath = "$packagePath/editorservices/modules"
New-Item -ItemType Directory $modulesPath

Write-Output "Downloading dependencies...`r`n"
Invoke-WebRequest -Uri "https://github.com/PowerShell/vscode-powershell/releases/download/v0.7.1/ms-vscode.PowerShell-0.7.1.zip" -OutFile "$modulesPath/$packageName.zip"

Expand-Archive -Path "$modulesPath/$packageName.zip" -DestinationPath $modulesPath
Copy-Item -Recurse -Path "$modulesPath/$packageName/modules/*" -Include @("PowerShellEditorServices", "PSScriptAnalyzer") -Destination $modulesPath -Force

Remove-Item -Force "$modulesPath/$packageName.zip"
Remove-Item -Recurse -Force "$modulesPath/$packageName"
