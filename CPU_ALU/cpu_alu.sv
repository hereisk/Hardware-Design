module cpu_alu (a, b, opcode, alu);
  input logic  [7:0]a;
  input logic  [7:0]b;
  input logic  [2:0]opcode;
  output logic [7:0]alu;

  always @(*)
  begin
  case(opcode)
    3'b000:
      assign alu = a;
    3'b001:
      assign alu = b;
    3'b010:
      assign alu = a ^ b;
    3'b011:
      assign alu = a ~^ b;
    3'b100:
      assign alu = a + b;
    3'b101:
      assign alu = a - b;
    3'b110:
      assign alu = a << 1;
    3'b111:
      assign alu = a >> 1;
    default: assign alu = a;
  endcase
  end
endmodule