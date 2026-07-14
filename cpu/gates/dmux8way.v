
// ========================
// Module: dmux8way
// TESTED
//
// 8 way demuxiplexor with 1 bit
// ========================

module dmux8way (
    input       in,
    input [2:0] sel,
    output      a,
    output      b,
    output      c,
    output      d,
    output      e,
    output      f,
    output      g,
    output      h
);

    assign a = in & (~sel[2] & ~sel[1] & ~sel[0]);
    assign b = in & (~sel[2] & ~sel[1] &  sel[0]);
    assign c = in & (~sel[2] &  sel[1] & ~sel[0]);
    assign d = in & (~sel[2] &  sel[1] &  sel[0]);
    assign e = in & ( sel[2] & ~sel[1] & ~sel[0]);
    assign f = in & ( sel[2] & ~sel[1] &  sel[0]);
    assign g = in & ( sel[2] &  sel[1] & ~sel[0]);
    assign h = in & ( sel[2] &  sel[1] &  sel[0]);

endmodule
