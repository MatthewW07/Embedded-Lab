# Command Line Workflow:

## 1. Ideal setup:
`
.\sim full_adder arithmetic
`
or
`
.\sim full_adder arithmetic -Wave
`


## 2. Old Powershell file

`
.\sim.ps1 -Module [Module] -Folder [Folder]
`

## 3. Run each command separately:
1. `iverilog -o sim/[module]_sim [folder]/[module].v testbenches/[module_tb].v`
2. `vvp sim/[module]_sim`
3. `gtkwave waveform.vcd`

# Notes:

## Goal file structure

cpu/
│
├── gates/
│
├── combinational/
│   ├── mux2.v
│   ├── mux4.v
│   ├── decoder.v
│   ├── encoder.v
│   └── priority_encoder.v
│
├── arithmetic/
│   ├── half_adder.v
│   ├── full_adder.v
│   ├── ripple_adder.v
│   ├── carry_lookahead.v
│   └── alu.v
│
├── sequential/
│   ├── dff.v
│   ├── register.v
│   ├── counter.v
│   └── register_file.v
│
├── memory/
│
├── cpu/
│
├── testbenches/
│
└── sim/

## Ideal workflow:

✓ gates

✓ half adder

✓ full adder

✓ ripple carry adder

✓ mux

✓ decoder

✓ encoder

✓ comparator

✓ shifter

✓ ALU

✓ registers

✓ register file

✓ program counter

✓ instruction decoder

✓ control unit

✓ datapath

✓ complete CPU

### For each step:

Write module

↓

Write tiny testbench

↓

Run

↓

PASS?

↓

Move on