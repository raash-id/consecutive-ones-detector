# Consecutive 1s detector
- A FIFO pipeline based consecutive ones detector, developed in Verilog, using structural data flow model
- Created using custom library consisting self-developed components such as flip-flops and multiplexers
- Module is synthesizable in Synopsys Design Compiler

## Components developed
- Four D flip-flop based FIFO shift register pipeline (FIFO4.v)
- FIFO with outputs of each shift register tapped into an AND gate for consecutive one's detection (FIFO4_tapped.v)
- A 4-to-1 Multiplexer (mux) to randomly choose inputs (mux4_1.v)
- MOD4 counter to select inputs in a sequence from the mux (MOD4Counter.v)
- _top_ module to connect all other modules and build the detector (top.v)
- Verilog based testbench (top_tb.v)

## Language used
- ___Verilog:___ C like HDL is easier to comprehend and saves design time since the syntax is more concise that VHDL

## Tools used
- ___Cadence NCSim:___ To compile and check logic design
- ___Synopsys Design Compiler:___ To obtain the synthesized netlist from the design

## Group members
1. Raashid Ansari – team lead
2. Jonathan Frey – source coder
3. William Nitsch – Testbench Coder

___NOTE:___ Refer to [report](group report_consecutive ones detector.pdf "group report_consecutive ones detector.pdf") for detailed explanation of the project.
