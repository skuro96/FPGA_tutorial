`timescale 1 ns / 1 ns
module TestBench;

	reg RESET, TSW;
	wire [3:0]Q;
	
	SW_Counter Test(.RESET(RESET), .TSW(TSW), .Q(Q));
	
	always
	begin
		#45 TSW = 1'b1;
		#5 TSW = 1'b0;
	end
	
	initial
	begin
		RESET = 1'b1; TSW = 1'b1;

		#10 RESET = 1'b0;
		#5 RESET = 1'b1;
		#9985 $stop;
	end
	
endmodule
