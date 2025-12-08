# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace system.management.automation
#^^^^ keyword.control.import.powershell
#     ^^^^^^^^^ keyword.control.import.powershell
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.path.powershell
#                     ^ punctuation.accessor.dot.powershell
#                                ^ punctuation.accessor.dot.powershell

class Foo : Bar, Baz {  }
#^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#^^^^ keyword.declaration.class.powershell
#     ^^^ entity.name.class.powershell
#     @@@ definition
#         ^ punctuation.separator.type.powershell
#           ^^^ entity.other.inherited-class.powershell
#           @@@ reference
#              ^ punctuation.separator.sequence.powershell
#                ^^^ entity.other.inherited-class.powershell
#                @@@ reference
#                    ^ punctuation.section.block.begin.powershell
#                       ^ punctuation.section.block.end.powershell

# Define a class
class TypeName
#^^^^^^^^^^^^^ meta.class.powershell
#^^^^ keyword.declaration.class.powershell
#     ^^^^^^^^ entity.name.class.powershell
#     @@@@@@@@ definition
{
    # Property with validate set
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    [ValidateSet("val1", "Val2")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^^^^^^ support.function.attribute.powershell
#               ^ punctuation.section.group.begin.powershell
#                ^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                ^ punctuation.definition.string.begin.powershell
#                     ^ punctuation.definition.string.end.powershell
#                      ^ punctuation.separator.sequence.powershell
#                        ^^^^^^ meta.string.interpolated.powershell string.quoted.double.powershell
#                        ^ punctuation.definition.string.begin.powershell
#                             ^ punctuation.definition.string.end.powershell
#                              ^ punctuation.section.group.end.powershell
#                               ^ punctuation.section.brackets.end.powershell
    [string] $P1
#^^^^^^^^^^^^^^^ meta.class.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^^^^ storage.type.powershell
#          ^ punctuation.section.brackets.end.powershell
#            ^^^ variable.other.readwrite.powershell
#            ^ punctuation.definition.variable.powershell

    # Static property
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    static [hashtable] $P2
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^ storage.modifier.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^^^^^^^ storage.type.powershell
#                    ^ punctuation.section.brackets.end.powershell
#                      ^^^ variable.other.readwrite.powershell
#                      ^ punctuation.definition.variable.powershell

    # Hidden property does not show as result of Get-Member
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    hidden [int] $P3
#^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^ storage.modifier.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^ storage.type.powershell
#              ^ punctuation.section.brackets.end.powershell
#                ^^^ variable.other.readwrite.powershell
#                ^ punctuation.definition.variable.powershell

    # Constructor
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^ comment.line
    TypeName ([string] $s) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^^^^^^^^ entity.name.function.powershell
#   @@@@@@@@ definition
#            ^ punctuation.section.parameters.begin.powershell
#             ^ punctuation.section.brackets.begin.powershell
#              ^^^^^^ storage.type.powershell
#                    ^ punctuation.section.brackets.end.powershell
#                      ^^ variable.parameter.powershell
#                      ^ punctuation.definition.variable.begin.powershell
#                        ^ punctuation.section.parameters.end.powershell
#                          ^ punctuation.section.block.begin.powershell
        $this.P1 = $s
#^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell
#       ^^^^^ variable.language.powershell
#       ^ punctuation.definition.variable.powershell
#            ^ punctuation.accessor.dot.powershell
#             ^^ variable.other.member.powershell
#                ^ keyword.operator.assignment.powershell
#                  ^^ variable.other.readwrite.powershell
#                  ^ punctuation.definition.variable.powershell
    }
#    ^ - meta.function
    # Static method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^ comment.line
    static [void] MemberMethod1([hashtable] $h) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^^^^^^ storage.modifier.powershell
#          ^ punctuation.section.brackets.begin.powershell
#           ^^^^ storage.type.powershell
#               ^ punctuation.section.brackets.end.powershell
#                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#                 ^^^^^^^^^^^^^ entity.name.function.powershell
#                 @@@@@@@@@@@@@ definition
#                              ^ punctuation.section.parameters.begin.powershell
#                               ^ punctuation.section.brackets.begin.powershell
#                                ^^^^^^^^^ storage.type.powershell
#                                         ^ punctuation.section.brackets.end.powershell
#                                           ^^ variable.parameter.powershell
#                                           ^ punctuation.definition.variable.begin.powershell
#                                             ^ punctuation.section.parameters.end.powershell
#                                               ^ punctuation.section.block.begin.powershell
        [TypeName]::P2 = $h
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell
#       ^ punctuation.section.brackets.begin.powershell
#        ^^^^^^^^ support.type.powershell
#                ^ punctuation.section.brackets.end.powershell
#                 ^^ punctuation.accessor.double-colon.powershell
#                   ^^ variable.other.member.powershell
#                      ^ keyword.operator.assignment.powershell
#                        ^^ variable.other.readwrite.powershell
#                        ^ punctuation.definition.variable.powershell
    }

    # Instance method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    [int] MemberMethod2([int] $i) {
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^ storage.type.powershell
#       ^ punctuation.section.brackets.end.powershell
#         ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#         ^^^^^^^^^^^^^ entity.name.function.powershell
#         @@@@@@@@@@@@@ definition
#                      ^ punctuation.section.parameters.begin.powershell
#                       ^ punctuation.section.brackets.begin.powershell
#                        ^^^ storage.type.powershell
#                           ^ punctuation.section.brackets.end.powershell
#                             ^^ variable.parameter.powershell
#                             ^ punctuation.definition.variable.begin.powershell
#                               ^ punctuation.section.parameters.end.powershell
#                                 ^ punctuation.section.block.begin.powershell
        return $this.P3
