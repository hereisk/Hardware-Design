module cpu_rom_tb();
  logic [7:0] din;
  logic [26:0] dout;
  
  cpu_rom dut (din, dout);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, cpu_rom_tb);
    
    din = 1; #5
    din = 2; #5
    din = 3; #5
    din = 4; #5
    din = 5; #5
    din = 6; #5
    din = 10; #5
    din = 30; #5
    din = 29; #5
    
    #5
    $finish;
  end
endmodule