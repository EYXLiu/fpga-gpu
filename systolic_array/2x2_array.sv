module systolic_2x2 (
    input logic clk,
    input logic rst,

    input logic [7:0] a_0,
    input logic [7:0] a_1,

    input logic [7:0] b_0,
    input logic [7:0] b_1,

    output logic [31:0] c00,
    output logic [31:0] c01,
    output logic [31:0] c10,
    output logic [31:0] c11
);

    logic [7:0] a00_to_01;
    logic [7:0] a10_to_11;
    
    logic [7:0] b00_to_10;
    logic [7:0] b01_to_11;

    // top left
    pe pe00 (
        .clk(clk),
        .rst(rst),

        .a_in(a_0),
        .b_in(b_0),

        .a_out(a00_to_01),
        .b_out(b00_to_10),

        .acc(c00)
    );

    // top right
    pe pe01 (
        .clk(clk),
        .rst(rst),

        .a_in(a00_to_01),
        .b_in(b_1),

        .a_out(),
        .b_out(b01_to_11),

        .acc(c01)
    );

    // bottom left
    pe pe10 (
        .clk(clk),
        .rst(rst),

        .a_in(a_1),
        .b_in(b00_to_10),

        .a_out(a10_to_11),
        .b_out(),

        .acc(c10)
    );

    // bottom right
    pe pe11 (
        .clk(clk),
        .rst(rst),

        .a_in(a10_to_11),
        .b_in(b01_to_11),

        .a_out(),
        .b_out(),

        .acc(c11)
    );

endmodule
