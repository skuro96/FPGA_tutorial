module OR_Circuit(TSW1, TSW2, LED0);

	input TSW1, TSW2;
	output LED0;
	
	assign LED0 = TSW1 | TSW2;
	
endmodule
