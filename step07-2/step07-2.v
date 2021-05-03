module Selector_Circuit(TSW1, TSW2, TSW8, LED0);

	input TSW1, TSW2, TSW8;
	output LED0;
	
	assign LED0 = (TSW8 == 1) ? TSW2 : TSW1;

endmodule
