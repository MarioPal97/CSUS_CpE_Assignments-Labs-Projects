`include "fifo.v"
module fifo_tb;
reg    clk, rst, wr, rd;
wire   full, empty;
wire  [2:0]  w_addr, r_addr;

fifo uut(clk, rst, wr, rd, full, empty, w_addr, r_addr);

always #10 clk=~clk;

initial 
begin
     $monitor($time, " ns,  wr=%b, rd=%b, w_addr=%d, r_addr=%d, full=%b, empty=%b", wr, rd, w_addr, r_addr, full, empty); 
     rst = 1; wr=1; rd = 0; clk=0;
     #5 rst=0;
     #60;
     wr=0; rd = 1;
     #40;
     wr = 1; rd = 0;
     repeat (10)  @(negedge clk);
     wr = 0; rd = 1;
     repeat (10)  @(negedge clk);
     #20 $stop;
end
endmodule      