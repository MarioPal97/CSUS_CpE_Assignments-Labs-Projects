`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myHA
//////////////////////////////////////////////////////////////////////////////////


module myHA (a,b,cout,sum);
	input a,b;
	output cout,sum;
	
	assign sum = a^b;
	assign cout = a&b;
endmodule 
