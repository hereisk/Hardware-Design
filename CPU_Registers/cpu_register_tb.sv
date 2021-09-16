module cpu_register_tb();
  logic clock, reset, write_en;
  logic  [3:0] addr_a, addr_b, addr_wr;
  logic [7:0] din;
  logic [7:0] out_a, out_b;
  
  cpu_register dut (clock, reset, addr_a, addr_b, addr_wr, write_en, din, out_a, out_b);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, cpu_register_tb);
    
    clock = 0;
    write_en = 0;
    reset = 0;
    addr_a = 4'b0000;
    addr_b = 4'b0001;
    addr_wr = 4'b0000;
    din = 8'b10010001; #5;
    write_en = 1; #1;
    write_en = 0; #5;
    write_en = 1; #1
    addr_wr = 4'b0001;
    din = 8'b10010111;
    write_en = 0; #5;
    addr_b = 4'b0001;
    addr_a = 4'b0100; #5
    addr_a = 4'b0000;
    
    
    #40;
    $finish;
  end
  
  always begin
    #5; clock = ~clock;
  end
endmodule