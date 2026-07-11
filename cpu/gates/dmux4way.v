
// ========================
// Module: dmux4way
//
// 4 way demuxiplexor with 1 bit
// ========================

module dmux4way (
    input       in,
    input [0:1] sel,
    output      a,
    output      b,
    output      c,
    output      d
);

    assign a = in & (~sel[0] & ~sel[1]);
    assign b = in & (sel[0]  & ~sel[1]);
    assign c = in & (~sel[0] & sel[1]);
    assign d = in & (sel[0]  & sel[1]);

endmodule


// NIKA NEEDS:
// 1. cover up shift
// 2. reschedule return flight
// 3. register as CCA

// I NEED:
// 1. register as CCA
