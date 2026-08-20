
// module: PC
// UNTESTED

// If reset(t-1) then out(t)=0
//     else if load(t-1) then out(t)=in(t-1)
//         else if inc(t-1) then out(t)=out(t-1)+1
//             else out(t)=out(t-1)

module pc (
    input         clk,
    input  [15:0] in,
    input         inc,
    input         load,
    input         reset,
    output reg [15:0] out
);

    always @(posedge clk) begin
        if (reset) begin
            out <= 16'b0;
        end else if (load) begin
            out <= in;
        end else if (inc) begin
            out <= out + 16'd1;
        end
    end

endmodule
