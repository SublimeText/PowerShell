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

function Get-SublimeScopesFromFile
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string] $filePath
    )

    # splitted in two lines, because of a bug in Sort-Object
    $scopes = cat -Raw $filePath | ConvertFrom-Json
    $scopes = $scopes | sort -Property @('startOffset', 'endOffset')
    return $scopes
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

function Select-TokenByOffset
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [System.Management.Automation.Language.Token] $token,
        [int] $offset
    )

    process 
    {
        if (((Get-TokenStartOffset $token) -le $offset) -and ((Get-TokenEndOffset $token) -gt $offset)) {
            return $token
        }
    }
}

function Get-TokenStartOffset
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [System.Management.Automation.Language.Token] $token
    )

    process 
    {
        # Adjust offsets for CRLF
        return $token.Extent.StartOffset - $token.Extent.StartLineNumber + 1
    }
}

function Get-TokenEndOffset
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [System.Management.Automation.Language.Token] $token
    )

    process 
    {
        # Adjust offsets for CRLF
        return $token.Extent.EndOffset - $token.Extent.EndLineNumber + 1
    }
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
            startOffset = Get-TokenStartOffset $token
            endOffset = Get-TokenEndOffset $token
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

function Test-ScopesEqual
{
    [CmdletBinding()]
    param(
        $leftScope,
        $rightScope
    )
    if ($leftScope.startOffset -ne $rightScope.startOffset) {return $false} 
    if ($leftScope.endOffset -ne $rightScope.endOffset) {return $false}
    if ($leftScope.Text -ne $rightScope.Text) {return $false}
    #TODO: this is week, need to verify that Kind is the same
    #if ($leftScope.Kind.Split('.')[0] -ne $rightScope.Kind.Split('.')[0]) {return $false}
    return $true
}

function Get-Max
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        $object
    )

    begin
    {
        $max = $null
    }

    process
    {
        if (-not $max)
        {
            $max = $object
        } else {
            if ($object -gt $max) {
                $max = $object
            }    
        }
    }

    end 
    {
        return $max
    }
}