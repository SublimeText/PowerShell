throw "NEVER RUN THIS FILE!"
### New PowerShell 4 stuff:

# the undiscoverable foreach
@("any","array","has").foreach({ $_ })
@('any','array','has').foreach{ $_ }

# the undiscoverable where
@("any","array","has").where({ $_.Length -gt 3 })
@("any","array","has").where{ $_.Length -gt 3 }

# dynamic method invocation
$var = get-item $Env:SystemRoot
$WhatToGet = "Files"
$var.("Get" + $WhatToGet)()
$var.($Full + "Name")
$Full = "Full"
$var.($Full + "Name")

Configuration Crazyness {
    Node Whatever {

    }
}

### PowerShell 3 and older:

#   st: trimTrailingWhiteSpaceOnSave false
<#
    Let's see what embedded docs in comments look like...
    TODO: inside here, .<tab> should present list of doc keywords

    .synopsis
    this is some text

    .PARAMETER eco
#>
# An example function: The name should (all) be highlighted right.
function Get-MemberSignature {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [System.Reflection.MethodBase]$MethodBase,
        [Switch]$Simple
    )
    process {
        someApp.exe -argOne "one" -argTwo two
        # The whole script name is the command, not just the part before the extension
        Some-Script.ps1 -argOne one -argTwo "two"
        &"Some Script.bat" -param $PSVersionTable -arg 43
    }
}

function echo([string]$text) {
    write-host $text
}


# Highlight types
[int[]][char[]]"hello world"
[string]$someVariable = [char[]](104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100)
[Collections.Generic.List``2[char]]$x = [char[]](104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100)
[Collections.Generic.List[char]]$x = [char[]](104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100)


Get-MemberSignature 

Get-Command 
get-thing | Out-WithYou > $null # destroy

# Same with line comment:
# .synopsis
# TODO: .<tab> should present list of doc keywords here too

# TODO: extract user's session vars and style those too.
# TODO: sytyle all ps automatic variables
$a = $false, $true, $null, $False, $FaLsE

# STRINGS ===============================================================
""
''
""""
"''"
'""'
''''
"'"
'"'

# In PowerShell all quoted strings can wrap lines
"This is
a string"

# single ones too
'This is a
string.'

"This is a string."
'This is a string.'

# Escaped characters should be highlighted
"Escaped chars: `", `n, `$, `b, `""

# Including '' in a 'single quoted string'
'But here they''re not escape chars: `", `n, `$, `b, `"'

# And doubled up quotes
"""This is a string."""
"`"This is a string in quotes`"
`"This is still the same string.`""

# Subexpressions cause powershell to reparse, so double quotes create strings inside them
"String with embedded complex subexpression: $(get-item "$mypath/*.*" | out-string)."

# With scriptblock...
"String with embedded complex subexpression and scriptblock $(get-item | each-object { out-string } )."

# More deeply nested...
"String with embedded complex subexpression and complex scriptblock: $(get-item; "String ($variable)" | foreach-object { (get-item "This `"thing`"" | get-member ) } )."

"Now with variables: $result"

# In PowerShell 3 this is necessary to indicate the variable is just "drive"
"Sometimes we use ${drive}:item when refering to objects as variables"

# In PowerShell 2 this is necessary to indicate the variable is "drive:item"
"Sometimes we use ${drive:item} when refering to objects as variables"


# In PowerShell 3 the variable here is "drive:item" not just "drive" (as it would have been in 2)
"Sometimes we use $drive:item when refering to objects as variables"

"But this variable dot-notation $variable.foo shouldn't highlight in a string"

"Although obviously in a $($subexpression.Length) it should be!"

# TODO: can we highlight this as an error?
if(!($PSVersionTable.PSVersion -ge '3.0')) {
    # In PowerShell 3, this will cause an ERROR
    "In PowerShell 2 we could $drive: to add a colon"
}

function get-numbers { 1..3 }
# NOTE: PowerShell can't actually parse this line correctly:
"This is deeply nested: $( get-number | %{ invoke-command { $(("you, do this)) anyway")) } } )"

"When you call a method: $( get-number | %{ invoke-command $( [string]::format("Like (this{0})","what?") ) $var } )"
# " <-- this stops the string above, until we fix the parenthesis on methods.
# TODO: Highlight member access
# TODO: Highlight array access
$(& $($variable.ToArray()[0]))

"This string is
valid"

"This string is `
valid but the ` is consumed."

"This string is ``
valid but the `` is not consumed."

"This string is ` 
valid. There's a space at the end."

'This is a valid `
string. And the ` isn''t consumed'

"Some variables $true here and $false there and $_"
"Some escaped variables `$true here and `$false there `$_"

''

# Note there are no escaped sequences here but for ''.
'This is some `n ''$%&/ string too '''

'This should be a string (there''s no code in it): $(get-onions | very-boring | yeah-right)'


@"
   "This is a here string
   here."  Quotes are "allowed" in it.
   And $variables should be ${variables here too!}
"@


@"
This is a here string piped to something
"@ | Write-Host

@'
This is a ''single-quote'' here string piped to something
'@ | Write-Host

# Variables:
$this_is_a_vaAriable = 100
${this ` is a variable name} = 100,500
# about_scopes lists global, local, script, private (and numbered) scopes.
$global:variable
$private:heyyou 
$script:blah_blah
${script: stupid variable name}

"We need $global:variables in; strings ${ tooh-torooh }"

@"
    "We need $global:variables in; strings ${ tooh-torooh }"
"@

# we don't know what could be a drive letter, so we treat everything that way
$Env:PATH
$Variable:VerbosePreference

# TODO: we should at least highlight built-in aliases
cd C:\Windows

# Yes, this would actually read in win.ini:
${C:win.ini}
${Env:Path}


# array expressions 
# note: we only deal with commands that have legit verbs, so "this-is" is bad, and "an-expression" is unhighlighted
@( this-is | an-expression | "that evaluates $(to-an | array)");

# array operator

$a = 1,2,3,4
$a = "This, shouldn't be, styled."
$a = $("Guess what, happens ""here, hey""" | "Hm... $("this, is" strange.) you can't really pipe to a string, but nevermind for now.")

