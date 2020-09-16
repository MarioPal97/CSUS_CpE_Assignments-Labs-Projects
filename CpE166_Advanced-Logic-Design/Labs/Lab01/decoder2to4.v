`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: CpE 166 - Section 02
// Name: Mario Palacios 
// Create Date: 01/27/2020 01:19:12 PM
// Module Name: decoder2to4
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder2to4(input [1:0] a,output [3:0] d);
    
    assign d[0] = ~a[0]&~a[1];
    assign d[1] = a[0]&~a[1];
    assign d[2] = ~a[0]&a[1];
    assign d[3] = a[0]&a[1];
    
endmodule
