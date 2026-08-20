
// Module: add16
// UNTESTED
// 
// notes: add 2 16-bit numbers, ignoring overflow

`include "arithmetic/add4.v"

module add16 (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);
    wire [14:0] c;
    full_adder(.a(a[0]),  .b(b[0]),  .cin(0),     .sum(out[0]),  .cout(c[0]));
    full_adder(.a(a[1]),  .b(b[1]),  .cin(c[0]),  .sum(out[1]),  .cout(c[1]));
    full_adder(.a(a[2]),  .b(b[2]),  .cin(c[1]),  .sum(out[2]),  .cout(c[2]));
    full_adder(.a(a[3]),  .b(b[3]),  .cin(c[2]),  .sum(out[3]),  .cout(c[3]));
    full_adder(.a(a[4]),  .b(b[4]),  .cin(c[3]),  .sum(out[4]),  .cout(c[4]));
    full_adder(.a(a[5]),  .b(b[5]),  .cin(c[4]),  .sum(out[5]),  .cout(c[5]));
    full_adder(.a(a[6]),  .b(b[6]),  .cin(c[5]),  .sum(out[6]),  .cout(c[6]));
    full_adder(.a(a[7]),  .b(b[7]),  .cin(c[6]),  .sum(out[7]),  .cout(c[7]));
    full_adder(.a(a[8]),  .b(b[8]),  .cin(c[7]),  .sum(out[8]),  .cout(c[8]));
    full_adder(.a(a[9]),  .b(b[9]),  .cin(c[8]),  .sum(out[9]),  .cout(c[9]));
    full_adder(.a(a[10]), .b(b[10]), .cin(c[9]),  .sum(out[10]), .cout(c[10]));
    full_adder(.a(a[11]), .b(b[11]), .cin(c[10]), .sum(out[11]), .cout(c[11]));
    full_adder(.a(a[12]), .b(b[12]), .cin(c[11]), .sum(out[12]), .cout(c[12]));
    full_adder(.a(a[13]), .b(b[13]), .cin(c[12]), .sum(out[13]), .cout(c[13]));
    full_adder(.a(a[14]), .b(b[14]), .cin(c[13]), .sum(out[14]), .cout(c[14]));
    
endmodule
