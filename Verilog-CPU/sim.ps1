param(
    [Parameter(Mandatory=$true)]
    [string]$Module,

    [Parameter(Mandatory=$true)]
    [string]$Folder,

    [switch]$Wave
)

$exe = "sim/$Module.out"
$vcd = "sim/$Module.vcd"

Write-Host ""
Write-Host "Compiling $Module..."

iverilog `
    -g2012 `
    -o $exe `
    "$Folder/$Module.v" `
    "testbenches/${Module}_tb.v"

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Compilation failed."
    exit
}

Write-Host ""
Write-Host "Running simulation..."
vvp $exe

if ($Wave) {
    Write-Host ""
    Write-Host "Opening GTKWave..."
    gtkwave $vcd
}
