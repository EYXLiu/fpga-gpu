module sim;

    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] res_8_add;
    logic [7:0] res_8_sub;
    logic [15:0] res_16;

    add dut_add (
        .a(a),
        .b(b),
        .res(res_8_add)
    );

    sub dut_sub (
        .a(a),
        .b(b),
        .res(res_8_sub)
    );

    mult dut_mult (
        .a(a),
        .b(b),
        .res(res_16)
    );

    initial begin
        a = 7;
        b = 3;
        
        #1;
        $display("%d + %d = %d", a, b, res_8_add);

        #1;
        $display("%d - %d = %d", a, b, res_8_sub);

        #1;
        $display("%d * %d = %d", a, b, res_16);

        $finish;
    end

endmodule
