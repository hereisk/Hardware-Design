module cpu_rom (din, dout);
  input logic [7:0] din;
  output logic [26:0] dout;
  
  reg [30:1] internal_memory[26:0];
  
  initial begin
    for (int i = 1; i < 31; i++) begin
      internal_memory[i] <= 27'b000000000000000000000000000;
      end
    internal_memory[1] <= 27'b000000000000000010000111100;
    internal_memory[2] <= 27'b000000000000000110000110000;
    internal_memory[3] <= 27'b000000000000001010001100000;
    internal_memory[4] <= 27'b000100000001001111111111100;
    internal_memory[5] <= 27'b100000000011000001111111111;
    internal_memory[30] <= 27'b101100100000010010000000000;
  end
  
  always @(*)
    begin
      assign dout = internal_memory[din];
    end
endmodule