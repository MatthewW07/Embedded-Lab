# Command Line Workflow:

## 1. Compile the design and testbench into a simulation network file
`
iverilog -o sim.vvp design.v design_tb.v
`

## 2. Run the simulation engine to generate the .vcd file
`
vvp sim.vvp
`

## 3. Open the waveform visually
`
gtkwave simulation.vcd
`