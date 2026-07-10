// Initial template

`timescale 1ns/1ps

module oai22_tb;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // Outputs
    wire y;

    // Device Under Test
    oai22 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/oai22.vcd");
        $dumpvars(0, oai22_tb);
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
