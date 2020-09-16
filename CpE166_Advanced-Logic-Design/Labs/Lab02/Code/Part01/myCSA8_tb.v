`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/10/2020 01:25:09 PM
// Design Name: Lab 02
// Module Name: myCAS8_tb
//////////////////////////////////////////////////////////////////////////////////


module myCSA8_tb();
    reg  [7:0] a,b;
    reg        cin;
    wire [7:0] sum;
    wire       cout; 
    wire [7:0] result;
    
    assign result = {cout,sum};
    
    myCSA8 uut(a,b,cin,sum,cout);
    
    initial begin
             a = 2; b = 4; cin = 0;
         #10 a = 3; b = 3; cin = 1; 
         #10 a = 10; b = 2; cin = 0;
         #10 a = 25; b = 35; cin = 1;
         #10 a = 125; b = 125; cin = 1;
         #20 $stop;
    end
endmodule

