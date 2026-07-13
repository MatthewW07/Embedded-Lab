
// module: SR Latch
// UNTESTED
// NOTE: Both implementations will fail because Verilog does't like Combinational Cycles

// IMPLEMENTATION #1
/*
module srlatch (
    input  wire set,
    input  wire reset,
    output wire out
);
    wire or_out;
    wire n_reset;
    
    assign n_reset = ~reset;
    assign out = or_out & n_reset;
    assign or_out = set | out;

endmodule
*/


// IMPLEMENTATION #1
// `include "gates/nor.v"
module srlatch (
    input  wire set,
    input  wire reset,
    output wire out
);

    wire nor1;

    assign nor1 = ~(set | out);
    assign out = ~(reset | nor1);

endmodule
