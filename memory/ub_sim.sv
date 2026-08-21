module sim;
    logic clk;

    // write
    logic        wr_en;
    logic [7:0]  wr_addr;
    logic [31:0] wr_data;

    // read
    logic        rd_en;
    logic [7:0]  rd_addr;
    logic [31:0] rd_data;

    unified_buffer #(
        .DATA_WIDTH(32),
        .ADDR_WIDTH(8)
    ) dut (
        .clk(clk),
        
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),

        .rd_en(rd_en),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        wr_en   = 0;
        wr_addr = 0;
        wr_data = 0;

        rd_en   = 0;
        rd_addr = 0;

        @(posedge clk);

        // write 123 to address 5
        wr_en = 1;
        wr_addr = 8'd5;
        wr_data =32'd123;

        @(posedge clk);
        wr_en = 0;

        // write 456 to address 10
        wr_en = 1;
        wr_addr = 8'd10;
        wr_data = 32'd456;

        @(posedge clk);
        wr_en = 0;
        
        rd_en = 1;
        rd_addr = 8'd5;

        @(posedge clk);
        
        $display("Address 5: %d", rd_data);
        rd_en = 0;

        rd_en = 1;
        rd_addr = 8'd10;

        @(posedge clk);

        $display("Address 10: %d", rd_data);
        rd_en = 0;

        #10;
        $finish;
    end
endmodule
