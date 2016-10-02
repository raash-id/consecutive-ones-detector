`timescale 1ns/1ns
module top_tb;
    reg CLK, RST;
    wire consec4out;
    reg[3:0] inputvals;
    wire[3:0] mux_input, Finalout;
    wire[1:0] sel_out;
    
//    top u1(.inputvals(inputvals), .Muxin(mux_input), .final_sr_out(Finalout), .consec4(consec4out), .SEL(sel_out), .CLK(CLK), .RST(RST));

    top_netlist u2(.inputvals(inputvals), .Muxin(mux_input), .final_sr_out(Finalout), .consec4(consec4out), .SEL(sel_out), .CLK(CLK), .RST(RST));

    initial begin
		$sdf_annotate("lab4.sdf",u2,,,"MAXIMUM");
		CLK = 1'b0;
		RST = 1'b1;
		#1 RST = 1'b0;
		#1 RST = 1'b1;
		
		//enable below for 1's input
		//  inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};
		//enable below for 0's input
		//inputvals[3:0] = {1'b0, 1'b0, 1'b0, 1'b0};
          
		#1000 $finish;
    end
    
    always begin
		#20 CLK = ~CLK;
    end
    
    always@(posedge CLK) begin
         
		//enable below for 'random' value input
		inputvals[3:0] = {1'b0, 1'b1, 1'b0, 1'b0};
		#16
		#30 inputvals[3:0] = {1'b1, 1'b1, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b1, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b0, 1'b0};
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b0, 1'b1, 1'b1};
		#30	inputvals[3:0] = {1'b1, 1'b0, 1'b0, 1'b0};
		#30	inputvals[3:0] = {1'b0, 1'b0, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b0, 1'b0};   
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b1, 1'b1};
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b1, 1'b0, 1'b1};
		#30	inputvals[3:0] = {1'b0, 1'b0, 1'b1, 1'b0};
		
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};  //begin 1's sequence to test output flag  
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};  
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};      
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};   
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};      
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};  
		
		#30	inputvals[3:0] = {1'b0, 1'b0, 1'b0, 1'b0};  //0's to end test flag
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};  
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};
		#30	inputvals[3:0] = {1'b1, 1'b1, 1'b1, 1'b1};            
    end
endmodule

