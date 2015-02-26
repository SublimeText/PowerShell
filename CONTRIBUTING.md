Contributing
============

There are two permanent brances: **master** and **dev**.
**Master** always points to the latest release tag. 
All development is done in **dev** branch, 
please, use it for pull requests.

If you are fixing grammar (syntax highlighting), please, add affected samples to [test-file.ps1](/tests/samples/test-file.ps1). 
We use it in automated tests that compare grammar against PowerShell tokenizer.
It also serves as a place for humans to stair into all exotic language constructions.
