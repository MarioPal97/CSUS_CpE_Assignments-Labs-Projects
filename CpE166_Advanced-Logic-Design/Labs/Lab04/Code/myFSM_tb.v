`timescale 1ns / 1ps
module myFSM_tb();
    reg clk,rst;
    wire clr;
    wire [3:0] ce;
    wire [2:0] w,s;
    wire [1:0] sel;
    
    myFSM uut(clk,rst,clr,sel,s,ce,w);
    
    always #5 clk = ~clk;
    
    initial begin 
        clk =0; 
        #2 rst = 1;
        #10 rst = 0;
        #200$stop;
    end 
endmodule
