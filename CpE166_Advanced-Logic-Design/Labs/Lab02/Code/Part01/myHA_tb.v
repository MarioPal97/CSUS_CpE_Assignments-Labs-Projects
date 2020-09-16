`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myHA_tb
//////////////////////////////////////////////////////////////////////////////////


module myHA_tb();
	reg a,b;
	wire cout,sum;
	
	myHA utt(.a(a),.b(b),.cout(cout),.sum(sum));
	
	initial 
	begin
		a = 0; b = 0;
		#10;
		a = 0; b = 1;
		#10;
		a = 1; b = 0;
		#10;
		a = 1; b = 1;
		#20 $stop;
	end
endmodule
