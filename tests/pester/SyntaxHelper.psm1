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

function Convert-TokenToScope
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [System.Management.Automation.Language.Token] $token
    )

    process 
    {
        if (@('NewLine', 'EndOfInput') -contains $token.Kind) {
            # ignore these tokens
            return
        }

        $h = @{
            text = $token.Text
            # Adjust offsets for CRLF
            startOffset = $token.Extent.StartOffset - $token.Extent.StartLineNumber + 1
            endOffset = $token.Extent.EndOffset - $token.Extent.EndLineNumber + 1
            kind = $token.Kind
        }

        New-Object -TypeName PSObject -Property $h
    }    
}

function Test-ScopeInclosure
{
    [CmdletBinding()]
    param(
        $inScope,
        $outScope
    )

    if ($inScope.startOffset -lt $outScope.startOffset)
    {
        return $false
    }

    if ($inScope.endOffset -gt $outScope.endOffset)
    {
        return $false
    }    

    return $true
}

function Test-ScopeDisclosure
{
    [CmdletBinding()]
    param(
        $leftScope,
        $rightScope
    )

    if ($leftScope.endOffset -le $rightScope.startOffset)
    {
        return $true
    }

    if ($leftScope.startOffset -ge $rightScope.endOffset)
    {
        return $false
    }    

    return $false
}