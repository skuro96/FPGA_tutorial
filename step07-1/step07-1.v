module Selector_Circuit(TSW1, TSW2, TSW8, LED0);

	input TSW1, TSW2, TSW8;
	output LED0;

	wire c, d;

	assign c = TSW1 & ~TSW8;
	assign d = TSW2 & TSW8;
	assign LED0 = c | d;

endmodule
