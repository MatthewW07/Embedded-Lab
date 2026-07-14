
// module: 8-bit RAM
// UNTESTED

// IMPLEMENTATION #1
/*
module ram8 (
    input        clk,
    input  [7:0] in,
    input  [2:0] address,
    input        load,
    output reg [7:0] out
);

    // Ignoring register.v
    reg [15:0] ram [7:0];

    always @(posedge clk) begin
        if (load) begin
            ram[address] <= in;
        end

        out <= ram[address]
    end

endmodule
*/


// IMPLEMENTATION #2
`include "ram/register.v"
`include "gates/dmux8way.v"
`include "gates/mux8way16.v"
module ram8 (
    input         clk,
    input  [15:0] in,
    input  [2:0]  address,
    input         load,
    output [15:0] out,
);

    wire l0, l1, l2, l3, l4, l5, l6, l7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    dmux8way load_decoder(
        .in(load),
        .sel(address),
        .a(l0), .b(l1), .c(l2), .d(l3),
        .e(l4), .f(l5), .g(l6), .h(l7)
    );

    register reg0(.clk(clk), .in(in), .load(l0), .out(r0));
    register reg1(.clk(clk), .in(in), .load(l1), .out(r1));
    register reg2(.clk(clk), .in(in), .load(l2), .out(r2));
    register reg3(.clk(clk), .in(in), .load(l3), .out(r3));
    register reg4(.clk(clk), .in(in), .load(l4), .out(r4));
    register reg5(.clk(clk), .in(in), .load(l5), .out(r5));
    register reg6(.clk(clk), .in(in), .load(l6), .out(r6));
    register reg7(.clk(clk), .in(in), .load(l7), .out(r7));

    mux8way16 output_mux(
        .a(r0), .b(r1), .c(r2), .d(r3),
        .e(r4), .f(r5), .g(r6), .h(r7),
        .sel(address),
        .out(out)
    );

endmodule
