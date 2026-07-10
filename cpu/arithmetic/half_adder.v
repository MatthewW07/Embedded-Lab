
//------------------------------------------------------------------------------
// Module: half_adder
//
// Computes the sum and carry of two one-bit inputs.
//
// Truth Table
// a b | carry sum
// ----+----------
// 0 0 |   0    0
// 0 1 |   0    1
// 1 0 |   0    1
// 1 1 |   1    0
//------------------------------------------------------------------------------

module half_adder (
    input  a,
    input  b,
    output sum,
    output cout
);

    assign sum = a ^ b;
    assign cout = a & b;

endmodule
