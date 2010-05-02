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

# TODO: keywords get styled here and they shouldn't
"This is deeply nested $( stuff-here | %{ why-would { $( ""you, do this anyway"") }})"


"This string is 
valid"

"This string is `
valid but the ` is consumed."

# FIXME: This is wrongly styled; the string is legal.
# (?<!`)(\s*\n) doesn't work, though.
"This string is ` 
valid. There's a space at the end."

'This is an invalid
string.'

'This is a valid `
string.'

# FIXME: This is wrongly styled; the string is legal.
# (?<!`)(\s*\n) doesn't work, though.
'This is a valid ` 
string. It has a space at the end; or it should.'

'' # this should be perfectly legal

# Note there are no escaped sequences here but for ''.
'This is some `n ''$%&/ string too '''

'This should be $(get-onions | very-boring | yeah-right)'

@"

   "This is a string
   here."  `n no escaed chars here.
   But surely $vars are just ${variables here too!}

"@

# Variables:
$this_is_a_vaAriable = 100
${this ` is a variable name}
$global:variable
$private:heyyou # Not documented, but it seems to work. TODO: teST!
$script:blah_blah
${script: stupid variable name}

"We need $global:variables in; strings ${ tooh-torooh }"


# array expressions

@( this-is | an-expression | "that evaluates $(to-an | array)");

# array operator

$a = 1,2,3,4
$a = "This, shouldn't be, styled."
$a = $("Guess what, happens ""here, hey""" | "Hm... $(""this, is"" strange.)")


# numeric constants

100, 200, 300
1E+73
0xaf20fff
.5
100.500
100d
.5d
10.5d
1E+3d

switch -regex {
    "abc" { }
    default { "$(this is it)" }


}

do {
 }

"This is stuff here"
@"
    text here is interpolated! $(this-is | it > $eco)
"@

@'
    text here is not interpolated!; $(this is it)
'@

get-item $()

if (10 -cgt 100) { }
$a -is $b
$b -contains $c
$x -notcontains $c
100 -and 0

$abc += 200

"this text" >| here.txt; epic-fail

"This $(
        get-item -lt (gi ""this is ""-filter `"txt.txt`"); 10 -gt 11 | out-string | set-content $(gi sublime:output.txt) )"""

# FIXME:
# heredocs also admit subexps. but single pairs of quote are not invalid!
@"
    $(1 -lt 0 | get-item | out-thing "j")
    "This is a normal string."
    'This is a single quoted string.'
    # this is not a comment.
"@

@'
    -gt "This that"
'@

What the heck?