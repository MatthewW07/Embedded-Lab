`timescale 1ns/1ps

module and_gate_tb;

    reg t_a;
    reg t_b;
    wire t_y;

    and_gate uut (
        .a(t_a),
        .b(t_b),
        .y(t_y)
    );

    initial begin

        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        $monitor("Time=%0t | Input A=%b B=%b | Output Y=%b", $time, t_a, t_b, t_y);

        t_a=0; t_b=0; #5;
        t_a=0; t_b=1; #5;
        t_a=1; t_b=0; #5;
        t_a=1; t_b=1; #5;

        $finish;
    end
endmodule

