# Helpers to read files in this format:
#
#   global-win editor path/to/some/bin
#   project-foo deploy-url http://some/url/here
#   ...

$script:pathToConfig = "~/.sublime-package-dev.json"

function GetConfigData {
    if(!(test-path $pathToConfig)){
        write-error "Could not find configuration file '$pathToConfig'."
        exit 1
    }

    return (get-content $pathToConfig) -join "`n" | convertfrom-json
}

function GetConfigValue {
    param($key)
    return (GetConfigData).$key
}
