`timescale 1ns/1ns
module FIFO4_tapped(In, O0, O1, O2, O3, consec_out, CLK);
	input In, CLK;
	output O0, O1, O2, O3, consec_out;
	wire In, CLK, O0, O1, O2, O3;
	
	DFQD1 FF1(.D(In), .CP(CLK), .Q(O0));
	DFQD1 FF2(.D(O0), .CP(CLK), .Q(O1));
	DFQD1 FF3(.D(O1), .CP(CLK), .Q(O2));
	DFQD1 FF4(.D(O2), .CP(CLK), .Q(O3));
	assign consec_out = O0 && O1 && O2 && O3;
endmodule