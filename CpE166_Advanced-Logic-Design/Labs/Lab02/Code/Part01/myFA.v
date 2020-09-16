`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myFA
//////////////////////////////////////////////////////////////////////////////////


module myHA (input a,b, output cout,sum);
	assign sum = a^b;
	assign cout = a&b;
endmodule 

module myFA (a,b,cin,cout,sum);
	input a,b,cin;
	output cout,sum;
	wire m,n,p;
	myHA g1(.cout(n),.sum(m),.a(a),.b(b));
    	myHA g2(.cout(p),.sum(sum),.a(cin),.b(m));
	
	or g3(cout,p,n);
endmodule
