
module flipFlops_tb;

	reg S, R, J, K, Din, T, clk, rst;
	wire Q_SR, Q_JK, Q_D, Q_T;
	
	flipFlops i0(S, R, J, K, Din, T, clk, rst, Q_SR, Q_JK, Q_D, Q_T);
	
	initial begin
		clk	<= 0; rst	<= 1;	#10
		clk	<= 1; rst	<= 0; S <= 0; R <= 0; J <= 0; K <= 0; Din <= 0; T <= 0; #20
		S <= 1; R <= 0; J <= 1; K <= 0; Din <= 1; T <= 1; #20
		S <= 0; R <= 1; J <= 0; K <= 1; Din <= 0; T <= 0; #20
		S <= 0; R <= 0; J <= 1; K <= 1; Din <= 1; T <= 1; #20;
	end
	
	always #10 clk = ~clk;
	
endmodule 