// Initial template

`timescale 1ns/1ps

module not16_tb;

    // Inputs
    reg [15:0] a;

    // Outputs
    wire [15:0] out;

    // Device Under Test
    not16 dut (
        .a(a),
        .out(out)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/dmux.vcd");
        $dumpvars(0, dmux_tb);
    `endif

        $display("");
        $display(" a | out");
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
