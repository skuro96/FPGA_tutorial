module ON_Circuit(KEY0, LED0);

	input KEY0;
	output LED0;
	
	assign LED0 = ~KEY0;
	
endmodule
