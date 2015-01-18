function Get-TokensFromFile
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string] $filePath
    )

    $tokens = $null
    $errors = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseFile((Resolve-Path $filePath).Path, [ref]$tokens, [ref]$errors)

    return $tokens
}


function Get-TokensFromInput
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string] $inputString
    )

    $tokens = $null
    $errors = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($inputString, [ref]$tokens, [ref]$errors)

    return $tokens
}
