module mux4_1 ( datain, selectbit, dataout );
	input [3:0] datain;
	input [1:0] selectbit;
	output dataout;
	
	MUX4D0 U1 ( .I0(datain[0]), .I1(datain[2]), .I2(datain[1]), .I3(datain[3]), .S0(selectbit[1]), .S1(selectbit[0]), .Z(dataout) );
endmodule