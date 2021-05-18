module SW_Counter(CLK, RESET, TSW, Q);

	input CLK, RESET, TSW;
	output [3:0]Q;
	
	reg [3:0]Q = 0;
	reg [18:0]tmp_count = 0;
	reg out, buffer;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) tmp_count <= 0;
		else tmp_count <= tmp_count + 1;
	end
	
	
	always @(posedge CLK)
		if (tmp_count == 0) out <= TSW;
	
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) buffer <= 0;
		else buffer <= out;
	end
	
	
	assign inc = out & ~buffer;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) Q <= 0;
		else if (inc == 1) begin
			if (Q == 9) Q = 0;
			else Q <= Q + 1;
		end
	end

endmodule
