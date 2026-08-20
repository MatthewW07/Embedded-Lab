
# My Embedded Lab Repository

I like the idea of having an area in my future living space dedicated towards electronics and computers. I imagine being able to come home every day to a 3-monitor setup with a Jarvis AI system setup and a bunch of cool electronics projects scattered across my desk; that would be cool. Anyways, here's my repository where I try to learn embedded systems, electronics, and low-level hardware through some projects.

<hr style="border: none; border-top: 10px double #333; color: #333; overflow: visible; text-align: center; height: 5px;">

## Verilog CPU

It would be great if I could understand the basics as to how a CPU works by simulating my own system. I'm not sure how far I'll be able to get in this project with only Verilog, though. Ideally, I'd be able to simulate a very small CPU and run my own program on it -- assuming a small simulated computer would fit in my real computer's RAM.

**Terminal Commands**

Just for my own sake, these are the commands that I need to know to use Icarus Verilog:

1. Example for compiling + running a file: `.\sim full_adder arthmetic` or `.\sim full_adder arithmetic -Wave`
2. Using the custom Powershell script: `.\sim.ps1 -Module [Module] -Folder [Folder]`
3. Each command separately: 
    - `iverilog -o sim/[module]_sim [folder]/[module].v testbenches/[module_tb].v`
    - `vvp sim/[module]_sim`
    - `gtkwave waveform.vcd`

**Goal File Structure**

Again, if I can stay consistent in working on this project, this note will help me. Here is my ideal file structure:

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

