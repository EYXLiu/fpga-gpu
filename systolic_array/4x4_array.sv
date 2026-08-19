module systolic_4x4 (
    input logic clk,
    input logic rst,

    input logic [7:0] a_0,
    input logic [7:0] a_1,
    input logic [7:0] a_2,
    input logic [7:0] a_3,

    input logic [7:0] b_0,
    input logic [7:0] b_1,
    input logic [7:0] b_2,
    input logic [7:0] b_3,

    output logic [31:0] c [0:3][0:3]
);

    logic [7:0] a_wire [0:3][0:4];
    logic [7:0] b_wire [0:4][0:3];

    assign a_wire[0][0] = a_0;
    assign a_wire[1][0] = a_1;
    assign a_wire[2][0] = a_2;
    assign a_wire[3][0] = a_3;

    assign b_wire[0][0] = b_0;
    assign b_wire[0][1] = b_1;
    assign b_wire[0][2] = b_2;
    assign b_wire[0][3] = b_3;

    genvar row;
    genvar col;

    generate
        for (row = 0; row < 4; row++) begin : rows
            for (col = 0; col < 4; col++) begin : cols
                pe pe_inst (
                    .clk(clk),
                    .rst(rst),

                    .a_in(a_wire[row][col]),
                    .b_in(b_wire[row][col]),

                    .a_out(a_wire[row][col + 1]),
                    .b_out(b_wire[row + 1][col]),

                    .acc(c[row][col])
                );
            end
        end
    endgenerate

endmodule
