module MOD4counter ( clk, reset, q );
	output [1:0] q;
	input clk, reset;
	wire   d1, n1;

	DFCNQD1 \q_reg[0]  ( .D(n1), .CP(clk), .CDN(reset), .Q(q[0]) );
	DFCNQD1 \q_reg[1]  ( .D(d1), .CP(clk), .CDN(reset), .Q(q[1]) );
	CKND0 U3 ( .I(q[0]), .ZN(n1) );
	CKXOR2D0 U4 ( .A1(q[1]), .A2(q[0]), .Z(d1) );
endmodule