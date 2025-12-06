# SYNTAX TEST "Packages/PowerShell/PowerShell.sublime-syntax"
using namespace system.management.automation
#^^^^ keyword.control.import.powershell
#     ^^^^^^^^^ keyword.control.import.powershell
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.path.powershell
#                     ^ punctuation.accessor.dot.powershell
#                                ^ punctuation.accessor.dot.powershell

# Define a class
class TypeName
# <- storage.type
#     ^^^^^^^^ entity.name.class
#     @@@@@@@@ definition
{
    # Property with validate set
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    [ValidateSet("val1", "Val2")]
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute
    # <- punctuation.section.brackets.begin
    # ^^^^^^^^^^ support.function.attribute
    #           ^ punctuation.section.group.begin
    #            ^^^^^^ string.quoted.double
    #                  ^ punctuation.separator
    #                    ^^^^^^ string.quoted.double
    #                          ^ punctuation.section.group.end
    #                           ^ punctuation.section.brackets.end
    [string] $P1
    # <- punctuation.section.brackets.begin
    # ^^^^^ storage.type
    #      ^ punctuation.section.brackets.end
    #        ^ punctuation.definition.variable
    #         ^^ variable.other.readwrite

    # Static property
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^ comment.line
    static [hashtable] $P2
    #^^^^^ storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^^^^^^^^^ storage.type
    #                ^ punctuation.section.brackets.end
    #                  ^ punctuation.definition.variable
    #                   ^^ variable.other.readwrite

    # Hidden property does not show as result of Get-Member
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
    hidden [int] $P3
    #^^^^^ storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^ storage.type
    #          ^ punctuation.section.brackets.end
    #            ^ punctuation.definition.variable
    #             ^^ variable.other.readwrite

    # Constructor
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^ comment.line
    TypeName ([string] $s) {
        #    ^ punctuation.section.group.begin
        #     ^ punctuation.section.brackets.begin
        #      ^^^^^^ storage.type
        #            ^ punctuation.section.brackets.end
        #              ^ punctuation.definition.variable
        #               ^ variable.other.readwrite
        #                ^ punctuation.section.group.end
        $this.P1 = $s
        # <- punctuation.definition.variable
        # ^ variable.language
        #     ^^ variable.other.member
        #        ^ keyword.operator.assignment
        #          ^ punctuation.definition.variable
        #           ^ variable.other.readwrite
    }

    # Static method
    # <- punctuation.definition.comment
    # ^^^^^^^^^^^^^ comment.line
    static [void] MemberMethod1([hashtable] $h) {
    # <- storage.modifier
    #      ^ punctuation.section.brackets.begin
    #       ^^^^ storage.type
    #           ^ punctuation.section.brackets.end
    #             ^^^^^^^^^^^^^ entity.name.function
    #             @@@@@@@@@@@@@ definition
    #                          ^ punctuation.section.group.begin
    #                           ^ punctuation.section.brackets.begin
    #                            ^^^^^^^^^ storage.type
    #                                     ^ punctuation.section.brackets.end
    #                                       ^ punctuation.definition.variable
    #                                        ^ variable.other.readwrite
    #                                         ^ punctuation.section.group.end
        [TypeName]::P2 = $h
#^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell meta.block.powershell
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
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.powershell
#^^^^^^^^^^^^^^^^^^^^^^ meta.function.powershell
#   ^ punctuation.section.brackets.begin.powershell
#    ^^^ storage.type.powershell
#       ^ punctuation.section.brackets.end.powershell
#         ^^^^^^^^^^^^^ entity.name.function.powershell
#         @@@@@@@@@@@@@ definition
#                      ^^^^^^^^^^ meta.group.powershell
#                      ^ punctuation.section.group.begin.powershell
#                       ^ punctuation.section.brackets.begin.powershell
#                        ^^^ storage.type.powershell
#                           ^ punctuation.section.brackets.end.powershell
#                             ^^ variable.other.readwrite.powershell
#                             ^ punctuation.definition.variable.powershell
#                               ^ punctuation.section.group.end.powershell
#                                 ^ meta.block.powershell punctuation.section.braces.begin.powershell
        return $this.P3
        # <- keyword.control
        #      ^ punctuation.definition.variable
        #       ^^^^ variable.language
        #            ^^ variable.other.member
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
#                  @@@@ reference
    # Convenience constructor from hashtable
    Book([hashtable]$Properties) { $this.Init($Properties) }
#                                        @@@@ reference
    # Common constructor for title and author
    Book([string]$Title, [string]$Author) {
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
