module Selector_Circuit_3bit(TSWA, TSWB, TSW8, LED);

	input TSW8;
	input [2:0] TSWA, TSWB;
	output [2:0] LED;
	
	assign LED = (TSW8 == 1) ? TSWB : TSWA;
	
endmodule
