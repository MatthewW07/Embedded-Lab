
module AOI22 (
    input wire A, B, C, D,
    output wire Y
  );

  wire w1;
  wire w2;
  wire w3;

  and g1(w1, A, B);
  and g2(w2, C, D);
  or  g3(w3, w1, w2);
  not g4(Y, w3);

endmodule
