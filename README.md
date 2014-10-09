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

1. Open the Sublime Text packages folder (`Ctrl + Shift + P` + `browse packages`)
1. Clone [this repo][this_repo] to the packages folder
Now your local version of this package is available in Sublime Text.


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

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
