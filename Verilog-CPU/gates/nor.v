
// module: NOR Gate
// UNTESTED

module nor (
    input  wire a,
    input  wire b,
    output wire out
);
    assign out = ~(a | b); 
endmodule
