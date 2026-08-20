
// module: 64-word RAM
// UNTESTED


`include "ram/ram8.v"
module ram64 (
    input         clk,
    input  [15:0] in,
    input  [5:0]  address,
    input         load,
    output [15:0] out
);

    wire l0,l1,l2,l3,l4,l5,l6,l7;
    wire [15:0] r0,r1,r2,r3,r4,r5,r6,r7;

    dmux8way load_decoder(
        .in(load),
        .sel(address[5:3]),
        .a(l0), .b(l1), .c(l2), .d(l3),
        .e(l4), .f(l5), .g(l6), .h(l7)
    );

    ram8 ram0(.clk(clk), .in(in), .address(address[2:0]), .load(l0), .out(r0));
    ram8 ram1(.clk(clk), .in(in), .address(address[2:0]), .load(l1), .out(r1));
    ram8 ram2(.clk(clk), .in(in), .address(address[2:0]), .load(l2), .out(r2));
    ram8 ram3(.clk(clk), .in(in), .address(address[2:0]), .load(l3), .out(r3));
    ram8 ram4(.clk(clk), .in(in), .address(address[2:0]), .load(l4), .out(r4));
    ram8 ram5(.clk(clk), .in(in), .address(address[2:0]), .load(l5), .out(r5));
    ram8 ram6(.clk(clk), .in(in), .address(address[2:0]), .load(l6), .out(r6));
    ram8 ram7(.clk(clk), .in(in), .address(address[2:0]), .load(l7), .out(r7));

    mux8way16 output_mux(
        .a(r0), .b(r1), .c(r2), .d(r3),
        .e(r4), .f(r5), .g(r6), .h(r7),
        .sel(address[5:3]),
        .out(out)
    );

endmodule
