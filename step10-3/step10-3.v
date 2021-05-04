module Decimal_Counter(CLK, RESET, Q);

	input CLK, RESET;
	output [3:0] Q;
	
	reg [7:0] Q = 0;
	reg [25:0] cnt = 0;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) cnt <= 0;
//		else if (cnt == 49999999) cnt <= 0;
		else if (cnt == 9999999) cnt <= 0;
		else cnt <= cnt + 1;
	end
	
	assign inc = (cnt == 0) ? 1 : 0;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) Q <= 0;
		else if (inc) begin
			if (Q == 255) Q = 0;
			else Q <= Q + 1;
		end
	end
	
endmodule
