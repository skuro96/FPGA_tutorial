module SW_Matrix(CLK, RESET, COLMN, SW, LED);

	input CLK, RESET;
	input [3:0] SW;
	
	output [3:0] COLMN;
	output [4:0] LED;
	
	reg [3:0] COLMN;
	reg [4:0] LED;
	reg [1:0] count = 0;
	
	reg [1:0] tmp_count = 0;
	
	always @(posedge CLK)
		tmp_count <= (tmp_count == 3 ? 0 : tmp_count + 1);
		
	assign Enable = (tmp_count == 0 ? 1 : 0);
	
	always @(posedge CLK)
		if (Enable == 1) count <= count + 1;
		
	always @(posedge CLK) begin
		if (Enable == 1) begin
			case (count)
				2'b00: COLMN <= 4'b1000;
				2'b01: COLMN <= 4'b0100;
				2'b10: COLMN <= 4'b0010;
				2'b11: COLMN <= 4'b0001;
			endcase
		end
	end
	
	always @(posedge CLK or negedge RESET) begin
		if (!RESET) LED <= 0;
		else if (Enable == 1) begin
			if (COLMN == 4'b1000) begin
				case (SW)
					4'b1000: LED <= 1;
					4'b0100: LED <= 5;
					4'b0010: LED <= 9;
					4'b0001: LED <= 13;
				endcase
			end
			else if (COLMN == 4'b0100) begin
				case (SW)
					4'b1000: LED <= 2;
					4'b0100: LED <= 6;
					4'b0010: LED <= 10;
					4'b0001: LED <= 14;
				endcase
			end
			else if (COLMN == 4'b0010) begin
				case (SW)
					4'b1000: LED <= 3;
					4'b0100: LED <= 7;
					4'b0010: LED <= 11;
					4'b0001: LED <= 15;
				endcase
			end
			else if (COLMN == 4'b0001) begin
				case (SW)
					4'b1000: LED <= 4;
					4'b0100: LED <= 8;
					4'b0010: LED <= 12;
					4'b0001: LED <= 16;
				endcase
			end
		end
	end
	
endmodule
