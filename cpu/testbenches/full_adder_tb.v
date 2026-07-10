
`ifdef TEROSHDL
    `include "../arithmetic/full_adder.v"
`endif

module full_adder_tb;

  reg A, B, Cin;
  wire S, Cout;

  full_adder dut (
               .A(A),
               .B(B),
               .Cin(Cin),
               .S(S),
               .Cout(Cout)
             );

  integer i;

  initial
  begin

    $dumpfile("sim/full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    for (i=0; i<8; i=i+1)
    begin
      {A,B,Cin} = i;
      #10;
    end

    $finish;

  end

endmodule


