
// ========================
// Module: mux4way16
//
// 4 way multiplexer with 16 bits
// ========================

`include "gates/mux16.v"

module mux4way16 (
    input  [15:0] a,
    input  [15:0] b,
    input  [15:0] c,
    input  [15:0] d,
    input  [1:0]  sel,
    output        out
);

    wire [15:0] out_ab;
    wire [15:0] out_cd;

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
