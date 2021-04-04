Import-Module ./Get-ProjectHelpers

[string[]] $cssModules =
    'GettingStarted',
    'DivingIntoTheBasicsOfCss',
    'DivingDeeperIntoCss',
    'MoreOnSelectorsAndCssFeatures',
    'PracticingTheBasics',
    'PositioningElementsInCss',
    'UnderstandingBackgroundImagesAndImages',
    'SizesAndUnits',
    'WorkingWithJavascriptAndCss',
    'MakingOurWebsiteResponsive',
    'AddingAndStylingForms',
    'WorkingWithTextAndFonts',
    'AddingFlexBoxToOurProject',
    'UsingTheCssGrid',
    'TransformingElementsWithCssTransforms',
    'TransitionsAndAnimationsInCss',
    'WritingFuture-ProofCssCode',
    'IntroducingSass'

for ($i = 0; $i -lt $cssModules.Length; $i++) {
    $module = $cssModules[$i];
    $index = $i + 1;

    $prefix = Get-Prefix -Number $index -MaxNumber $cssModules.Length
    
    $path = New-Item -Name "${prefix}_${module}" -ItemType Directory -Path (Split-Path $PSScriptRoot -Parent)
    New-Item -Name 'Assignments' -ItemType Directory -Path $path
    New-Item -Name 'notes.txt' -ItemType File -Path $path
    New-Item -Name 'test.css' -ItemType File -Path $path
}

Write-Host -ForegroundColor Yellow "Project created successfully..."

Remove-Module Get-ProjectHelpers
