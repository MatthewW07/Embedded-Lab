// Initial template

`timescale 1ns/1ps

module full_adder_tb;

    // Inputs
    reg a;
    reg b;
    reg cin;

    // Outputs
    wire sum;
    wire cout;

    // Device Under Test
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/full_adder.vcd");
        $dumpvars(0, full_adder_tb);
    `endif

        $display("");
        $display(" a b cin | s cout");
        $display("------------------");

        for(i=0; i<8; i=i+1) begin

            {a,b,cin} = i;

            #1;

            $display(" %b %b  %b  | %b%b",
                cin,a,b,
                cout,s
            );

        end

        $finish;

    end

endmodule
