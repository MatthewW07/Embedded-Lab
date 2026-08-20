
// module: Data Latch
// UNTESTED

// IMPLEMENTATION #1
/*
`include "ram/srlatch.v"
module dlatch (
    input  wire in,
    input  wire load,
    output wire out
);

    wire set;
    wire reset;

    assign set = in & load;
    assign reset = ~in & load;

    srlatch main(
        .set(set),
        .reset(reset),
        .out(out)
    );

endmodule
*/

module dlatch (
    input  wire in,
    input  wire load,
    output reg  out
);

    always @(*) begin
        if (load) begin 
            out = in;
        end
    end

endmodule
