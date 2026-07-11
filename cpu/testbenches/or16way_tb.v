// Initial template

`timescale 1ns/1ps

module or16way_tb;

    // Inputs
    reg [0:15] a;

    // Outputs
    wire out;

    // Device Under Test
    or16way dut (
        .a(a),
        .out(out)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/or16way.vcd");
        $dumpvars(0, or16way_tb);
    `endif

        $display("");
        $display(" a | outs");
        $display("------------------");

        for(i=0; i<100; i=i+1) begin

            {a} = i;

            #1;

            $display(" %b | %b ",
                a,
                out
            );

        end

        $finish;

    end

endmodule
