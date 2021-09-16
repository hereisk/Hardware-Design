module cpu_alu_tb();
  logic  [7:0]a;
  logic  [7:0]b;
  logic  [2:0]opcode;
  logic [7:0]alu;
  
  cpu_alu dut (a, b, opcode, alu);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, cpu_alu_tb);
    
    a = 8'b00010001;
    b = 8'b10000010;
    opcode = 3'b000; #5;
    opcode = 3'b001; #5;
    opcode = 3'b010; #5;
    opcode = 3'b011; #5;
    opcode = 3'b100; #5;
    opcode = 3'b101; #5;
    opcode = 3'b110; #5;
    opcode = 3'b111; #5;
  end
endmodule