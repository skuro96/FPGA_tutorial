module Counter_7seg(CLK, RESET, TSW, SEG);

	input CLK, RESET;
	input [1:0] TSW;
	output [7:0] SEG;
	
	wire [3:0] Q;
	
	UpDown_Counter updown_counter1(.CLK(CLK), .RESET(RESET), .TSW(TSW), .Q(Q));
	Decoder decoder1(.Q(Q), .SEG(SEG));
	
endmodule
