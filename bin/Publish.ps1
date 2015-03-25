<#
    .DESCRIPTION
    Publishes to 'master' after deleting dev files.
#>

param([string]$Tag)

function AbortIfProcessFailed {
    param([string]$message)
    if ($LASTEXITCODE) { throw $message }
    exit $LASTEXITCODE
}

function AbortIfDirtyWorkingDirectory {
    if (@(git status --short).Count -ne 0) {
        throw "uncommited changes "
        exit 1
    }
}

function AbortIfGitNotAvailable {
    get-command git -erroraction stop > $null
}

function AbortIfNotOnMaster {
    if (@(git branch | select-string "* master" -simplematch).Count -eq 0) {
        throw "not on 'master' branch" 
        exit 1
    }
}

$toDelete = @(
    "manifest.json",
    "tests",
    "bin"
)

AbortIfGitNotAvailable
AbortIfDirtyWorkingDirectory
AbortIfNotOnMaster

try {
    push-location $PSScriptRoot\..

    remove-item -recurse $toDelete -exclude "Publish.ps1" -whatif

    write-warning "commit the files, tag and push upstream"
}
finally {
    pop-location
}

