
// ========================
// Module: dmux
//
// if sel=0 then {a=in, b=0} else {a=0, b=in}
// ========================

module dmux (
    input  in,
    input  sel,
    output a,
    output b
);

    assign a = in & ~sel;
    assign b = in & sel;

endmodule