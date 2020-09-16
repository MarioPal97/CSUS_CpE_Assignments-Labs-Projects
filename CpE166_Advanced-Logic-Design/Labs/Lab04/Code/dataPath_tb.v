`timescale 1ns / 1ps
module dataPath_tb();
    reg        clock,clear,cin;
    reg  [3:0] m0,m1,m2,ce;
    reg  [2:0] s,w;
    reg  [1:0] select;
    wire [3:0] r0,r1,r2;
    
    dataPath uut(m0,m1,m2,clear,clock,select,cin,s,w,ce,r0,r1,r2);
    
    initial begin 
        clear=1'b1; w=3'b0000; ce=4'b0000; select=2'b00; clock=1'b0;
        s = 3'b000; m0=4'b0101; m1=4'b0011; m2=4'b0000; cin=1;
    end
    always #1 clock = ~clock;
    
    initial begin 
        #8 clear = 1'b0;
        #2 ce = 4'b0011; select = 2'b00; s = 3'b010;
        #2 ce = 4'b1011;
        #2 ce = 4'b0011; select = 2'b01; s = 3'b001;
        #2 ce = 4'b1000;
        #2 ce = 4'b0100; w = 3'b100;
        #2 w = 3'b000; ce = 4'b0000; select = 2'b00; s = 3'b000;
        #8 $stop;
    end
endmodule
