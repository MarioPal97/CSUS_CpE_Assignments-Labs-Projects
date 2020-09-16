`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myFA_tb
//////////////////////////////////////////////////////////////////////////////////


module myFA_tb();
	reg a,b,cin;
	wire cout,sum;
	
	myFA utt(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
	
	initial begin
		{a,b,cin} = 3'b000;
		#10 {a,b,cin} = 3'b001;
		#10 {a,b,cin} = 3'b010;
		#10 {a,b,cin} = 3'b011;
		#10 {a,b,cin} = 4;		//3'b100;
		#10 {a,b,cin} = 5;		//3'b101;
		#10 {a,b,cin} = 6;		//3'b110;
		#10 {a,b,cin} = 7;		//3'b111;
		#20 $stop;
	end
endmodule
