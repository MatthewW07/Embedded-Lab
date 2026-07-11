
// ========================
// Module: mux8way16
//
// 8 way multiplexer with 16 bits
// ========================

`include "gates/mux4way16.v"
`include "gates/mux16.v"

module mux8way16 (
    input  [0:15] a,
    input  [0:15] b,
    input  [0:15] c,
    input  [0:15] d,
    input  [0:15] e,
    input  [0:15] f,
    input  [0:15] g,
    input  [0:15] h,
    output [0:3]  sel,
    output [0:15] out
);

    wire [0:15] out_abcd;
    wire [0:15] out_efgh;

    mux4way16 mux_abcd (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel[0:1]),
        .out(out_abcd)
    );

    mux4way16 mux_efgh (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .sel(sel[0:1]),
        .out(out_efgh)
    );

    mux16 mux_out (
        .a(out_abcd),
        .b(out_efgh),
        .sel(self[3]),
        .out(out)
    );

endmodule
