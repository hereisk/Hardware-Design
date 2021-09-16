module cpu_counter (clock, reset, din, write_en, dout);
  input logic clock;
  input logic reset;
  input logic write_en;
  input logic [7:0] din;
  output logic [7:0] dout;
  
  reg [7:0] internal_memory;
  
  initial begin
    internal_memory <= 8'b00000000;
  end
  
  always @(posedge clock)
    begin
      if (write_en == 1)
        begin
          internal_memory <= din;
        end
      else if (reset == 1)
        begin
          internal_memory <= 8'b00000000;
        end
      else if (internal_memory == 8'b11111111)
        begin
          internal_memory <= 8'b00000000;
        end
      else
        begin
          internal_memory <= internal_memory + 8'b00000001;
        end
      
     assign dout = internal_memory;
    end
endmodule