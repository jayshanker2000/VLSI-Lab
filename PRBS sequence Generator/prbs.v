module clk_div(input clk, output clkout);
	reg [31:0] c = 32'b0;
	always @(posedge clk)
	begin
	c = c +1'b1;
	end
	assign clkout=c[31];
endmodule


module dff(input D, clk, rst, en, output reg o);
	always @(posedge clk or posedge rst or posedge en)
  begin
	if(rst)
	  o <= 1'b0;
	else if(en)
	  o <= 1'b1;
	else
	  o <= D;	
  end
endmodule

module PRBS(input clk, rst, en,   output [2:0]o);
  wire o1,o2,o3;
  wire temp;
   dff d1(temp, clk, rst, en, o1);
   dff d2(o1, clk, rst, en, o2);
   dff d3(o2, clk, rst, en, o3);
 assign temp = o1 ^ o3;
 assign o = o1+o2*2'b10+o3*3'b100;
endmodule
