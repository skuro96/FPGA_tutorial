`timescale 1 ns / 1 ns

module TestBench;

	reg CLK, RESET;
	wire [3:0] Q;
	
	Counter Test(.CLK(CLK), .RESET(RESET), .Q(Q));
	
	always
		#10 CLK = ~CLK;
		
	initial
	begin
		RESET = 1'b1;
		CLK = 1'b0;
		
		#10 RESET = 1'b0;
		#5 RESET = 1'b1;
		#985 $stop;
	end
	
endmodule
