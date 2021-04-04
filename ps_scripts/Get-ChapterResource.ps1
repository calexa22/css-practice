param(
    [Parameter(Mandatory = $true)]
    [string]
    $Source,
    [Parameter(Mandatory = $true)]
    [int]
    $Module,
    [Parameter(Mandatory = $true)]
    [int]
    $Chapter,
    [switch]
    $Assignment
)

Function Get-ChapterResouse {
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Source,
        [Parameter(Mandatory = $true)]
        [int]
        $Module,
        [Parameter(Mandatory = $true)]
        [int]
        $Chapter,
        [bool]
        $Assignment
    )

    $file = Split-Path $Source -Leaf

    $moduleDir = Get-CssDirectory -Path $(Split-Path $PSScriptRoot -Parent) -Index $Module -Assignment $Assignment
    $chapterDir = Get-CssDirectory -Path $moduleDir -Index $Chapter -Assignment $False
    $resources = Join-Path -Path $chapterDir -ChildPath 'ChapterResources'
    $destination = Join-Path -Path $resources -ChildPath $($file.Substring(0, $file.IndexOf('.')))

    Expand-Archive -Path $Source -DestinationPath $destination -ErrorAction Ignore

    Remove-Item $(Join-Path -Path $destination -ChildPath '__MACOSX') -Recurse

    "Resource => $(Split-Path $destination -Leaf)`n" | Out-File -FilePath $(Join-Path -Path $chapterDir -ChildPath 'notes.txt')

    Write-Host -ForegroundColor Yellow 'Resource archive expanded successfully...'
}

Import-Module ./Get-CssDirectory
Get-ChapterResouse -Source $Source -Module $Module -Chapter $Chapter -Assignment $Assignment
Remove-Module Get-CssDirectory
