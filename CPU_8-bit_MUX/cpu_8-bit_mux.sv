module cpu_mux (input_0, input_1, sel, mux_out);
  input logic [7:0] input_0, input_1;
  input logic sel;
  output logic [7:0] mux_out;
  
  always @(*)
  begin
    case(sel)
      0:
        assign mux_out = input_0;
      1:
        assign mux_out = input_1;
    endcase
  end
endmodule