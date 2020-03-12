module register(
  input clk, rst,[2:0] D,
  output reg [2:0] q
    );
    
always @ (posedge clk)
begin
    if(rst)
        q <= 3'b000;
    else
        q <= D;
end

endmodule
