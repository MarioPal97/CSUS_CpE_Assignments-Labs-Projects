`timescale 1ns / 1ps
module myALU_tb();
    reg cin;
    reg [3:0] a,b;
    reg [2:0] s;
    wire [3:0] y;
    
    myALU uut(a,b,s,cin,y);
    
    initial begin 
            s=0; a=1; b=2; cin=1;
        #10 s=1; a=1; b=0; cin=1;
        #10 s=2; a=1; b=0; cin=1;
        #10 s=3; a=1; b=0; cin=1;
        #10 s=4; a=1; b=0; cin=1;
        #10 s=5; a=1; b=0; cin=1;
        #10 s=6; a=1; b=0; cin=1;
        #10 s=7; a=1; b=0; cin=1;
        #20 $stop;
    end 
endmodule
