module Counter_7seg(CLK, RESET, TSW, SEG);

	input CLK, RESET;
	input [1:0] TSW;
	output [7:0] SEG;
	
	reg [3:0] Q = 0;
	reg [18:0] tmp_count = 0;
	reg [1:0] out, buffer;
	reg [7:0] SEG;
	
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
	
	always @(Q) begin
		case(Q)
			4'b0000: SEG <= 8'b0001_0000;
			4'b0001: SEG <= 8'b0001_0001;
			4'b0010: SEG <= 8'b0001_0010;
			4'b0011: SEG <= 8'b0001_0011;
			4'b0100: SEG <= 8'b0001_0100;
			4'b0101: SEG <= 8'b0001_0101;
			4'b0110: SEG <= 8'b0001_0110;
			4'b0111: SEG <= 8'b0001_0111;
			4'b1000: SEG <= 8'b0001_1000;
			4'b1001: SEG <= 8'b0001_1001;
			default: SEG <= 8'b0001_1111;
		endcase
	end
	
endmodule
