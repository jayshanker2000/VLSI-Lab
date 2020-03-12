module dff_tb();
  reg D, clk, rst, en;
  wire o;
dff uut(
    .o(o),
    .D(D),
    .clk(clk),
    .rst(rst)
);	

initial begin	
  clk = 0; D = 0;
end

initial begin
  forever #5 clk = ~clk;
end
initial begin
  forever #7 D = ~D;
end
initial begin
  #10 rst=1;  
  #20 rst=0;
  #20 rst=0;
end
endmodule
