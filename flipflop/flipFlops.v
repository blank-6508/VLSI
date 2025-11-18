
module flipFlops(
	input S, R, J, K, Din, T, clk, rst,
	output reg Q_SR, Q_JK, Q_D, Q_T
);

	always @(posedge clk or posedge rst) begin
		
		if (rst) begin 
			Q_SR	<=	1'b0;
			Q_JK	<=	1'b0;
			Q_D	<=	1'b0;
			Q_T	<=	1'b0;
		end
		
		else begin 
			Q_SR	<= (Q_SR & ~R) | (S & ~R);
			Q_JK	<=	(J & ~Q_JK) | (~K & Q_JK);
			Q_D	<=	Din;
			Q_T	<= (T ^ Q_T);
		end
	end

endmodule 