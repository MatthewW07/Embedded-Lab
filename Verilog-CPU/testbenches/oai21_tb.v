// Initial template

`timescale 1ns/1ps

module oai21_tb;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire y;

    // Device Under Test
    oai21 dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    integer i;

    initial begin

    `ifdef WAVES
        $dumpfile("sim/oai21.vcd");
        $dumpvars(0, oai21_tb);
    `endif

        $display("");
        $display(" a b c | y ");
        $display("------------------");

        for(i=0; i<8; i=i+1) begin

            {a,b,c} = i;

            #1;

            $display(" %b %b  %b  | %b",
                a,b,c,
                y
            );

        end

        $finish;

    end

endmodule
