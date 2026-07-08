
module oai_tb;

  reg A, B, C;
  wire Y;

  OAI21 dut (
          .A(A),
          .B(B),
          .C(C),
          .Y(Y)
        );

  integer i;

  initial
  begin

    $dumpfile("sim/oai21.vcd");
    $dumpvars(0, oai_tb);

    for (i=0; i < 8; i=i+1)
    begin
      {A, B, C} = i;
      #10;
      $display("A=%b B=%b C=%b Y=%b", A, B, C, Y);
    end

    $finish;

  end

endmodule
