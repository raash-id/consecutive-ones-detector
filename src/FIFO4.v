`timescale 1ns/1ns
module FIFO4(In, Out, CLK);
	input In, CLK;
	output Out;
	wire In, CLK, D0, D1, D2, Out;

	DFQD1 FF1(.D(In), .CP(CLK), .Q(D0));
	DFQD1 FF2(.D(D0), .CP(CLK), .Q(D1));
	DFQD1 FF3(.D(D1), .CP(CLK), .Q(D2));
	DFQD1 FF4(.D(D2), .CP(CLK), .Q(Out));
endmodule