{   "name": "Powershell 3",
    "scopeName": "source.powershell",
    "fileTypes": ["ff", "fff"],
    "foldingStartMarker": "\\{\\s*$",
    "foldingStopMarker": "^\\s*\\}",
    "patterns": [

       {  "begin": "<#",
          "beginCaptures": [
            { "0": { "name": "punctuation.start.definition.comment.block.powershell" } }
          ],
          "end": "#>",
          "endCaptures": [
            { "0": { "name": "punctuation.end.definition.comment.block.powershell" } }
          ],
          "patterns": [

            { "include": "#commentEmbeddedDocs" }

          ],
          "name": "comment.block.powershell"
       },

       {  "begin": "#",
          "end": "$",
          "patterns":[
            { "include": "#commentEmbeddedDocs" }
          ],
          "name": "comment.line.powershell"
       },

       {  "begin": "\"(?!\")" ,
          "end": "\"(?!\")",
          "patterns": [

            { "include": "#doubleQuotedStringEscapes" },
            { "include": "#interpolation" }

          ],
          "name": "string.quoted.double.powershell"
       },

       {  "begin": "'(?!')" ,
          "end": "'(?!')",
          "patterns": [

            { "match": "''",
              "name": "constant.character.escape.powershell"
            }
          ],
          "name": "string.quoted.single.powershell"
       },

       {
          "match": "-([lg][te]|eq|ne)",
          "name": "keyword.operator.logical.powershell"
       }

    ],
    "repository": [

      { "commentEmbeddedDocs": {
            "patterns": [

              { "match": "(?i:\\s*(\\.)(SYNOPSIS|DESCRIPTION|EXAMPLE|INPUTS|OUTPUTS|NOTES|LINK|COMPONENT|FUNCTIONALITY))",
                "name": "comment.documentation.embedded.powershell",
                "captures": [
                  { "1": { "name": "constant.string.documentation.powershell" } },
                  { "2": { "name": "keyword.operator.documentation.powershell"} }
                ]
              },

              {
                "match": "(?i:\\s*(\\.)(PARAMETER|FORWARDHELPTARGETNAME|FORWARDHELPCATEGORY|REMOTEHELPRUNSPACE|EXTERNALHELP)\\s+([a-z0-9-_]+))",
                "name": "comment.documentation.embedded.powershell",
                "captures": [
                  { "1": { "name": "constant.string.documentation.powershell" } },
                  { "2": { "name": "keyword.operator.documentation.powershell"} },
                  { "3": { "name": "keyword.operator.documentation.powershell"} }
                ]
              }
            ]
        }
      },

      {
        "doubleQuotedStringEscapes": {
            "patterns": [

              { "match": "`[0abnfrvt\"'$]",
                "name": "constant.character.escape.powershell"
              },

              { "match": "\"\"",
                "name": "constant.character.escape.powershell"
              }
            ]
        }
      },

      {
        "interpolation": {
            "begin": "\\$\\(",
            "end": "\\)",
            "contentName": "source.powershell",
            "name": "source.interpolated.powershell",
            "patterns": [

              { "include": "#interpolatedStringContent" },
              { "include": "$self" }

            ]
        }
      },

      {
        "interpolatedStringContent": {
            "begin": "\\(",
            "end": "\\)",
            "patterns": [

              { "include": "#interpolatedStringContent" },
              { "include": "#doubleQuotedStringEscapes" },
              { "match": "\"",
                "name": "invalid.powershell"
              },
              { "include": "$self" }
            ]
        }
      }

    ],
    "uuid": "f8f5ffb0-503e-11df-9879-0800200c9a66"
}