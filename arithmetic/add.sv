module add (
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [7:0] res
);
    assign res = a + b;
endmodule