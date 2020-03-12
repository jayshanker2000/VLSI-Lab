module prbs_tb;
      
	reg clk;
	reg rst;
	reg en;
	wire [2:0] o;

Under Test (UUT)
	PRBS uut (
		.clk(clk), 
		.rst(rst), 
		.en(en),
		.o(o)
	);

initial begin
	clk = 0;
	rst = 0;
	en = 0;
	forever #10 clk = ~clk;
end
	
initial begin
	#20 rst = 1;
	#30 rst = 0;
	#10 en = 1;
	#10 en = 0;
end
      
endmodule
