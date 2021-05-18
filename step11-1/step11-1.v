module SW_Counter(RESET, TSW, Q);

	input RESET, TSW;
	output [3:0]Q;
	
	reg [3:0]Q;
	
	always @(posedge TSW or negedge RESET)
	begin
		if (!RESET) Q <= 0;
		else if (Q == 9) Q <= 0;
		else Q <= Q + 1;
	end
	
endmodule
