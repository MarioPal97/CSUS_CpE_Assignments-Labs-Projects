`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01 
// Create Date: 02/17/2020 12:31:21 PM
// Design Name: Lab02 Part02
// Module Name: myADDER
//////////////////////////////////////////////////////////////////////////////////

module myADDER(a,b,cout,sum);
	input  [3:0] a,b;
	output [3:0] sum;
	output 		 cout;
	
	assign {cout,sum} = a + b;
endmodule
