
// ========================
// Module: mux8way16
// UNTESTED
//
// 8 way multiplexer with 16 bits
// ========================

`include "gates/mux4way16.v"
`include "gates/mux16.v"

module mux8way16 (
    input  [15:0] a,
    input  [15:0] b,
    input  [15:0] c,
    input  [15:0] d,
    input  [15:0] e,
    input  [15:0] f,
    input  [15:0] g,
    input  [15:0] h,
    output [2:0]  sel,
    output [15:0] out
);

    wire [15:0] out_abcd;
    wire [15:0] out_efgh;

    mux4way16 mux_abcd (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel[1:0]),
        .out(out_abcd)
    );

    mux4way16 mux_efgh (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .sel(sel[1:0]),
        .out(out_efgh)
    );

    mux16 mux_out (
        .a(out_abcd),
        .b(out_efgh),
        .sel(self[2]),
        .out(out)
    );

endmodule
