
param(
    [Parameter(Mandatory=$true)]
    [string]$Module,

    [Parameter(Mandatory=$true)]
    [string]$Folder
)

iverilog -o sim/$MODULE`_sim.exe $FOLDER/$MODULE.v testbenches/$MODULE`_tb.v

vvp sim/$MODULE`_sim.exe

gtkwave sim/$MODULE.vcd