#^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell
#       ^^^^^^ keyword.control.flow.return.powershell
#              ^^^^^ variable.language.powershell
#              ^ punctuation.definition.variable.powershell
#                   ^ punctuation.accessor.dot.powershell
#                    ^^ variable.other.member.powershell
    }
}

[TypeName]::MemberMethod1()
#           @@@@@@@@@@@@@ reference

$object.MemberMethod2()
#       @@@@@@@@@@@@@ reference


# PowerShell documentation examples
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes

# Example 1 - Minimal definition
class Device {
#     @@@@@@ definition
    [string]$Brand
}

$dev = [Device]::new()
#                @@@ reference
$dev.Brand = "Fabrikam, Inc."
$dev


# Example 2 - Class with instance members
class Book {
#     @@@@ definition
    # Class properties
    [string]   $Title
    [string]   $Author
    [string]   $Synopsis
    [string]   $Publisher
    [datetime] $PublishDate
    [int]      $PageCount
    [string[]] $Tags
    # Default constructor
    Book() { $this.Init(@{}) }
#   @@@@ definition
#                  @@@@ reference
    # Convenience constructor from hashtable
    Book([hashtable]$Properties) { $this.Init($Properties) }
#   @@@@ definition
#                                        @@@@ reference
    # Common constructor for title and author
    Book([string]$Title, [string]$Author) {
#   @@@@ definition
        $this.Init(@{Title = $Title; Author = $Author })
#             @@@@ reference
    }
    # Shared initializer method
    [void] Init([hashtable]$Properties) {
#          @@@@ definition
        foreach ($Property in $Properties.Keys) {
            $this.$Property = $Properties.$Property
        }
    }
    # Method to calculate reading time as 2 minutes per page
    [timespan] GetReadingTime() {
#              @@@@@@@@@@@@@@ definition
        if ($this.PageCount -le 0) {
            throw 'Unable to determine reading time from page count.'
        }
        $Minutes = $this.PageCount * 2
        return [timespan]::new(0, $Minutes, 0)
#                          @@@ reference
    }
    # Method to calculate how long ago a book was published
    [timespan] GetPublishedAge() {
#              @@@@@@@@@@@@@@@ definition
        if (
            $null -eq $this.PublishDate -or
            $this.PublishDate -eq [datetime]::MinValue
        ) { throw 'PublishDate not defined' }

        return (Get-Date) - $this.PublishDate
#               @@@@@@@@ reference
    }
    # Method to return a string representation of the book
    [string] ToString() {
#            @@@@@@@@ definition
        return "$($this.Title) by $($this.Author) ($($this.PublishDate.Year))"
    }
}

