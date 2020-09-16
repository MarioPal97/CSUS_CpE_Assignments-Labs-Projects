`timescale 1ns / 1ps
module dataPath(m0,m1,m2,clear,clock,select,cin,s,w,ce,r0,r1,r2);
    input        clock,clear,cin;
    input  [3:0] m0,m1,m2,ce;
    input  [2:0] s,w;
    input  [1:0] select;
    output [3:0] r0,r1,r2;
    wire   [3:0] y0,y1,y2,y3,a,b;
    
    mux2to1 g1(.d0(m0),.d1(a),.sel(w[0]),.y(y0));
    mux2to1 g2(.d0(m1),.d1(a),.sel(w[1]),.y(y1));
    mux2to1 g3(.d0(m2),.d1(a),.sel(w[2]),.y(y2));
    
    myDFF d1(.clk(clock),.clr(clear),.d(y0),.q(r0),.ce(ce[0]));
    myDFF d2(.clk(clock),.clr(clear),.d(y1),.q(r1),.ce(ce[1]));
    myDFF d3(.clk(clock),.clr(clear),.d(y2),.q(r2),.ce(ce[2]));
    myDFF d4(.clk(clock),.clr(clear),.d(y3),.q(a),.ce(ce[3]));
    
    mux4to1 g4(.d0(r0),.d1(r1),.d2(r2),.d3(4'b0000),.select(select),.y(b));
    
    myALU a1(.a(a),.b(b),.s(s),.cin(cin),.y(y3));
endmodule
