module cpu_register (clock, reset, addr_a, addr_b, addr_wr, write_en, din, out_a, out_b);
  input logic clock, reset, write_en;
  input logic  [3:0] addr_a, addr_b, addr_wr;
  input logic [7:0] din;
  output logic [7:0] out_a, out_b;

  
  reg [15:0] internal_memory[7:0];
  
  initial begin
    for (int i = 0; i < 16; i++) begin
        internal_memory[i] <= 8'b00000000;
      end
  end
  
  always @(posedge clock)
    begin
      if (write_en == 1)
        begin
          internal_memory[addr_wr] <= din;
        end

    end

  always @(*)
  begin
      out_a = internal_memory[addr_a];
      out_b = internal_memory[addr_b];
  end
    
endmodule