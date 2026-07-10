
`ifdef TEROSHDL
    `include "half_adder.v"
`endif

module full_adder (
        input  a,
        input  b,
        input  cin,
        output sum,
        output cout
    );

    wire partial_sum;
    wire carry1;
    wire carry2;

    // Implementation with half adders
    half_adder ha1(
        .a(a),
        .b(b),
        .sum(partial_sum),
        .cout(carry1)
    );

    half_adder ha2(
        .a(partial_sum),
        .b(cin),
        .sum(sum),
        .cout(carry2)
    );

    assign cout = carry1 | carry2

    // Implementation without half adders

    // assign partial_sum = a ^ b;
    // assign sum = partial_sum ^ cin;
    // assign carry1 = partial_sum & cin;
    // assign carry2 = a & b;
    // assign cout   = carry1 | carry 2;

endmodule
