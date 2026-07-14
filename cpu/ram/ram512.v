
// module: 512-word RAM
// UNTESTED

// IMPLEMENTATION #1
/*
`include "ram/ram64.v"
module ram512 (
    input         clk,
    input  [15:0] in,
    input  [8:0]  address,
    input         load,
    output [15:0] out
);

    wire l0,l1,l2,l3,l4,l5,l6,l7;
    wire [15:0] r0,r1,r2,r3,r4,r5,r6,r7;

    dmux8way load_decoder(
        .in(load),
        .sel(address[8:6]),
        .a(l0), .b(l1), .c(l2), .d(l3),
        .e(l4), .f(l5), .g(l6), .h(l7)
    );

    ram64 ram0(.clk(clk), .in(in), .address(address[5:0]), .load(l0), .out(r0));
    ram64 ram1(.clk(clk), .in(in), .address(address[5:0]), .load(l1), .out(r1));
    ram64 ram2(.clk(clk), .in(in), .address(address[5:0]), .load(l2), .out(r2));
    ram64 ram3(.clk(clk), .in(in), .address(address[5:0]), .load(l3), .out(r3));
    ram64 ram4(.clk(clk), .in(in), .address(address[5:0]), .load(l4), .out(r4));
    ram64 ram5(.clk(clk), .in(in), .address(address[5:0]), .load(l5), .out(r5));
    ram64 ram6(.clk(clk), .in(in), .address(address[5:0]), .load(l6), .out(r6));
    ram64 ram7(.clk(clk), .in(in), .address(address[5:0]), .load(l7), .out(r7));

    mux8way16 output_mux(
        .a(r0), .b(r1), .c(r2), .d(r3),
        .e(r4), .f(r5), .g(r6), .h(r7),
        .sel(address[8:6]),
        .out(out)
    );

endmodule
*/

module ram512 (
    input clk,
    input [15:0] in,
    input [8:0] address,
    input load,
    output reg [15:0] out
);

    reg [15:0] memory [0:511];

    always @(posedge clk) begin
        if (load)
            memory[address] <= in;

        out <= memory[address];
    end

endmodule
