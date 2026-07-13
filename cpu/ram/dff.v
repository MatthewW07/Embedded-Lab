
// module: dff
// UNTESTED

// IMPLEMENTATION #1
module dff (
    input  clk
    input  in,
    output reg out
);

    always @(posedge clk) begin
        out <= in;
    end

endmodule


// IMPLEMENTATION #2
`include "ram/dlatch.v"
module dff (
    input  wire clk,
    input  wire in,
    output wire out
);

    wire nclk;
    wire q1;

    assign nclk = ~clk;

    dlatch d1(
        .data(in),
        .store(nclk),
        .out(q1)
    );

    dlatch d2(
        .data(q1),
        .store(clk),
        .out(out)
    );

endmodule

