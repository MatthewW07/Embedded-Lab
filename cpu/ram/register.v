
// module: register
// UNTESTED

module register (
    input         clk,
    input  [15:0] in,
    input         load,
    output [15:0] out
);

    always @(posedge clk) begin
        if (load) begin
            out <= in;
        end
    end

endmodule
