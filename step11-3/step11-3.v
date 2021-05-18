module UpDown_Counter(CLK, RESET, TSW, Q);

	input CLK, RESET;
	input [1:0]TSW;
	output [3:0]Q;
	
	reg [3:0]Q = 0;
	reg [18:0]tmp_count = 0;
	reg [1:0]out, buffer;
	
	always @(posedge CLK or negedge RESET) begin
		if (!RESET) tmp_count <= 0;
		else tmp_count <= tmp_count + 1;
	end
	
	always @(posedge CLK)
		if (tmp_count == 0) out <= TSW;
		
	always @(posedge CLK or negedge RESET) begin
		if (!RESET) buffer <= 0;
		else buffer <= out;
	end
	
	assign inc = out[0] & ~buffer[0];
	assign dec = out[1] & ~buffer[1];
	
	always @(posedge CLK or negedge RESET) begin
		if (!RESET) Q <= 0;
		else if (inc == 1) Q <= (Q == 9 ? 0 : Q + 1);
		else if (dec == 1) Q <= (Q == 0 ? 9 : Q - 1);
	end
	
endmodule
