param(
        [Parameter(Mandatory = $true)]
        [string]
        $Name,
        [Parameter(Mandatory = $true)]
        [int]
        $Module,
        [Parameter(Mandatory = $true)]
        [int]
        $Chapter,
        [switch]
        $Assignment
    )

Function New-CssLesson() {
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Name,
        [Parameter(Mandatory = $true)]
        [int]
        $Module,
        [Parameter(Mandatory = $true)]
        [int]
        $Chapter,
        [bool]
        $Assignment
    )

    $path = Get-CssDirectory -Path (Split-Path $PSScriptRoot -Parent) -Index $Module -Assignment $Assignment

    $path = New-Item -Name "${Chapter}. ${Name}" -ItemType Directory -Path $path
    New-Item -Name 'ChapterResources' -ItemType Directory -Path $path
    New-Item -Name 'notes.txt' -ItemType File -Path $path

    Write-Host -ForegroundColor Yellow "Requested chapter folder added to:`n `"${path}`"..."
}

Import-Module ./Get-CssDirectory
New-CssLesson -Name $Name -Chapter $Chapter -Module $Module -Assignment $Assignment
Remove-Module Get-CssDirectory
