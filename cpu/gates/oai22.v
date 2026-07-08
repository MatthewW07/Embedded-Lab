
module OAI22 (
    input wire A, B, C, D;
    output wire Y;
  );

  wire w1;
  wire w2;
  wire w3;

  or  g1(w1, A, B);
  or  g2(w2, C, D);
  and g3(w3, w1, w2);
  not g4(Y, w3);

endmodule
