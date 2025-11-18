
module USR_tb;

	reg			SINL, SINR, clk, rst;
	reg	[3:0]	Din;
	reg	[1:0]	S;
	wire	[3:0]	Dout;
	
	USR i0(SINR, SINL, clk, rst, Din, S, Dout);
	
	always #10 clk = ~clk;
	
	initial begin
		clk = 0; rst = 1; SINL = 0; SINR = 0; S = 2'b00; Din = 4'b0001;
		rst = 0;	#10
		S = 2'b00;	#10
		S = 2'b01; SINR = 1; #10
		S = 2'b10; SINL = 1; #10
		S = 2'b11; Din = 4'b1010; #10;
	end

endmodule 