`timescale 1ns / 1ps
module top_tb();
    reg        sw1,clk,cin;
    reg  [3:0] m0,m1,m2;
    wire [3:0] r0,r1,r2;
    
    topLVL utt(sw1,clk,m0,m1,m2,cin,r0,r1,r2);
    
    initial clk = 0;
    always #5 clk = ~clk;
       initial begin
        sw1 = 1;
        m0  = 13;
        m1  = 3;
        m2  = 0;
        cin = 1;
        
        #10
        sw1 = 0;
        
        #70
        sw1 = 1;
        m0  = 2;
        m1  = 8;
        m2  = 5;
        cin = 0;
        
        #10
        sw1 = 0;
        
        #70 $stop;
    end     
endmodule
