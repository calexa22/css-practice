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

Export-ModuleMember -Function Get-CssDirectory
