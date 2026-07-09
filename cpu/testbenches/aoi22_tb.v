
module aoi22_tb;

  reg A, B, C, D;
  wire Y;

  AOI22 dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
      );

  integer i;

  initial
  begin

    $dumpfile("sim/aoi22.vcd");
    $dumpvars(0, aoi22_tb);

    for (i=0; i < 16; i = i + 1)
    begin
      {A,B,C,D} = i;
      #10;
      $display("A=%b B=%b C=%b D=%b Y=%b", A, B, C, D, Y);
    end

    $finish;

  end

endmodule
