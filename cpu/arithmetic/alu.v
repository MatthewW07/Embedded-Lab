

// module: alu
// UNTESTED
//
// notes: flip

/*
zx -> zero x
nx -> negate x
zy -> zero y
ny -> negate y
f  -> 1 for add(+), 0 for and(&)
no -> negate out

zr -> out = 0
ng -> out < 0
*/

`include "arithmetic/add16.v"
`include "gates/and16.v"
`include "gates/mux16.v"

module alu (
    input  [15:0] x,
    input  [15:0] y,
    input         zx,
    input         nx,
    input         zy,
    input         ny,
    input         f,
    input         no,
    output [15:0] out,
    output        zr,
    output        ng
);

    wire [15:0] tzx;
    wire [15:0] tzy;

    mux16 true_zx(.a(x), .b(16'b0), .sel(zx), .out(tzx));
    mux16 true_zy(.a(y), .b(16'b0), .sel(zy), .out(tzy));

    wire [15:0] tx;
    wire [15:0] ty;

    mux16 true_nx(.a(tzx), .b(~tzx), .sel(nx), .out(tx));
    mux16 true_ny(.a(tzy), .b(~tzy), .sel(ny), .out(ty));

    wire [15:0] out_and;
    wire [15:0] out_add;

    and16 and_gate(.a(tx), .b(ty), .out(out_and));
    add16 add_gate(.a(tx), .b(ty), .out(out_add));

    wire [15:0] pout;

    mux16 func(.a(out_and), .b(out_add), .sel(f), .out(pout));
    mux16 true_out(.a(pout), .b(~pout), .sel(no), .out(out));

    assign zr = (16'b0 == out);
    assign ng = out[15];

endmodule

/*
// ALU (Arithmetic Logic Unit):
// Computes out = one of the following functions:
//                0, 1, -1,
//                x, y, !x, !y, -x, -y,
//                x + 1, y + 1, x - 1, y - 1,
//                x + y, x - y, y - x,
//                x & y, x | y
// on the 16-bit inputs x, y,
// according to the input bits zx, nx, zy, ny, f, no.
// In addition, computes the two output bits:
// if (out == 0) zr = 1, else zr = 0
// if (out < 0)  ng = 1, else ng = 0
//
// Implementation: Manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) sets x = 0        // 16-bit constant
// if (nx == 1) sets x = !x       // bitwise not
// if (zy == 1) sets y = 0        // 16-bit constant
// if (ny == 1) sets y = !y       // bitwise not
// if (f == 1)  sets out = x + y  // integer 2's complement addition
// if (f == 0)  sets out = x & y  // bitwise and
// if (no == 1) sets out = !out   // bitwise not

CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute (out = x + y) or (out = x & y)?
        no; // negate the out output?
    OUT 
        out[16], // 16-bit output
        zr,      // if (out == 0) equals 1, else 0
        ng;      // if (out < 0)  equals 1, else 0

    PARTS:
    //// Replace this comment with your code.
}
*/