
module aoi22 (
    input  a,
    input  b,
    input  c,
    input  d,
    output y
);

    wire and_ab;
    wire and_cd;
    wire or_outs;

    assign and_ab  = a & b;
    assign and_cd  = c & d;
    assign or_outs = and_ab | and_cd;
    assign y = ~or_outs;

endmodule
