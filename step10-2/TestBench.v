`timescale 1 ns / 1 ns

module TestBench;

	reg CLK, RESET;
	wire LED0;
	
	Divide_Clock Test(.CLK(CLK), .RESET(RESET), .LED0(LED0));
	
	always
		#10 CLK = ~CLK;
	
	initial
	begin
		RESET = 1'b1;
		CLK = 1'b0;
		
		#10 RESET = 1'b0;
		#5 RESET = 1'b1;
		#9985 $stop;
	end
	
endmodule
