
// ========================
// Module: mux4way16
//
// 4 way multiplexer with 16 bits
// ========================

`include "gates/mux16.v"

module mux4way16 (
    input  [0:15] a,
    input  [0:15] b,
    input  [0:15] c,
    input  [0:15] d,
    input  [0:1]  sel,
    output        out
);

    wire [0:15] out_ab;
    wire [0:15] out_cd;

    mux16 mux_ab (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .out(out_ab)
    );

    mux16 mux_cd (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .out(out_cd)
    );

    mux16 mux_out (
        .a(out_ab),
        .b(out_cd),
        .sel(sel[1]),
        .out(out)
    );

endmodule
