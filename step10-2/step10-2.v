module Divide_Clock(CLK, RESET, LED0);

	input CLK, RESET;
	output LED0;
	
	reg LED0 = 0;
	reg [25:0] tmp_count = 0;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) tmp_count <= 0;
		else if (tmp_count == 1000000) tmp_count <= 0;
		else tmp_count <= tmp_count + 1;
	end
	
	assign enable = (tmp_count == 0) ? 1 : 0;
	
	always @(posedge CLK or negedge RESET)
	begin
		if (!RESET) LED0 <= 0;
		else if (enable == 1) LED0 <= ~LED0;
	end
	
endmodule
