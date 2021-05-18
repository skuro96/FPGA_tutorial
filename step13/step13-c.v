module Decoder(Q, SEG);

	input [3:0] Q;
	output [7:0] SEG;
	
	reg [7:0] SEG;
	
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
