module dff(input D, clk, rst, en, output reg o);
	always @ (posedge clk)
	begin
		if(rst)
			o <= 1'b0;
		else
			o <= D;
	end
endmodule