[BookList]::Add([Book]::new(@{
#           @@@ reference
#                       @@@ reference
    Title       = 'The Fellowship of the Ring'
    Author      = 'J.R.R. Tolkien'
    Publisher   = 'George Allen & Unwin'
    PublishDate = '1954-07-29'
    PageCount   = 423
    Tags        = @('Fantasy', 'Adventure')
}))

[BookList]::Find({
#           @@@@ reference
    param ($b)

    $b.PublishDate -gt '1950-01-01'
}).Title

[BookList]::FindAll({
#           @@@@@@@ reference
    param($b)

    $b.Author -match 'Tolkien'
}).Title

[BookList]::Remove($Book)
#           @@@@@@ reference
[BookList]::Books.Title

[BookList]::RemoveBy('Author', 'J.R.R. Tolkien')
#           @@@@@@@@ reference
"Titles: $([BookList]::Books.Title)"

[BookList]::Add($Book)
#           @@@ reference
[BookList]::Add($Book)
#           @@@ reference


# Example 3 - Class with static members
class BookList {
#     @@@@@@@@ definition
    # Static property to hold the list of books
    static [System.Collections.Generic.List[Book]] $Books
    # Static method to initialize the list of books. Called in the other
    # static methods to avoid needing to explicit initialize the value.
    static [void] Initialize()             { [BookList]::Initialize($false) }
#                 @@@@@@@@@@ definition
#                                                        @@@@@@@@@@ reference
    static [bool] Initialize([bool]$Force) {
#                 @@@@@@@@@@ definition
        if ([BookList]::Books.Count -gt 0 -and -not $Force) {
            return $false
        }

        [BookList]::Books = [System.Collections.Generic.List[Book]]::new()
#                                                                    @@@ reference

        return $true
    }
    # Ensure a book is valid for the list.
    static [void] Validate([book]$Book) {
#                 @@@@@@@@ definition
        $Prefix = @(
            'Book validation failed: Book must be defined with the Title,'
            'Author, and PublishDate properties, but'
        ) -join ' '
        if ($null -eq $Book) { throw "$Prefix was null" }
        if ([string]::IsNullOrEmpty($Book.Title)) {
#                     @@@@@@@@@@@@@ reference
            throw "$Prefix Title wasn't defined"
        }
        if ([string]::IsNullOrEmpty($Book.Author)) {
#                     @@@@@@@@@@@@@ reference
            throw "$Prefix Author wasn't defined"
        }
        if ([datetime]::MinValue -eq $Book.PublishDate) {
            throw "$Prefix PublishDate wasn't defined"
        }
    }
    # Static methods to manage the list of books.
    # Add a book if it's not already in the list.
    static [void] Add([Book]$Book) {
#                 @@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        [BookList]::Validate($Book)
#                   @@@@@@@@ reference
        if ([BookList]::Books.Contains($Book)) {
#                             @@@@@@@@ reference
            throw "Book '$Book' already in list"
        }

        $FindPredicate = {
            param([Book]$b)

            $b.Title -eq $Book.Title -and
            $b.Author -eq $Book.Author -and
            $b.PublishDate -eq $Book.PublishDate
        }.GetNewClosure()
#^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell
#^^^^^^^^ meta.block.powershell
#       ^ punctuation.section.braces.end.powershell
#        ^ punctuation.accessor.dot.powershell
#         ^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#         @@@@@@@@@@@@@ reference
#                      ^^ meta.function-call.arguments.powershell
#                      ^ punctuation.section.arguments.begin.powershell
#                       ^ punctuation.section.arguments.end.powershell
        if ([BookList]::Books.Find($FindPredicate)) {
#                             @@@@ reference
            throw "Book '$Book' already in list"
        }

        [BookList]::Books.Add($Book)
#                         @@@ reference
    }
    # Clear the list of books.
    static [void] Clear() {
#                 @@@@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        [BookList]::Books.Clear()
#                         @@@@@ reference
    }
    # Find a specific book using a filtering scriptblock.
    static [Book] Find([scriptblock]$Predicate) {
#                 @@@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        return [BookList]::Books.Find($Predicate)
#                                @@@@ reference
    }
    # Find every book matching the filtering scriptblock.
    static [Book[]] FindAll([scriptblock]$Predicate) {
#                   @@@@@@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        return [BookList]::Books.FindAll($Predicate)
#                                @@@@@@@ reference
    }
    # Remove a specific book.
    static [void] Remove([Book]$Book) {
#                 @@@@@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        [BookList]::Books.Remove($Book)
#                         @@@@@@ reference
    }
    # Remove a book by property value.
    static [void] RemoveBy([string]$Property, [string]$Value) {
#                 @@@@@@@@ definition
        [BookList]::Initialize()
#                   @@@@@@@@@@ reference
        $Index = [BookList]::Books.FindIndex({
#                                  @@@@@@@@@ reference
            param($b)
            $b.$Property -eq $Value
        }.GetNewClosure())
#^^^^^^^^^^^^^^^^^^^^^^^^^ meta.class.powershell meta.function.powershell meta.function-call.arguments.powershell
#^^^^^^^^ meta.block.powershell
#       ^ punctuation.section.braces.end.powershell
#        ^ punctuation.accessor.dot.powershell
#         ^^^^^^^^^^^^^ meta.function-call.powershell variable.function.powershell
#         @@@@@@@@@@@@@ reference
#                      ^^ meta.function-call.arguments.powershell
#                      ^ punctuation.section.arguments.begin.powershell
#                       ^ punctuation.section.arguments.end.powershell
#                        ^ punctuation.section.arguments.end.powershell
        if ($Index -ge 0) {
            [BookList]::Books.RemoveAt($Index)
#                             @@@@@@@@ reference
        }
    }
}


