`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:35 02/14/2020 
// Design Name: 
// Module Name:    lcd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lcd(input clk,output reg sf_e, e , rs, rw, d, c, b, a);

reg[26:0] count = 0;
reg[5:0] code;
reg refresh;
reg [6:0] sel1, sel2;

always @(posedge clk)
begin
	count <= count +1;
	
	case( count[26:21])
	0: code <= 6'h03;
	1: code <= 6'h03;
	2: code <= 6'h03;
	3: code <= 6'h02;
	
	4: code <= 6'h02;
	5: code <= 6'h08;
	
	6: code <= 6'h00;
	7: code <= 6'h06;
	
	8: code <= 6'h00;
	9: code <= 6'h0C;
	
	10: code <= 6'h00;
	11: code <= 6'h01;
	
	12: code <= sel1;
	13: code <= sel2;
	14: code <= 6'h24;
	15: code <= 6'h28;
	16: code <= 6'h26;
	17: code <= 6'h25;
	18: code <= 6'h26;
	19: code <= 6'h2C;
	20: code <= 6'h26;
	21: code <= 6'h2C;
	22: code <= 6'h26;
	23: code <= 6'h2F;
	24: code <= 6'h22;
	25: code <= 6'h2C;

	default:
	         code <= 6'h03;
	endcase

	case(count[24:23])
	0: begin sel1 <= 6'b000000;
				sel2 <= 6'b001100;
				end
	1: begin sel1 <= 6'b000001;
				sel2 <= 6'b001100;
				end
	2: begin sel1 <= 6'b000010;
				sel2 <= 6'b001100;
				end
	3: begin sel1 <= 6'b000011;
				sel2 <= 6'b001100;
				end
				
	endcase

	refresh <= count[20];
	sf_e <= 1;
	{e, rs, rw, d, c, b, a} <= {refresh, code};
	
	
	end
endmodule