# numeric constants
100, 200, 300, 0.5, 100.500, .5
1E+73
0xaf20fffKB, 0xaf20fffmb, 0x0aL, 0x0aLmb, 0x0adLPB
100d
.5d
10.5d
1E+3d
.5gb
100.500kb
100dmb
.5dgb
10.5dkb
1E+3dgb
10*10

# terabyte and petabyte
42tb, 42pb, 42Ltb, 42Dpb
# with signs
-5e3, +5e3, +0x34adMB, -0x34adMB, +5Lmb
# L for long
100l, 100L, 100lmb, 100LMB, 100lgb, 100lkb, 42Dpb, 42ltb
1.21e+3l
1.21E-3d
2.12e3lmb
3.1415e3lgb
3.1415e3lkb


# TODO: you can also use this syntax for exponential notation
1e73
1E73
1.12e5
1.12E5
1.12e+5
1.12E+5

# file ext shouldn't be styled as numeric
# TODO: the whole file name really ought to be styled as a command *sigh*
this-isnot.ps1
# FIXME:
a_mistake.here.ps1
"anothermistake.ps1"
# FIXME:
notepad.exe
# TODO: file ext shouldn't be styled as numeric, even if it's short:
get-content test.1


# Piping and redirection:

notepad.exe > log.txt
notepad.exe 1> log.txt
notepad.exe 2>&1
notepad.exe 3>&1
notepad.exe 4>&1
notepad.exe 5>&1
notepad.exe 6>&1
notepad.exe 2>&1> log.txt

if($false) {
    # Note: 7 isn't a valid stream
    notepad.exe 7>&1
}

# TODO: these script blocks should highlight?
# TODO
switch (get-childitem) -regex {
    "abc" { }
    # TODO: This should fold!
    {$_.PSIsContainer()} { 
        get-childitem
    }
    default { 
        "$(this is it)"
    }
}

do {

}

foreach($item in get-childitem) {

}

for($i = 0; $i -lt 10; $i++) {

}

get-item $()

if (10 -cgt 100) { }
$a -is $b
$b -contains $c
$x -notcontains $c
$a -match $b
$a -notmatch $b
$x -like $c
100 -and 0

# Logical operators
$a -ceq 4 -and $a -ine $d -or 
$c -is [Type]
$c -isnot [Type]
$c -as [Type]
$a -ceq 4 -and $a -ine $d -or 
# Bitwise operators
$k = $y -bor $k
$x = $y -band $x
# TODO Missing:
$z = -bnot $x
$k = $y -xor $b
$k = $y -bxor $b


$a -eq 4 -and $a -ne $d -or $k -gt 42 
$a -ceq 4 -and $a -ine $d -or 

#TODO: There are case-sensitive and case-insensitive operators:
$a -icontains $c
$a -ccontains $c
$a -iNotContains $c
$a -cNotContains $c
$a -cmatch $c
$x -iMatch $c
$x -iNotMatch $c
$a -iLike $b
$b -cLike $c
"hey" -cgt "Hey"
"Hey" -igt "hey"
"hey" -cge "Hey"
"Hey" -ige "hey"
"HEY" -clt "hey"
"HEY" -ilt "hey"
"HEY" -cle "hey"
"HEY" -ile "hey"

# this isn't a valid operator:
$x -foobar $y


# format
"{0:c}" -f 12
# TODO: join operator
1,2,3,4 -join "|"

$abc += 200

"this text" > here.txt; epic-fail

# TODO: Built in aliases, at least
"This $(
        get-item -lt (
            gi $("this is") -filter "txt.txt"
        ); 10 -gt 11 | out-string | set-content $(gi sublime:output.txt) )"""

# FIXME:
# heredocs also admit subexps. but single pairs of quote are not invalid!
@"
    $(1 -lt 0 | get-item | out-thing "j")
    "This is a normal string." (with quotes around it)
    The belt was 42" long!
    'This is a single quoted string.'
    # this is not a comment.
    This -is a variable $a but these -not operators.
"@

@'
    -gt "This that"
'@

What the heck? # TODO: That shouldn't look the same as a string

0..10 | foreach-object {
            "something $_"
}
"This should $a not be a {scriptblock}"
{ this-is $(it-at | )
}

# Is there a way we can make "anything" that's in a command position look like a command?
gci * | gm | fl * -force | out-string
useful.ps1 | out-file foo.txt
# TODO: parameter names
# TODO: splatting variables
Get-things.ps1 -value @args

# array subexpression
@(This $a is it. | "$(this-is | @($('yeah'| "" )) )")
