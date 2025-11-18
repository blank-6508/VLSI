module wallaceTree(X, Y, Z, Ca);
	input [3:0] X, Y;
	output [7:0] Z;
	output [4:0] Ca;
	
	wire [15:0] PP;
	wire [5:0] S, C;
	
	and a0(PP[0], X[0], Y[0]);
	and a1(PP[1], X[1], Y[0]);
	and a2(PP[2], X[2], Y[0]);
	and a3(PP[3], X[3], Y[0]);
	and a4(PP[4], X[0], Y[1]);
	and a5(PP[5], X[1], Y[1]);
	and a6(PP[6], X[2], Y[1]);
	and a7(PP[7], X[3], Y[1]);
	and a8(PP[8], X[0], Y[2]);
	and a9(PP[9], X[1], Y[2]);
	and a10(PP[10], X[2], Y[2]);
	and a11(PP[11], X[3], Y[2]);
	and a12(PP[12], X[0], Y[3]);
	and a13(PP[13], X[1], Y[3]);
	and a14(PP[14], X[2], Y[3]);
	and a15(PP[15], X[3], Y[3]);

	halfAdder ha0(PP[10], PP[13], S[0], C[0]);
	halfAdder ha1(PP[9], PP[12], S[1], C[1]);
	halfAdder ha3(PP[5], PP[8], S[2], C[2]);
	
	fullAdder fa0(PP[11], PP[14], C[0], S[3], C[3]);
	fullAdder fa1(PP[7], S[0], C[1], S[4], C[4]);
	fullAdder fa3(PP[6], PP[3], S[1], S[5], C[5]);
	
	halfAdder ha4(PP[4], PP[1], Z[1], Ca[0]);
	fullAdder fa4(S[2], PP[2], Ca[0], Z[2], Ca[1]);
	fullAdder fa5(S[5], C[2], Ca[1], Z[3], Ca[2]);
	fullAdder fa6(S[4], C[5], Ca[2], Z[4], Ca[3]);
	fullAdder fa7(S[3], C[4], Ca[3], Z[5], Ca[4]);
	fullAdder fa8(C[3], Ca[4], PP[15], Z[6], Z[7]);
	
	assign Z[0] = PP[0];
endmodule