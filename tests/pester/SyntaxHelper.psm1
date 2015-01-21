function Get-TokensFromFile
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string] $filePath
    )

     # Adjust offsets for CRLF
    Get-TokensFromInput (cat -raw $filePath).Replace("`r`n","`n")
}

function Get-SublimeScopesFromFile
{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string] $filePath
    )

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
        if (($token.Extent.startOffset -le $offset) -and ($token.Extent.endOffset -gt $offset)) {
            return $token
        }
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
            startOffset = $token.Extent.startOffset 
            endOffset = $token.Extent.endOffset 
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