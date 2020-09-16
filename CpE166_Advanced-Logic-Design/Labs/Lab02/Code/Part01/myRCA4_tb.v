`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/03/2020 11:52:26 AM
// Design Name: Lab 02
// Module Name: myRCA4_tb
//////////////////////////////////////////////////////////////////////////////////


module myRCA4_tb();
    reg  [3:0] a,b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;
    
    myRCA4 uut(a,b,cin,cout,sum); 
        
    initial 
    begin 
        {a,b,cin} = 9'b0;
        for(integer k = 0; k < 512; k = k + 1) begin
            #10 {a,b,cin} = k;
        end
        #20 $stop;
    end
endmodule
