## Contributing

Thanks for taking an insterest in contributing to the PowerShell package for
Sublime Text 3!


### Development

Development happens on the **dev** branch. Please send your PRs against that
branch only.


### Building Development Versions

To build development versions, first you need a configuration file in
`~\sublime-package-dev.json`.

This file must contain the following information:

    {
        "pathToSublimeText": "...\sublime_text.exe",
        "pathToSublimeTextData": "...\
    }


#### Using Sublime Text

1. Press <kbd>Ctrl+Shift+B</kbd> to open the build systems menu.
2. Select 'PowerShell: Build Dev Version'


#### Using the Command Line

From the project's root:

    .\bin\BuildFolder.ps1 -verbose


#### Running Tests

If you are adding functionality or making substantial changes to existing
code, please add tests and ensure that existing tests pass.

Currently, we have very few tests and they aren't easy to run... :-(

If you feel lazy about writing tests, this is the right time to contribute --
we'll turn a blind eye more often now than later on! ;-)
