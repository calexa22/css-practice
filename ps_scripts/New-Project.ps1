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

    #mimic C-style integer division
    $prefix = if ([int][Math]::Floor($index / 10) -eq 1) { "1$($index % 10)" } else { "0${index}"}
    
    $path = New-Item -Name "${prefix}_${module}" -ItemType Directory -Path (Split-Path $PSScriptRoot -Parent)
    New-Item -Name 'Assignments' -ItemType Directory -Path $path
    New-Item -Name 'notes.txt' -ItemType File -Path $path
    New-Item -Name 'test.css' -ItemType File -Path $path
}

Write-Host -ForegroundColor Yellow "Project created successfully..."
