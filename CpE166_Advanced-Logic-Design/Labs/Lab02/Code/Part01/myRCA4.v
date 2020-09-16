`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myRCA4
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

module myRCA4 (a,b,cin,cout,sum);
    input  [3:0] a,b;
    input        cin;
    output [3:0] sum;
    output       cout;
    wire         r,s,t; 
    
    myFA u1(.a(a[0]),.b(b[0]),.cin(cin),.cout(r),.sum(sum[0]));
    myFA u2(.a(a[1]),.b(b[1]),.cin(r),.cout(s),.sum(sum[1]));
    myFA u3(.a(a[2]),.b(b[2]),.cin(s),.cout(t),.sum(sum[2]));
    myFA u4(.a(a[3]),.b(b[3]),.cin(t),.cout(cout),.sum(sum[3]));
endmodule
