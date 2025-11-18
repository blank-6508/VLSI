
module USR(
	input					SINR, SINL, clk, rst,
	input 		[3:0]	Din,
	input			[1:0] S,
	output reg	[3:0]	Dout
);

	always @(posedge clk or posedge rst) begin
		if (rst)
			Dout	<= 4'b0000;
		else begin
			case(S)
				2'b00: Dout	<= Dout;
				2'b01: Dout	<= {SINR, Dout[3:1]};
				2'b10: Dout	<= {Dout[2:0], SINL};
				2'b11: Dout	<= Din;
			endcase
		end
	end
endmodule 