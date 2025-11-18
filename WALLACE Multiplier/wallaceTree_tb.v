`timescale 10ns/10ps
module wallaceTree_tb;

	reg [3:0]X,Y;
	wire [7:0]Z;

wallaceTree ga(X,Y,Z);

initial
	begin
	X=4'b0000; Y=4'b0000;
	#10 X=4'b0100; Y=4'b0001;
	#10 X=4'b0100; Y=4'b0001;

	#10 X=4'b0010; Y=4'b0011;

	#10 X=4'b1111; Y=4'b1111;
	#10;
	end
endmodule