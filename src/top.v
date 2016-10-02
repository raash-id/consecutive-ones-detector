'timescale 1ns/1ns
module top(inputvals, Muxin, final_sr_out, consec4, SEL, CLK, RST);
	input RST, CLK;
	input[3:0] inputvals;
	output[3:0] Muxin, final_sr_out;
	output[1:0] SEL;
	output consec4;
	wire Output0, Output1, Output2, Output3, Muxout, consec4;
	wire[1:0] SEL;
	wire[3:0] Muxin;
	
	FIFO4 s1(.In(inputvals[0]), .Out(Output0), .CLK(CLK));
	FIFO4 s2(.In(inputvals[1]), .Out(Output1), .CLK(CLK));
	FIFO4 s3(.In(inputvals[2]), .Out(Output2), .CLK(CLK));
	FIFO4 s4(.In(inputvals[3]), .Out(Output3), .CLK(CLK));
	FIFO4_tapped s5(.In(Muxout), .O0(final_sr_out[3]), .O1(final_sr_out[2]), .O2(final_sr_out[1]), .O3(final_sr_out[0]), .consec_out(consec4), .CLK(CLK)); 
	MOD4counter m1(.clk(CLK), .reset(RST), .q(SEL));
	mux4_1 m2(.datain(Muxin), .selectbit(SEL), .dataout(Muxout));
	assign Muxin = {Output3, Output2, Output1, Output0};
endmodule