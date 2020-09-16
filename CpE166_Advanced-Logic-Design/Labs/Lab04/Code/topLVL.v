`timescale 1ns / 1ps
module topLVL(sw1,clk,m0,m1,m2,cin,r0,r1,r2);
    input             sw1,clk,cin;
    input       [3:0] m0,m1,m2;
    output wire [3:0] r0,r1,r2;
    
    wire clr;
    wire [3:0] ce;
    wire [2:0] w,s;
    wire [1:0] sel;
    
    dataPath g1(.m0(m0),.m1(m1),.m2(m2),.clear(clr),.clock(clk),.select(sel),.cin(cin),.s(s),.w(w),.ce(ce),.r0(r0),.r1(r1),.r2(r2));
    myFSM g2(.clk(clk),.rst(sw1),.clr(clr),.sel(sel),.s(s),.ce(ce),.w(w));
endmodule
