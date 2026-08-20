// Initial template

`timescale 1ns/1ps

module dmux_tb;

    // Inputs
    reg in;
    reg sel;

    // Outputs
    wire a;
    wire b;

    // Device Under Test
    dmux dut (
        .in(in),
        .sel(sel),
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
        $display(" in sel | a b ");
        $display("------------------");

        for(i=0; i<4; i=i+1) begin

            {in,sel} = i;

            #1;

            $display(" %b  %b   | %b %b",
                in,sel,
                a, b
            );

        end

        $finish;

    end

endmodule
