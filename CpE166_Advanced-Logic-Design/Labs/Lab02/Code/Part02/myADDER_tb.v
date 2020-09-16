`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01 
// Create Date: 02/17/2020 12:44:37 PM
// Design Name: Lab02 Part02
// Module Name: myADDER_tb
//////////////////////////////////////////////////////////////////////////////////


module myADDER_tb();
	reg  [3:0] a,b;
    wire [3:0] sum;
	wire  	   cout;
    
    myADDER utt(a,b,cout,sum);
    
	initial begin 
			a = 4'b0000; b = 4'b0000;
		#10 a = 4'b1110; b = 4'b1001;
		#10 a = 4'b1010; b = 4'b0101;
		#10 a = 4'b1111; b = 4'b1111;
		#10 $stop;
	end
endmodule
