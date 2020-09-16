`timescale 1ns / 1ps
module mux2to1(d0,d1,sel,y);
    input sel;
    input [3:0] d0,d1;
    output reg [3:0] y;
    
    always@(d0 or d1 or sel) begin 
        if(sel) y = d1;
        else y = d0;
    end
endmodule
