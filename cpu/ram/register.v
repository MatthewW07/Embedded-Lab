
// module: register
// UNTESTED

// IMPLEMENTATION #1
module register (
    input         clk,
    input  [15:0] in,
    input         load,
    output [15:0] out
);

    always @(posedge clk) begin
        if (load) begin
            out <= in;
        end
    end

endmodule


// IMPLEMENTATION #2
/*
`include "ram/bit.v"
module register (
    input         clk,
    input  [15:0] in,
    input         load,
    output [15:0] out
);

    bit  r0(.clk(clk), .load(load), .in(in[0]),  .out(out[0]));
    bit  r1(.clk(clk), .load(load), .in(in[1]),  .out(out[1]));
    bit  r2(.clk(clk), .load(load), .in(in[2]),  .out(out[2]));
    bit  r3(.clk(clk), .load(load), .in(in[3]),  .out(out[3]));
    bit  r4(.clk(clk), .load(load), .in(in[4]),  .out(out[4]));
    bit  r5(.clk(clk), .load(load), .in(in[5]),  .out(out[5]));
    bit  r6(.clk(clk), .load(load), .in(in[6]),  .out(out[6]));
    bit  r7(.clk(clk), .load(load), .in(in[7]),  .out(out[7]));
    bit  r8(.clk(clk), .load(load), .in(in[8]),  .out(out[8]));
    bit  r9(.clk(clk), .load(load), .in(in[9]),  .out(out[9]));
    bit r10(.clk(clk), .load(load), .in(in[10]), .out(out[10]));
    bit r11(.clk(clk), .load(load), .in(in[11]), .out(out[11]));
    bit r12(.clk(clk), .load(load), .in(in[12]), .out(out[12]));
    bit r13(.clk(clk), .load(load), .in(in[13]), .out(out[13]));
    bit r14(.clk(clk), .load(load), .in(in[14]), .out(out[14]));
    bit r15(.clk(clk), .load(load), .in(in[15]), .out(out[15]));

endmodule
*/