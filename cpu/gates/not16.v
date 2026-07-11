
// TESTED

module not16 (
    input  [15:0] a,
    output [15:0] b
);

    assign b = ~a;

    // For not16, and16, or16:
    // not16: assign b = ~a;
    // and16: assign out = a & b;
    // or16:  assign out = a | b;
    // The &, |, and ~ does all of this automatically

endmodule
