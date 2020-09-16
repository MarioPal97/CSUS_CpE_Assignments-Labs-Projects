`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/10/2020 12:48:07 PM
// Design Name: Lab 02
// Module Name: myCAS8
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

module myMUX(s,y,d0,d1);
    input      d0,d1;
    input      s;
    output     y;
    wire       m,n;

    assign m = (~s)&d0;
    assign n = s&d1;
    assign y = m|n;
endmodule

module myMUXB(d0,d1,y,s);
    input [3:0]  d0,d1;
    input        s;
    output [3:0] y;
    reg    [3:0] y;
    
    always@(d0 or d1 or s)
    begin 
        if (s == 1)
            y = d1;
        else 
            y = d0;
    end
endmodule

module myCSA8(a,b,cin,sum,cout);
    input  [7:0] a,b;
    input        cin;
    output [7:0] sum;
    output       cout;
    wire   [7:0] sa,sb;
    wire   [3:0] c;
    wire         m;
    
    myRCA4 u0(a[3:0],b[3:0],1'b0,c[0],sa[3:0]);
    myRCA4 u1(a[3:0],b[3:0],1'b1,c[1],sb[3:0]);
    myRCA4 u2(a[7:4],b[7:4],1'b0,c[2],sa[7:4]);
    myRCA4 u3(a[7:4],b[7:4],1'b1,c[3],sb[7:4]);
    
    myMUXB g1(sa[3:0],sb[3:0],sum[3:0],cin);
    myMUXB g2(sa[7:4],sb[7:4],sum[7:4],m);
    
    myMUX f1(cin,m,c[0],c[1]);
    myMUX f2(m,cout,c[2],c[3]);
endmodule
