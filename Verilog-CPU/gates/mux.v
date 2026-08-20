
// ========================
// Module: mux
// NOT TESTED
//
// if sel=0, then out=a; else out=b.
// ========================

module mux (
    input  a,
    input  b,
    input  sel,
    output out
);
    // Equation: Y = (A AND ~S) OR (B AND S)
    assign out = (a & ~sel) | (b & sel);

    // Longer implementation
    // wire and_as;
    // wire and_bs;

    // assign and_as = a & (~sel);
    // assign and_bs = a & sel;
    // assign out = and_as | and_bs;
endmodule