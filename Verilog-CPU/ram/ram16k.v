
// module: 16k-word RAM (16-bit)
// UNTESTED

module ram16k (
    input clk
    input [15:0] in,
    input [13:0] address,
    input load,
    output [15:0] out
);

    res [15:0] ram [0:16387];

    always @(posedge clk) begin
        if (load) begin
            memory[address] <= in;
        end

        out <= memory[address];
    end

endmodule
