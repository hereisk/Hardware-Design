module cpu_mux_tb();
  logic [7:0] input_0, input_1;
  logic sel;
  logic [7:0] mux_out;
  
  cpu_mux dut (input_0, input_1, sel, mux_out);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, cpu_mux_tb);
    
    input_0 = 8'b11111111;
    input_1 = 8'b00010001;
    sel = 0; #5;
    sel = 1; #5;
  end
endmodule