# Example 4 - Class definition with and without Runspace affinity

# Class definition with Runspace affinity (default behavior)
class UnsafeClass {
#     @@@@@@@@@@@ definition
    static [Object] ShowRunspaceId($Val) {
#                   @@@@@@@@@@@@@@ definition
        return [pscustomobject]@{
            ThreadId   = [Threading.Thread]::CurrentThread.ManagedThreadId
            RunspaceId = [runspace]::DefaultRunspace.Id
        }
    }
}

$unsafe = [UnsafeClass]::new()
#                        @@@ reference

while ($true) {
    1..10 | ForEach-Object -Parallel {
#           @@@@@@@@@@@@@@ reference
        Start-Sleep -ms 100
#       @@@@@@@@@@@ reference
        ($Using:unsafe)::ShowRunspaceId($_)
#                        @@@@@@@@@@@@@@ reference
    }
}

# Class definition with NoRunspaceAffinity attribute
[NoRunspaceAffinity()]
class SafeClass {
#     @@@@@@@@@ definition
    static [Object] ShowRunspaceId($Val) {
#                   @@@@@@@@@@@@@@ definition
        return [pscustomobject]@{
            ThreadId   = [Threading.Thread]::CurrentThread.ManagedThreadId
            RunspaceId = [runspace]::DefaultRunspace.Id
        }
    }
}

$safe = [SafeClass]::new()
#                    @@@ reference

while ($true) {
    1..10 | ForEach-Object -Parallel {
#           @@@@@@@@@@@@@@ reference
        Start-Sleep -ms 100
#       @@@@@@@@@@@ reference
        ($Using:safe)::ShowRunspaceId($_)
#                      @@@@@@@@@@@@@@ reference
    }
}
