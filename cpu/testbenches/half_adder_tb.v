// Initial template

`timescale 1ns/1ps

module half_adder_tb;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire sum;
    wire cout;

    // Device Under Test
    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/half_adder.vcd");
        $dumpvars(0, half_adder_tb);
    `endif

        $display("");
        $display("a b | sum cout");
        $display("------------------");

        for(i=0; i<4; i=i+1) begin

            {a,b} = i;

            #1;

            $display("%b %b | %b %b",
              a,b,
              cout,sum);

        end

        $finish;

    end

endmodule
