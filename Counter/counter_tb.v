module counter_tb();

reg clk, rst;
wire [2:0] count;

Counter uut(
.clk(clk),
.rst(rst),
.count(count)                                  
);

initial begin
clk = 0; rst = 0;
end

initial begin
forever #5 clk = ~clk;
end 

initial begin
#20 rst = 1'b1;
#30 rst = 1'b0;
#70 rst = 1'b1;
#80 rst = 1'b0;
end

endmodule
