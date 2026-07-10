
module half_adder (
    input A,
    input B,
    output S,
    output C
);

    // Determine S
    assign S = A ^ B;

    // Determine C
    assign C = A & B;

endmodule
