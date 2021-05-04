module Selector_Circuit_4input(SELECTOR, TSW1, TSW2, TSW3, TSW4, LED0);

	input [1:0] SELECTOR;
	input TSW1, TSW2, TSW3, TSW4;
	output LED0;
	
	assign LED0 = 
		(SELECTOR == 2'b00) ? TSW1:
		(SELECTOR == 2'b01) ? TSW2:
		(SELECTOR == 2'b10) ? TSW3:
		(SELECTOR == 2'b11) ? TSW4:
		1'bx;
		
	endmodule
