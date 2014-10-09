PowerShell
==========

Support for the MS PowerShell programming language.


# Install

1. Install [package control][package_control] for Sublime Text.
1. Install the **PowerShell** package:

	1. `Ctrl + Shift + P`
	1. `install`
	1. `powershell`


# Development


## Requirements

- Python 3.3 (build scripts)


## Generating `PowerShell.sublime-package`

First of all, you need to create a config file:

```
~/.sublime-package-dev
```

Add this content:

```
global-win editor ~/path/to/sublime_text.exe
global-win installed-packages ~/path/to/sublime-text/Installed Packages
```

- Clone [this repo][this_repo] to a folder of your choice
- Open the `PowerShell.sublime-project` included as a project
- Select Tools --> Build Systems --> Run
- Press <kbd>F7</kbd> to build and publish locally a new dev version


## Syntax 

The plist file [PowershellSyntax.tmLanguage](Support/PowershellSyntax.tmLanguage)
is the syntax definition's master file. 

However, the [recommended way][syntax_topic] to edit the syntax definition
is YAML format. To use this format, follow these steps:

1. Using Package Control, install the `AAAPackageDev` package.
1. Open **PowershellSyntax.tmLanguage**.
1. Call `Ctrl + Shift + P` + `convert to Yaml and Rearrange`.
   You will get a new file: **Support/PowershellSyntax.YAML-tmLanguage**.
1. Edit the YAML file.
1. Call `Ctrl + Shift + P` + `convert (YAML, JSON, Plist) to`.
   You will get and updated version of the plist file.


[package_control]: https://sublime.wbond.net/installation
[this_repo]: https://github.com/SublimeText/PowerShell
[syntax_topic]: http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/extensibility/syntaxdefs.html