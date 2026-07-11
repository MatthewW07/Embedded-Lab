// Initial template

`timescale 1ns/1ps

module not16_tb;

    // Inputs
    reg [0:15] a;

    // Outputs
    wire [0:15] b;

    // Device Under Test
    not16 dut (
        .a(a),
        .b(b)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/dmux.vcd");
        $dumpvars(0, dmux_tb);
    `endif

        $display("");
        $display(" a | b");
        $display("------------------");

        for(i=0; i<100; i=i+1) begin

            {a} = i;

            #1;

            $display(" %b | %b ",
                a,
                b
            );

        end

        $finish;

    end

endmodule
