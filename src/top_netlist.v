`timescale 1ns/1ns
module FIFO4_0 ( In, Out, CLK );
  input In, CLK;
  output Out;
  wire   D0, D1, D2;

  DFQD1 FF1 ( .D(In), .CP(CLK), .Q(D0) );
  DFQD1 FF2 ( .D(D0), .CP(CLK), .Q(D1) );
  DFQD1 FF3 ( .D(D1), .CP(CLK), .Q(D2) );
  DFQD1 FF4 ( .D(D2), .CP(CLK), .Q(Out) );
endmodule


module FIFO4_tapped ( In, O0, O1, O2, O3, consec_out, CLK );
  input In, CLK;
  output O0, O1, O2, O3, consec_out;


  DFQD1 FF1 ( .D(In), .CP(CLK), .Q(O0) );
  DFQD1 FF2 ( .D(O0), .CP(CLK), .Q(O1) );
  DFQD1 FF3 ( .D(O1), .CP(CLK), .Q(O2) );
  DFQD1 FF4 ( .D(O2), .CP(CLK), .Q(O3) );
  AN4D0 U1 ( .A1(O3), .A2(O2), .A3(O1), .A4(O0), .Z(consec_out) );
endmodule


module MOD4counter ( clk, reset, q );
  output [1:0] q;
  input clk, reset;
  wire   d1, n1;

  DFCNQD1 \q_reg[0]  ( .D(n1), .CP(clk), .CDN(reset), .Q(q[0]) );
  DFCNQD1 \q_reg[1]  ( .D(d1), .CP(clk), .CDN(reset), .Q(q[1]) );
  CKND0 U3 ( .I(q[0]), .ZN(n1) );
  CKXOR2D0 U4 ( .A1(q[1]), .A2(q[0]), .Z(d1) );
endmodule


module mux4_1 ( datain, selectbit, dataout );
  input [3:0] datain;
  input [1:0] selectbit;
  output dataout;


  MUX4D0 U1 ( .I0(datain[0]), .I1(datain[2]), .I2(datain[1]), .I3(datain[3]), 
        .S0(selectbit[1]), .S1(selectbit[0]), .Z(dataout) );
endmodule


module FIFO4_1 ( In, Out, CLK );
  input In, CLK;
  output Out;
  wire   D0, D1, D2;

  DFQD1 FF1 ( .D(In), .CP(CLK), .Q(D0) );
  DFQD1 FF2 ( .D(D0), .CP(CLK), .Q(D1) );
  DFQD1 FF3 ( .D(D1), .CP(CLK), .Q(D2) );
  DFQD1 FF4 ( .D(D2), .CP(CLK), .Q(Out) );
endmodule


module FIFO4_2 ( In, Out, CLK );
  input In, CLK;
  output Out;
  wire   D0, D1, D2;

  DFQD1 FF1 ( .D(In), .CP(CLK), .Q(D0) );
  DFQD1 FF2 ( .D(D0), .CP(CLK), .Q(D1) );
  DFQD1 FF3 ( .D(D1), .CP(CLK), .Q(D2) );
  DFQD1 FF4 ( .D(D2), .CP(CLK), .Q(Out) );
endmodule


module FIFO4_3 ( In, Out, CLK );
  input In, CLK;
  output Out;
  wire   D0, D1, D2;

  DFQD1 FF1 ( .D(In), .CP(CLK), .Q(D0) );
  DFQD1 FF2 ( .D(D0), .CP(CLK), .Q(D1) );
  DFQD1 FF3 ( .D(D1), .CP(CLK), .Q(D2) );
  DFQD1 FF4 ( .D(D2), .CP(CLK), .Q(Out) );
endmodule


module top_netlist ( inputvals, Muxin, final_sr_out, consec4, SEL, CLK, RST );
  input [3:0] inputvals;
  output [3:0] Muxin;
  output [3:0] final_sr_out;
  output [1:0] SEL;
  input CLK, RST;
  output consec4;
  wire   Muxout;

  FIFO4_0 s1 ( .In(inputvals[0]), .Out(Muxin[0]), .CLK(CLK) );
  FIFO4_3 s2 ( .In(inputvals[1]), .Out(Muxin[1]), .CLK(CLK) );
  FIFO4_2 s3 ( .In(inputvals[2]), .Out(Muxin[2]), .CLK(CLK) );
  FIFO4_1 s4 ( .In(inputvals[3]), .Out(Muxin[3]), .CLK(CLK) );
  FIFO4_tapped s5 ( .In(Muxout), .O0(final_sr_out[3]), .O1(final_sr_out[2]), 
        .O2(final_sr_out[1]), .O3(final_sr_out[0]), .consec_out(consec4), 
        .CLK(CLK) );
  MOD4counter m1 ( .clk(CLK), .reset(RST), .q(SEL) );
  mux4_1 m2 ( .datain(Muxin), .selectbit(SEL), .dataout(Muxout) );
endmodule

