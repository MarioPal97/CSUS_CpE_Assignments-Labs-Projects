module fifo(clk, rst, wr, rd, full, empty, w_addr, r_addr);
  input    clk, rst, wr, rd;
  output   full, empty;
  output [11:0]  w_addr, r_addr;

  reg    [12:0]  w_ptr, r_ptr;

  always@(posedge clk or posedge rst)
  begin
     if(rst)
     begin
       w_ptr <= 0;
       r_ptr <= 0;
     end
     else
       if(wr && !full)
         w_ptr <= w_ptr + 1;
       if(rd && !empty)
         r_ptr <= r_ptr + 1;
  end

  assign full = ((r_ptr!=w_ptr) && (r_ptr[11:0]==w_ptr[11:0]))?1:0;
  assign empty = (r_ptr==w_ptr) ? 1 : 0;

  assign w_addr = w_ptr[11:0];
  assign r_addr = r_ptr[11:0];

endmodule