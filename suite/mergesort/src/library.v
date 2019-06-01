/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/mergesort/src/library.v,v 1.4 1997/08/09 05:58:00 jbabb Exp $
 *
 * Library for Merge Sort Benchmark
 *
 * Authors: Jang Kim                (jdkim@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"

`define GlobalDataHigh 32'hffffffff

module Merge_Top_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		       ScanIn, ScanOut, ScanEnable, ScanId,
		       Id, In1, In2, Read1, Read2, Out);

   parameter DWIDTH = 32,
	     IDWIDTH = 15,
	     SCAN = 1;
   
   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;

   input [DWIDTH-1:0]		 ScanIn;
   output [DWIDTH-1:0]		 ScanOut;
   output			 ScanEnable;
   input [IDWIDTH-1:0]	         ScanId;

   input [IDWIDTH-1:0]		 Id;
   input [DWIDTH-1:0]		 In1;
   input [DWIDTH-1:0]		 In2;
   output			 Read1, Read2;
   output [DWIDTH-1:0]		 Out;
   reg [DWIDTH-1:0]		 Out;
   
   assign DataOut[`GlobalDataWidth-1:0] = Out;
   assign Read1 = (RD && ((In1 > In2) || &In1));
   assign Read2 = (RD && ((In1 <= In2) || &In2));

   assign ScanEnable=(SCAN && WR);
   assign ScanOut= WR ? DataIn[DWIDTH-1:0]: 0;

   always @(posedge Clk)
      begin
	 if (Reset)
	    Out = `GlobalDataHigh;
	 else if ((&In1) && (&In2))
	    Out = `GlobalDataHigh;
	 else if (RD)
	    if (In1 > In2)
	       Out = In1;
	    else
	       Out = In2;
      end
endmodule


module Merge_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		   Load, Out, In1, In2, Read1, Read2);

   parameter			
      DWIDTH = 32;

   input			Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	Addr;
   input [`GlobalDataWidth-1:0]	DataIn;
   input [`GlobalDataWidth-1:0]	DataOut;   

   input			Load;
   input [DWIDTH-1:0]		In1;
   input [DWIDTH-1:0]		In2;
   output			Read1, Read2;
   output [DWIDTH-1:0]		Out;
   reg [DWIDTH-1:0]		Out;


   /* note: the reads set up long combination paths that will be deterimental
    * to performance for non-virtualwires reconfigurable computer */

   assign Read1 = (Load && ((In1 > In2) || &In1));
   assign Read2 = (Load && ((In1 <= In2) || &In2));
   
always @(posedge Clk)
   begin
	 

	 /* Reset will clear the register. */
	 
	 if (Reset)
	    Out = `GlobalDataHigh;
	 else if ((&In1) && (&In2))
	    Out = `GlobalDataHigh;
	 else if (Load)
	    if (In1 > In2)
	       Out = In1;
	    else
	       Out = In2;
      end
endmodule


module Merge_Low_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		       ScanIn, ScanOut, ScanEnable, 
		       Id, Load, Out);

   parameter DWIDTH = 32,
	     IDWIDTH = 15,
	     SCAN = 1;
   
   input			Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	Addr;
   input [`GlobalDataWidth-1:0]	DataIn;
   input [`GlobalDataWidth-1:0]	DataOut;


   /* global scan connection */

   input [DWIDTH-1:0]		 ScanIn;
   output [DWIDTH-1:0]		 ScanOut;
   input			 ScanEnable;
   
   input [IDWIDTH-1:0]		 Id;
   input			 Load;
   output [DWIDTH-1:0]		 Out;
   reg [DWIDTH-1:0]		 Out;

   assign ScanOut = Out;
   
   always @(posedge Clk)
      begin
	 if (Reset)
	    Out = `GlobalDataHigh;
	 else if (SCAN && ScanEnable)
	    Out = ScanIn;
	 else if (!SCAN && WR && (Addr[IDWIDTH-1:0]==Id))
	    Out = DataIn[DWIDTH-1:0];
	 else if (Load)
	    Out = 0;	 
      end
endmodule
