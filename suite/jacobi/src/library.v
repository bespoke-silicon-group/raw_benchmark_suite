/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/jacobi/src/library.v,v 1.5 1997/08/09 05:57:41 jbabb Exp $
 *
 * Library for Jacobi benchmark
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


/*
 * This is the behavioral verilog library for this benchmark.
 * By convention, all module names start with the benchmark name.
 * All top-level modules must have the global connections:
 *   Clk, Reset, RD, WR, Addr, DataIn, DataOut
 * Modules may also have any number of local connections or
 * sub-modules without restriction.
 *
 */


/* The basic array node */

module Jacobi_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		    ScanIn, ScanOut, ScanEnable,
		    Id, Enable, NorthIn, SouthIn, EastIn, WestIn, Out);
   
   parameter WIDTH    = 8,
	     IDWIDTH  = 8,
	     BOUNDARY = 0,
	     SCAN     = 1;
   
   
   /* global connections */
   
   input			 Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global connections for scan path (scan = 1) */

   input [WIDTH-1:0]		 ScanIn;
   output [WIDTH-1:0]		 ScanOut;
   input			 ScanEnable;   


   /* local connections */
   
   input			 Enable;
   input [IDWIDTH-1:0]		 Id;
   input [WIDTH-1:0]		 NorthIn,SouthIn,EastIn,WestIn;
   output [WIDTH-1:0]		 Out;
   
   reg [WIDTH-1:0]		 Out;
   
   
   /* support reading of the node data value (non-scan only) */
   
   assign DataOut[`GlobalDataWidth-1:0] =
      (!SCAN && Addr[IDWIDTH-1:0] == Id) ? Out: `GlobalDataHighZ;


   /* support scan out of the node data value */

   assign ScanOut = SCAN ? Out: 0;

   
   always @(posedge Clk)
      begin	

	 
	 /* reset will initialize the entire array to zero */
	 
	 if (Reset)
	    Out=0;	 


	 /* support scan in */

	 else if (SCAN && ScanEnable)
	    Out=ScanIn[WIDTH-1:0];
	 

	 /* support writing of the node data value (non-scan only) */
	 
	 else if (!SCAN && WR && (Addr[IDWIDTH-1:0]==Id))
	    Out=DataIn[WIDTH-1:0];
	 

	 /* for non-boundary nodes, do the Jacobi computation when enabled */
	 
	 else if (!BOUNDARY && Enable)
	    Out=(NorthIn+SouthIn+EastIn+WestIn) >> 2;

      end
endmodule


/* 
 * A control module to count iterations.
 *
 * Writing to Address==ID will set a counter.
 *
 * The other Jacobi nodes will be enabled by this module when 
 * count is greater than zero.
 *
 * The counter will decrement every cycle down to zero.
 *
 * This module also handles scan control.
 */

module Jacobi_Control (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		       ScanIn, ScanOut, ScanEnable,
		       Id,ScanId,Enable);
   
   parameter WIDTH   = 8,
	     CWIDTH  = 8,
	     IDWIDTH = 8,
	     SCAN    = 1;
   
   
   /* global connections */
   
   input			 Clk,Reset,RD,WR;
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
   
   
   /* a register for the counter and scan */

   reg [CWIDTH-1:0]		 count;
   reg [WIDTH-1:0]		 ScanReg;

   
   /* support writing scan input */

   assign ScanEnable=(SCAN && (RD || WR) && Addr[IDWIDTH-1:0]==ScanId);
   assign ScanOut= WR ? DataIn[WIDTH-1:0]: 0;


   /* support reading of the counter and scan output */

   assign DataOut[`GlobalDataWidth-1:0] =
      (Addr[IDWIDTH-1:0] == Id) ? count:
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
	 else if(count) 
	    count=count-1;
      end
endmodule
