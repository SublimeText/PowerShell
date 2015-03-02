Contributing
============

There are two permanent brances: **master** and **dev**.
**Master** always points to the latest release tag. 
All development is done in **dev** branch, 
please, use it for pull requests.


Run tests locally
-----------------
The most up-to date version can be crafted by following [appveyor tests steps](appveyor.yml).
Currently tests use hardcoded path for a sublime text installation `C:\st`. 
You can use the same script [appveyour.ps1](https://github.com/randy3k/UnitTesting/blob/master/sbin/appveyor.ps1) for installing sublime and tests execution.
Separate installation used to avoid accident breaking the main installtion.

One time install:

1. download [appveyour.ps1](https://github.com/randy3k/UnitTesting/blob/master/sbin/appveyor.ps1).
2. run one-time bootstrap: `.\appveyor.ps1 "bootstrap" -verbose` to install ST in `C:\st` and download [UnitTesting](https://github.com/randy3k/UnitTesting) package.
3. Install PowerShell unit testing framework [Pester](https://github.com/pester/Pester).

Run tests:

1. Run python tests `.\appveyor.ps1 "run_tests" -verbose`. They generate inputs for pester tests.
2. Run pester tests `Invoke-Pester`.
