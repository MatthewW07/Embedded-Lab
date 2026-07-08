# Command Line Workflow:

## 0. Run the Powershell file:

`
.\sim.ps1 -Module [Module] -Folder [Folder]
`

## 1. Compile the design and testbench into a simulation network file
`
iverilog -o sim/[module]_sim [folder]/[module].v testbenches/[module_tb].v
`

## 2. Run the simulation engine to generate the .vcd file
`
vvp sim/[module]_sim
`

## 3. Open the waveform visually
`
gtkwave waveform.vcd
`

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