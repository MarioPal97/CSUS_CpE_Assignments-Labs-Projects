`timescale 1ns / 1ps
module myDFF(clk,clr,d,q,ce);
    input            clk,clr,ce;
    input      [3:0] d;
    output reg [3:0] q;
    
    always@(posedge clr or posedge clk)
    begin 
        if(clr) q <= 0;
        else if (ce) q <= d;
    end
endmodule
