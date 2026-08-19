// multiply matrices
// A: [1, 2]
//    [3, 4]
// B: [5, 6]
//    [7, 8]
// expected answer:
//    [19, 22]
//    [43, 50]

module sim;

    logic clk;
    logic rst;

    logic [7:0] a_0;
    logic [7:0] a_1;
    logic [7:0] b_0;
    logic [7:0] b_1;

    logic [31:0] c00;
    logic [31:0] c01;
    logic [31:0] c10;
    logic [31:0] c11;

    systolic_2x2 dut (
        .clk(clk),
        .rst(rst),

        .a_0(a_0),
        .a_1(a_1),

        .b_0(b_0),
        .b_1(b_1),

        .c00(c00),
        .c01(c01),
        .c10(c10),
        .c11(c11)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        a_0 = 0;
        a_1 = 0;
        b_0 = 0;
        b_1 = 0;

        // reset
        #10;
        rst = 0;

        // cycle 1
        a_0 = 1;
        a_1 = 0;
        b_0 = 5;
        b_1 = 0;

        #10;

        // cycle 2
        a_0 = 2;
        a_1 = 3;
        b_0 = 7;
        b_1 = 6;

        #10;

        // cycle 3
        a_0 = 0;
        a_1 = 4;
        b_0 = 0;
        b_1 = 8;

        #10;

        // cycle 4
        a_0 = 0;
        a_1 = 0;
        b_0 = 0;
        b_1 = 0;

        #10;

        $display("C =");
        $display("[%d %d]", c00, c01);
        $display("[%d %d]", c10, c11);

        $finish;
    end

endmodule