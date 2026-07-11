
// TESTED

module oai22 (
    input  a,
    input  b,
    input  c,
    input  d,
    output y
);

    wire or_ab;
    wire or_cd;
    wire and_outs;

    assign or_ab = a | b;
    assign or_cd = c | d;
    assign and_outs = or_ab & or_cd;
    assign y = ~and_outs;

endmodule
