
module not16 (
    input  [0:15] a,
    output [0:15] b
);

    assign b = ~a;

    // For not16, and16, or16:
    // not16: assign b = ~a;
    // and16: assign out = a & b;
    // or16:  assign out = a | b;
    // The &, |, and ~ does all of this automatically

endmodule
