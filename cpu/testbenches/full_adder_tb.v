// Initial template

`timescale 1ns/1ps

module full_adder_tb;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire S;
    wire Cout;

    // Device Under Test
    full_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    integer i;

    initial begin

`ifdef WAVES
        $dumpfile("sim/full_adder.vcd");
        $dumpvars(0, full_adder_tb);
`endif

        $display("");
        $display(" A B Cin | S Cout");
        $display("------------------");

        for(i=0; i<8; i=i+1) begin

            {A,B,Cin} = i;

            #1;

            $display(" %b %b  %b  | %b%b",
              Cin,A,B,
              Cout,S);

        end

        $finish;

    end

endmodule
