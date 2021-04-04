function Get-Prefix() {
    param(
        [Parameter(Mandatory=$true)]
        [int]
        $Number,
        [Parameter(Mandatory=$true)]
        [int]
        $MaxNumber
    )

    if ($Number -lt 1 -or $Number -gt $MaxNumber) {
        return ""
    }

    $maxDigits = [char[]]$($MaxNumber -as [string])
    $digits = [char[]]$($Number -as [string])

    $prefix = [char[]]$("0" * $maxDigits.Length)

    $i = $digits.Length - 1 
    $j = $maxDigits.Length - 1

    while ($i -ge 0) {
        $prefix[$j] = $digits[$i]

        $i--
        $j--
    }

    return -join $prefix
}

function Get-CssDirectory {
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Path,
        [Parameter(Mandatory = $true)]
        [int]
        $Index,
        [Parameter(Mandatory = $true)]
        [bool]
        $Assignment
    )

    function Get-DirIndex() {
        param (
            [Parameter(Mandatory = $true)]
            [string]
            $dir
        )
    
        $chars = $dir[0..$dir.Length]
        $i = 0
    
        $module = ""

        while ($chars[$i] -match '0') {
            $i++
        }
        
        while ($chars[$i] -match '\d') {
            $module = -join ($module, $chars[$i])
            $i++;
        }
    
        $id = $module -as [int];
    
        if ($id -lt 1) {
            return -1;
        }
    
        return $id
    }

    $dir = Get-ChildItem -Path $Path -Directory | Where-Object {$(Get-DirIndex($_.Name)) -eq $Index} | Select-Object -First 1
    $dirPath = $dir.FullName

    if ($Assignment) {
        $dirPath = Join-Path -Path $dirPath -ChildPath 'Assignments'
    }

    return $dirPath
}

Export-ModuleMember -Function Get-Prefix
Export-ModuleMember -Function Get-CssDirectory
