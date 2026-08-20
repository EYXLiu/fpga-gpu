module systolic_nxn #(
    parameter N = 4
) (
    input logic clk,
    input logic rst,

    input logic [7:0] a_in [0:N-1],
    input logic [7:0] b_in [0:N-1],

    output logic [31:0] c [0:N-1][0:N-1]
);

    logic [7:0] a_wire [0:N-1][0:N];
    logic [7:0] b_wire [0:N][0:N-1];

    genvar i;
    generate
        for (i = 0; i < N; i++) begin
            assign a_wire[i][0] = a_in[i];
            assign b_wire[0][i] = b_in[i];
        end
    endgenerate

    genvar row;
    genvar col;

    generate
        for (row = 0; row < N; row++) begin : rows
            for (col = 0; col < N; col++) begin : cols
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

// use case
// systolic_nxn #(.N(4)) array_4x4()
