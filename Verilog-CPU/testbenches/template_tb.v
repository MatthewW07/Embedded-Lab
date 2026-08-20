// Initial template

`timescale 1ns/1ps

module MODULE_tb;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire S;
    wire Cout;

    // Device Under Test
    MODULE dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    integer i;

    initial begin

`ifdef WAVES
        $dumpfile("sim/MODULE.vcd");
        $dumpvars(0, MODULE_tb);
`endif

        $display("");
        $display(" A B Cin | S Cout");
        $display("------------------");

        for(i=0; i<8; i=i+1) begin

            {A,B,Cin} = i;

            #1;

            $display(" %b %b  %b  | %b   %b",
                     A,B,Cin,S,Cout);

        end

        $finish;

    end

endmodule


// Clock template
`timescale 1ns/1ps

module register_tb;

reg clk;
reg reset;
reg enable;
reg [7:0] D;

wire [7:0] Q;

register dut(...);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    enable = 0;
    D = 0;

    #10;

    reset = 0;

    enable = 1;
    D = 8'h55;

    #10;

    D = 8'hAA;

    #10;

    $finish;

end

endmodule