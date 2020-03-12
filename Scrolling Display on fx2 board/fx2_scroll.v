/* To display 1701EE15 on fx2 board and scroll it right-to-left */

module frequency_divider(
	input clk,
	output freq, freq1
	);

reg [24:0] counter;

always @(posedge clk)
begin
counter <= counter + 25'd1;
end
assign freq = counter[22];
assign freq1 = counter[12];
endmodule

module fx(input clk, output 
reg [7:0] select , display );
reg [1:0]temp =0;
reg [3:0]tem =0;

reg [7:0] sel1, sel2, sel3, sel4;
wire clko, clko1;
frequency_divider f(clk,clko,clko1);

always@(posedge clko1)
begin	
  case(temp)
2'b00 : begin
  select = sel1;
	  display= 8'b0000_0011; //0
	end
2'b01 : begin
	  select = sel2;
	  display= 8'b1001_1111; //1
end
	2'b10 : begin
  select = sel3;
	  display= 8'b0100_1100; //5
end
2'b11 : begin
	  select = sel4;
	  display= 8'b0110_0001; //E
end
    endcase
	
	 temp = temp+1;
end

always @(posedge clko)
begin
case(tem)
  4'd0: begin
    sel1 = 8'b1111_1101;
    sel2 = 8'b1111_1111;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_1111;
  end

  4'd1: begin
    sel1 = 8'b1111_1011;
    sel2 = 8'b1111_1101;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_1111;
  end

  4'd2: begin
    sel1 = 8'b1111_0111;
    sel2 = 8'b1111_1011;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_1101;
  end

  4'd3: begin
    sel1 = 8'b1110_1111;
    sel2 = 8'b1111_0111;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_1001;
  end

  4'd4: begin
    sel1 = 8'b1101_1111;
    sel2 = 8'b1110_1101;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_0011;
  end

  4'd5: begin
    sel1 = 8'b1011_1111;
    sel2 = 8'b1101_1011;
    sel3 = 8'b1111_1101;
    sel4 = 8'b1110_0111;
    end

  4'd10: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1011_0111;
    sel3 = 8'b1111_1011;
    sel4 = 8'b1100_1111;
  end

  4'd11: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1110_1111;
    sel3 = 8'b1111_0111;
    sel4 = 8'b1001_1111;
  end

  4'd12: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1101_1111;
    sel3 = 8'b1110_1111;
    sel4 = 8'b1011_1111;
  end

  4'd13: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1011_1111;
    sel3 = 8'b1101_1111;
    sel4 = 8'b1111_1111;
  end

  4'd14: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1111_1111;
    sel3 = 8'b1011_1111;
    sel4 = 8'b1111_1111;
  end

  4'd15: begin
    sel1 = 8'b1111_1111;
    sel2 = 8'b1111_1111;
    sel3 = 8'b1111_1111;
    sel4 = 8'b1111_1111;
  end
                
endcase
    tem = tem+1;
end
endmodule
