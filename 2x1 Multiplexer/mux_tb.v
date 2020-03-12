module mux_tb();
wire y;
reg a, b, s; 
 
mux uut(.a(a), .b(b), .y(y), .s(s));

initial begin
#5 a=0 ;b=0; s=0;
#5 a=1; b=0; s=0;
#5 a=0; b=1; s=0;
#5 a=1; b=1; s=0;
#5 a=0; b=0; s=1;
#5 a=1; b=0 ;s=1;
#5 a=0; b=1 ;s=1;
#5 a=1; b=1; s=1;
end  
 
endmodule
