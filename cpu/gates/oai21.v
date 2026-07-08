
module OAI21 (
    input wire A, B, C,
    output wire Y
  );

  wire w1;
  wire w2;

  or  g1(w1, A, B);
  and g2(w2, w1, C);
  not g3(Y, w2);

endmodule
