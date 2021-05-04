module Counter(CLK, RESET, Q);

	input CLK, RESET;
	output [3:0]Q;
	reg [3:0]Q;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) Q <= 0;
		else Q <= Q + 1;
	end
	
endmodule
