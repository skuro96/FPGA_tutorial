module Flip_Flop(CLK, RESET, D, Q);

  input CLK, RESET, D;
  output Q;
  reg Q;

  always @(posedge CLK)
  begin
    if(!RESET) Q <= 0;
    else Q <= D;
  end

endmodule
