PowerShell
==========

Support for the MS PowerShell programming language.

# Install
1. Install [package control](https://sublime.wbond.net/installation) for Sublime Text.
1. Install package **PowerShell** (`Ctrl + Shift + P` + `install` + `powershell`)

# Development
1. Open sublime packages folder (`Ctrl + Shift + P` + `browse packages`)
1. Clone [this repo](https://github.com/SublimeText/PowerShell) to packages folder. Now your local version of package is available in sublime.

## Syntax 
1. Plist file [PowershellSyntax.tmLanguage]([tree/master/Support/PowershellSyntax.tmLanguage) is the master file for syntax. But the [recommended way](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/extensibility/syntaxdefs.html) to develop syntax is YAML.
1. Install `aaapackagedev` package.
1. Open **PowershellSyntax.tmLanguage**
1. Call `Ctrl + Shift + P` + `convert to YAML`. You will get new file **Support/PowershellSyntax.YAML-tmLanguage**.
1. Make your changes in YAML file.
1. Call `Ctrl + Shift + P` + `convert YAML to`. You will get updated version of plist file.
