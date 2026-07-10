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

# Goal File Structure:

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