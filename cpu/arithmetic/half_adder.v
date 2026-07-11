
// ========================
// Module: half_adder
//
// Computes the sum and carry of two one-bit inputs.
// ========================

module half_adder (
    input  a,
    input  b,
    output sum,
    output cout
);

    assign sum = a ^ b;
    assign cout = a & b;

endmodule
