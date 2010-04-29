# st: trimTrailingWhiteSpaceOnSave false


<#
    .synopsis
    this is some text

    .parameter eco
#>

# this is a comment
# .synopsis
# this is not quite what i expected. really...



10 -gt 11

# STRINGS ===============================================================

"""" # empty string
"''"
""
"Eco this is a string"
"(hey!)"
"`"This contains `n some `$escaped characters.`b, even quotes `""
"""There are some things that don't""."

"This is more complicated $(get-item | out-string)."
"This is more complicated $(get-item | each-object { out-string } )."
this | is it
hey
"This is more complicated $(get-item; ""This is illegal ()" | foreach-object { (""") } )."

"This string is 
invalid"

"This string is `
valid"

"This string is ` 
valid. There's a space at the end."

'This is an invalid
string.'

'This is a valid `
string.'

'This is a valid ` 
string. It has a space at the end; or it should.'

'' # this should be perfectly legal

'This is some `n ''$%&/ string too '''

@"

   "This is a string
   here."  `n no escaed chars here.
   But surely $vars are just ${variables here too!}

"@

switch -regex {
    "abc" { }
    default { "$(this is it)" }


}


"This is stuff here"
@"
    text here is interpolated! $(this-is | it > $eco)
"@

@'
    text here is not interpolated! $(this is it)
'@

get-item $()

if (10 -gt 100) { }

"This $(
        get-item -lt (gi ""this is ""-filter `"txt.txt`"); 10 -gt 11 | out-string | set-content $(gi sublime:output.txt) )"""

@"
    $(1 -lt 0)
    "This is a normal string."
    'This is a single quoted string.'
    # this is not a comment.
"@

@'
    -gt "This that"
'@

What the heck?