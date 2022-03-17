param (
    [Parameter(Mandatory)]
    $Test
)

function f1 {
    $global:test = 5
    1..50 | ForEach-Object {
        f2
        get-date
        dir d:\
    }
}

function f2 {
    $global:test++
    Write-Host 'In F2'
}

$global:test = 50
Write-Host Start
f1
Write-Host End