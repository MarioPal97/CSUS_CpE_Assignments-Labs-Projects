`timescale 1ns / 1ps
module mux2to1_tb();
    reg sel;
    reg [3:0] d0, d1;
    wire [3:0] y;
    
    mux2to1 utt(d0,d1,sel,y);
    
    initial begin
            d0=0; d1=0; sel=0;
        #10 d0=0; d1=0; sel=1;
        #10 d0=0; d1=1; sel=0;
        #10 d0=0; d1=1; sel=1;
        #10 d0=1; d1=0; sel=0;
        #10 d0=1; d1=0; sel=1;
        #10 d0=1; d1=1; sel=0;
        #10 d0=1; d1=1; sel=1;
        #20 $stop; 
    end 
endmodule
