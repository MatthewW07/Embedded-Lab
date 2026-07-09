
module half_adder_tb;

  reg A, B;
  wire S, C;

  half_adder dut (
               .A(A),
               .B(B),
               .S(S),
               .C(C)
             );

  integer i;

  initial
  begin

    $dumpfile("sim/half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    for (i=0; i<4; i=i+1)
    begin
      {A,B} = i;
      #10;
      $display("A=%b B=%b S=%b C=%b", A, B, S, C);
    end

    $finish;

  end

endmodule


