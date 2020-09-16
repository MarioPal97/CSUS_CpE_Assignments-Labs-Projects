`timescale 1ns / 1ps
module myFSM(clk,rst,clr,sel,s,ce,w);
    input clk,rst;
    output reg clr;
    output reg [3:0] ce;
    output reg [2:0] w,s;
    output reg [1:0] sel;
    
    reg [2:0] cs, ns;
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;
    
    always@(posedge clk or posedge rst) begin 
        if(rst) begin 
            cs <= s0; 
        end else begin 
            cs <= ns;
        end
    end
    
    always@(cs) begin
        case(cs)
            s0:
                begin
                    clr = 1'b1;
                    ce = 4'b0000;
                    w = 3'b000;
                    s = 3'b000;
                    sel = 2'b11;
                    ns <= s1;
                end
            s1:
                begin
                    clr = 1'b0;
                    ce = 4'b1111;
                    w = 3'b000;
                    s = 3'b010;
                    sel = 2'b00;
                    ns <= s2;
                end
            s2:
                begin
                    clr = 1'b0;
                    ce = 4'b1000;
                    w = 3'b000;
                    s = 3'b010;
                    sel = 2'b00;
                    ns <= s3;
                end
            s3:
                begin
                    clr = 1'b0;
                    ce = 4'b0000;
                    w = 3'b000;
                    s = 3'b001; //F = A + B' + CIN
                    sel = 2'b01;
                    ns <= s4;
                end
            s4:
                begin
                    clr = 1'b0;
                    ce = 4'b1100;
                    w = 3'b100;
                    s = 3'b001;
                    sel = 2'b01;
                    ns <= s5;
                end
            s5:
                begin
                    clr = 1'b0;
                    ce = 4'b1100;
                    w = 3'b100;
                    s = 3'b011;
                    sel = 2'b11;
                    ns <= s6;
                end
             s6:
                begin
                    clr = 1'b0;
                    ce  = 4'b0000; 
				    w   = 3'b100; 
				    s   = 3'b011; 
				    sel = 2'b11;
                    ns <= s6;
                end
            default: 
                ns = s0;
        endcase
    end
endmodule
