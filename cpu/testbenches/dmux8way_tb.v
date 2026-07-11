`timescale 1ns/1ps

module dmux8way_tb;

    // Inputs
    reg in;
    reg [2:0] sel;

    // Outputs
    wire a, b, c, d, e, f, g, h;

    // Instantiate the DUT
    dmux8way dut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h)
    );

    integer i;

    initial begin
        $display(" in sel | a b c d e f g h");
        $display("--------------------------------");

        // Test with input = 0
        in = 0;
        for (i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;
            $display(" %b  %03b | %b %b %b %b %b %b %b %b",
                in, sel,
                a, b, c, d, e, f, g, h
            );
        end

        // Test with input = 1
        in = 1;
        for (i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;
            $display(" %b  %03b | %b %b %b %b %b %b %b %b",
                in, sel,
                a, b, c, d, e, f, g, h
            );
        end

        $finish;
    end

endmodule
