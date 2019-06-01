/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bubblesort/src/library.v,v 1.4 1997/08/09 05:56:59 jbabb Exp $
 *
 * Library for Bubble Sort Benchmark
 *
 * Authors: Elliot Waingold         (elliotw@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


/*
 BubbleSort_Node is the basic pairwise element comparator.  It 
 outputs the greater of its two inputs to HiOut and the lower of
 the two to LoOut.
 */

module BubbleSort_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
			AIn, BIn, HiOut, LoOut);

   parameter WIDTH = 8;
   

   /* global connections */

   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* local connections */

   input [WIDTH-1:0]		AIn, BIn;
   output [WIDTH-1:0]		HiOut, LoOut;
   wire				Predicate;
      
   assign Predicate = (AIn > BIn) ? 1 : 0;
   assign HiOut = (Predicate) ? AIn : BIn;
   assign LoOut = (Predicate) ? BIn : AIn;
   
endmodule


/*
 BubbleSort_Reg is a pipeline/input register that can be written 
 to from the host interface as well as from its input wires.  It
 also has an enable input that must be high for it to clock data
 in from the inputs.
 */

module BubbleSort_Reg (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		       ScanIn, ScanOut, ScanEnable,
		       Id, Enable, In, Out);

   parameter			 WIDTH = 8, 
				 IDWIDTH = 8,
				 SCAN = 1;

   /* global connections */

   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global connections for scan path (scan = 1) */

   input [WIDTH-1:0]		 ScanIn;
   output [WIDTH-1:0]		 ScanOut;
   input			 ScanEnable;   


   /* local connections */

   input [IDWIDTH-1:0]		Id;
   input			Enable;			
   input [WIDTH-1:0]		In;
   output [WIDTH-1:0]		Out;
   reg [WIDTH-1:0]		Out;


   /* support reading of the node data value (non-scan only) */
   
   assign DataOut[`GlobalDataWidth-1:0] =
      (!SCAN && Addr[IDWIDTH-1:0] == Id) ? Out : `GlobalDataHighZ;


   /* support scan out of the node data value */
   
   assign ScanOut = SCAN ? Out: 0;


   always @(posedge Clk)
      begin


	 /* reset will initialize the register to zero */

	 if (Reset)
	    Out = 0;


	 /* support scan in */
	 
	 else if  (SCAN && ScanEnable)
	    Out = ScanIn[WIDTH-1:0];

	 
	 /* support writing of the node data value (non-scan only) */
	 
	 else if (!SCAN && WR && (Addr[IDWIDTH-1:0] == Id))
	    Out = DataIn[WIDTH-1:0];

	 /* otherwise if enable is high, read in input data */

	 else if (Enable)
	    Out = In;

      end
endmodule


/*
 BubbleSort_Control is the control node.  When a value is written to 
 it by the host, it holds the enable high for that number of clock
 periods.
 */

module BubbleSort_Control(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
			  ScanIn, ScanOut, ScanEnable, ScanId,
			  Id, Enable);

   parameter			 CWIDTH=8, 
				 IDWIDTH=8,
				 WIDTH=8,
				 SCAN=1;


   /* global connections */

   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global connections for scan path (scan = 1) */

   input [IDWIDTH-1:0]		 ScanId;
   input [WIDTH-1:0]		 ScanIn;
   output [WIDTH-1:0]		 ScanOut;
   output			 ScanEnable;   


   /* local connections */

   input [IDWIDTH-1:0]		 Id;
   output			 Enable;
   reg [CWIDTH-1:0]		 count;
   reg [WIDTH-1:0]		 ScanReg;
   

   /* support writing scan input */

   assign ScanEnable=(SCAN && (RD || WR) && Addr[IDWIDTH-1:0]==ScanId);
   assign ScanOut= WR ? DataIn[WIDTH-1:0]: 0;


   /* support reading of the counter and scan output */

   assign DataOut[`GlobalDataWidth-1:0] =
      (Addr[IDWIDTH-1:0] == Id) ? count : 
         (ScanEnable && RD) ? ScanReg: `GlobalDataHighZ;
      
   /* enable when count is active */
   
   assign Enable = !(count==0);

   
   always @(posedge Clk)
      begin

	 
	 /* store current scan output */

	 ScanReg=ScanIn;


	 /* Logic to reset, write, and decrement the counter */
	 
	 if (Reset)
	    count=0;
	 else if (WR && (Addr[IDWIDTH-1:0]==Id))
	    count=DataIn[CWIDTH-1:0];
	 else
	    if(count) 
	       count=count-1;
      end
endmodule
