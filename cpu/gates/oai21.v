
module oai21 (
    input  a,
    input  b,
    input  c,
    output y
);

    wire or_ab;
    wire and_out;

    assign or_ab   = a | b;
    assign and_out = or_ab & c;
    assign y       = ~and_out;

    // Or:
    // assign y = ~((a | b) & c)

endmodule
