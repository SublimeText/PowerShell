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

$toDelete = @(
    "manifest.json",
    "tests",
    "bin"
)

AbortIfGitNotAvailable
AbortIfDirtyWorkingDirectory

try {
    push-location $PSScriptRoot\..

    remove-item -recurse $toDelete

    write-warning "commit the files, tag and push upstream"
    git checkout master
    AbortIfProcessFailed "could not checkout branch master"
}
finally {
    pop-location
}

