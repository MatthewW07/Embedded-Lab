
// module: bit
// UNTESTED

// IMPLEMENTATION #1
module bit (
    input  clk,
    input  load,
    input  in,
    output reg out
);

    always @(posedge clk) begin
        if (load) begin
            out <= in;
        end // else 
            // out <= out;
    end

endmodule


// IMPLEMENTATION #2
/*
`include "gates/mux.v"
`include "ram/dff.v"
module bit (
    input  wire clk,
    input  wire load,
    input  wire in,
    output wire out
);

    wire data;

    mux mux_data(
        .a(out),
        .b(in),
        .sel(load),
        .out(data)
    );

    dff (
        .clk(clk),
        .in(data),
        .out(out)
    );
endmodule
*/
