`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: CpE 166 - Section 02
// Name: Mario Palacios 
// Create Date: 01/27/2020 01:40:10 PM
// Module Name: decoder_tb
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_tb;
    reg [1:0]  a;
    wire [3:0] d;
    
    decoder2to4 u1(.a(a),.d(d));
    
    initial begin 
        a = 2'b00;
        #10;
        a = 2'b01;
        #10;
        a = 2'b10;
        #10;
        a = 2'b11;
        #20 $stop;
    end
endmodule
