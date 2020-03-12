module register_tb();
    
    reg clk, rst;
    reg [2:0] D;
    wire [2:0] q;
    
    register uut(
        .clk(clk),
        .rst(rst),
        .D(D),
        .q(q)
    );
    
    initial begin
        clk=0;
        forever #5 clk = ~clk;
end
    
    initial begin
        D=0;
        #10 D=3'b101;
        #15 D=3'b110;
        #10 D=3'b001;
    end
    
    initial begin
        rst=0;
        #12 rst=1;
        #5 rst=0;
    end
    
endmodule
