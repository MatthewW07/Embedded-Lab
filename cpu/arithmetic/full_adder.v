
`ifdef TEROSHDL
    `include "half_adder.v"
`endif

module full_adder (
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

    // Determine S
    wire w1;
    xor xor1(w1, A, B);
    xor xor2(S, w1, Cin);

    // Determine Cout
    wire w2;
    wire w3;
    and and1(w2, w1, Cin);
    and and2(w3, A, B);
    or  or1(Cout, w2, w3);
    
endmodule
