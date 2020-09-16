`timescale 1ns / 1ps
module myDFF_tb;
    reg        clk,clr,ce;
    reg  [3:0] d;
    wire [3:0] q;
    
    myDFF utt(clk,clr,d,q,ce);
    
    always #10 clk = ~clk;
    
    initial begin 
            clr = 1; d =1; ce =1;
        #20 clr = 0;
        #20 ce = 0;
        #40 $stop;
    end
endmodule
