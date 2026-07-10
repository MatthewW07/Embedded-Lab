// Initial template

`ifdef TEROSHDL
    `include "adder_4bit.v"
`endif

`timescale 1ns/1ps

module adder_4bit_tb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg       cin;

    // Outputs
    wire [3:0] sum;
    wire       cout;

    // Device Under Test
    adder_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    integer i;
    integer errors;
    reg [0:4] expected;

    initial begin
        errors = 0;

        `ifdef WAVES
            $dumpfile("sim/adder_4bit.vcd");
            $dumpvars(0, adder_4bit_tb);
        `endif

        $display("");
        $display(" Ripple Carry ");
        $display(" a    b    cin | sum  cout");
        $display("---------------------------");

        for(i=0; i<512; i=i+1) begin
            {a,b,cin} = i;
            #1;
            expected = a + b + cin;
            // $display(" %b %b %b   | %b %b",
            //     a,b,cin,
            //     sum,cout
            // );
            if ({cout, sum} !== expected) begin
                errors = errors + 1;
                $display("ERROR:");
                $display("a=%b b=%b cin=%b", a, b, cin);
                $display("Expected=%b Got=%b", expected, {cout, sum});
            end
        
        end

        if (errors == 0)
            $display("PASS: All tests passed.");
        else
            $display("FAIL: %0d errors.", errors);

        $finish;

    end

endmodule
