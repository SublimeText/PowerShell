[![Build status](https://ci.appveyor.com/api/projects/status/fgbrealw58sd8ado/branch/dev?svg=true)](https://ci.appveyor.com/project/guillermooo/powershell/branch/dev)


## PowerShell Package for Sublime Text 3

Adds support for the MS PowerShell programming language.


### Installing

1. Install [package control][package_control] for Sublime Text.
1. Install the **PowerShell** package:

	1. Press <kbd>Ctrl + Shift + P</kbd>
	1. Select 'Install Package'
	1. Select 'PowerShell'

### PowerShell Editor Services integration (experimental)

We now have integration with [PowerShell Editor Services](https://github.com/PowerShell/PowerShellEditorServices)
to enable additional language features when editing PowerShell scripts in **Windows**, **Linux** and **OS X**:

- Full syntax checking with error markers in your source
- Full code completion (IntelliSense) from the PowerShell engine
- [PowerShell Script Analyzer](https://github.com/PowerShell/PSScriptAnalyzer) integration for rule-based analysis with integrated markers
- In-editor script evaluation using the "PowerShell: Run Selection" command
- Initial support for the [$psEditor API](http://powershell.github.io/PowerShellEditorServices/guide/extensions.html)

If you're using Sublime Text 3 you'd like to try out this experimental PowerShell Editor Services
integration follow these steps:

1. Start PowerShell in a terminal and run the [Setup-EditorServices.ps1](https://github.com/daviwil/SublimePowerShell/blob/editor-services/editorservices/Setup-EditorServices.ps1)
   script, either by copy/pasting its contents or saving to a file

   *NOTE: This step is temporary until we publish an official PS Gallery package for PowerShell Editor Services*

2. Start Sublime Text 3 and open your user settings:

   - **Windows** and **Linux**: `Preferences -> Settings - User`
   - **OS X**: `Sublime Text -> Preferences -> Settings - User`

3. Add the following text in your settings file to enable the language service:

   ```json
	"powershell_language_services_enabled": true
   ```

4. Restart Sublime Text and open a PowerShell file and start editing!

If nothing works, check the developer console (<kbd>Ctrl + `</kbd>), copy the logs you see
there and paste them into a new GitHub issue on this repository.

#### Known issues with PowerShell Editor Services integration

- IntelliSense sometimes inserts the incorrect substring.  This will be corrected soon.
- There are no keybindings for the commands that come with the plugin.  We are investigating the issue.
- Can't hover over syntax/semantic markers in the script and see the message.  This is a limitation in
  Sublime Text's APIs and should be resolved in an upcoming Sublime update.
- PowerShell process do not get closed when Sublime exits.  We need to wire up a shutdown handler to
  properly kill the PowerShell subprocess upon shutdown.
  

### Developing

You want to contribute? Awesome! Take a look at [CONTRIBUTING.md](CONTRIBUTING.md).


[package_control]: https://sublime.wbond.net/installation
