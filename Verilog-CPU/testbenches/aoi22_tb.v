// Initial template

`timescale 1ns/1ps

module aoi22_tb;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // Outputs
    wire y;

    // Device Under Test
    aoi22 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/aoi22.vcd");
        $dumpvars(0, aoi22_tb);
    `endif

        $display("");
        $display(" a b c d | y ");
        $display("------------------");

        for(i=0; i<16; i=i+1) begin

            {a,b,c,d} = i;

            #1;

            $display(" %b %b %b %b | %b",
                a,b,c,d,
                y
            );

        end

        $finish;

    end

endmodule
