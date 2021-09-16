module cpu_counter_tb();
  logic clock;
  logic reset;
  logic write_en;
  logic [7:0] din;
  logic [7:0] dout;
  
  cpu_counter dut (clock, reset, din, write_en, dout);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, cpu_counter_tb);
    
    write_en = 0;
    reset = 0;
    clock = 0;
    #5;
    write_en = 1;
    din = 8'b11111110; #5;
    write_en = 0; #40;
    reset = 1; #5
    reset = 0;
    #5;
    $finish;
  end
  
  always begin
    #5; clock = ~clock;
  end
endmodule