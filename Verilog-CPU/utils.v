
`define PRINT_HEADER(in, out) \
    $display(""); \
    $display("%s | %s", in, out); \
    $display("----------------");

`define PRINT_ROW \
    $display("%b%b%b | %b%b", A,B,Cin,Cout,S);
s