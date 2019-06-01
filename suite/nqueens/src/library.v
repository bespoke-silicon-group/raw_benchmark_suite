/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/nqueens/src/library.v,v 1.4 1997/08/09 05:58:07 jbabb Exp $
 *
 * Library for N Queens benchmark
 *
 * Authors: Matthew Frank           (mfrank@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"

/*
 This is the behavioral verilog library for this benchmark. By
 convention, all module names start with the benchmark name.
 All top-level modules must have the global connections:
 Clk, Reset, RD, WR, Addr, DataIn, DataOut
 Modules may also have any number of local connections or
 sub-modules without restriction.
*/


/* The basic array node */

module NQueens_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		     ScanIn, ScanOut, ScanEnable,
		     Id, CallIn, ReturnIn, ColIn, PDiagIn, NDiagIn,
		     CallOut, ReturnOut, ColOut, PDiagOut, NDiagOut);

   parameter WIDTH = 15,
	     IDWIDTH = 4,
	     SCAN = 1;


   /* global connections */

   input			 Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global connections for scan path (scan = 1) */

   input [IDWIDTH-1:0]		 ScanIn;
   output [IDWIDTH-1:0]		 ScanOut;
   input			 ScanEnable;


   /* local connections */

   input [IDWIDTH-1:0]		 Id;
   input			 CallIn, ReturnIn;
   input [WIDTH-1:0]		 ColIn, PDiagIn, NDiagIn;

   output			 CallOut, ReturnOut;
   output [WIDTH-1:0]		 ColOut, PDiagOut, NDiagOut;
   
   reg [IDWIDTH-1:0]		 MyColumn;
   reg				 CallOut, ReturnOut;

   wire [WIDTH-1:0]		 MyColDecode = (1 << MyColumn);


   /* these should get optimized into wires */
   
   reg [WIDTH-1:0]		 mc;
   reg [IDWIDTH-1:0]		 tempval;

   integer			 i;


   /* support reading of the node data value (SCAN == 0 only) */

   assign DataOut[`GlobalDataWidth-1:0] =
      (!SCAN && Addr[IDWIDTH-1:0] == Id) ? MyColumn : `GlobalDataHighZ;


   /* support scan out of the node data value */

   assign ScanOut = SCAN ? MyColumn: 0;


   /* calculate the unavailable spots for the rows down the line */

   assign ColOut = ColIn | MyColDecode;
   assign PDiagOut = ((PDiagIn | MyColDecode) >> 1);
   assign NDiagOut = ((NDiagIn | MyColDecode) << 1);


   always @(posedge Clk) begin

      if (SCAN && ScanEnable)
	 MyColumn = ScanIn;
      
      if (CallIn) MyColumn = -1;

      tempval = -1;

      for (i = WIDTH - 1; i >= 0; i = i-1) begin
	 mc = 1 << i;
	 
	 if ((i > MyColumn) || CallIn) begin

	    if (((ColIn | PDiagIn | NDiagIn) & mc) == 0) begin
	       tempval = i;
	    end
	 end	 
      end

      if ((CallIn || ReturnIn) && !Reset) begin
	 MyColumn = tempval;

	 if (MyColumn[IDWIDTH-1:0] == ((1 << IDWIDTH) - 1)) begin
	    ReturnOut = 1;
	    CallOut = 0;
	 end
	 else begin
	    ReturnOut = 0;
	    CallOut = 1;
	 end
      end
      else begin
	 ReturnOut = 0;
	 CallOut = 0;
      end      
   end
endmodule



/* 
  A control module to count iterations. Writing to Address==ID will
  set a counter. The other NQueens nodes will be enabled by this
  module when count is greater than zero. The counter will decrement
  every cycle down to zero.
*/

module NQueens_Control (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
			ScanIn, ScanOut, ScanEnable,
			Id, ScanId, CallIn, ReturnIn,
			CallOut);

   parameter IDWIDTH = 4,
	     SCAN = 1;


   /* global connections */

   input			 Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global connections for scan path (scan = 1) */

   input [IDWIDTH-1:0]		 ScanId;
   input [IDWIDTH-1:0]		 ScanIn;
   output [IDWIDTH-1:0]		 ScanOut;
   output			 ScanEnable;

   reg [IDWIDTH-1:0]		 ScanReg;


   /* local connections */

   input [IDWIDTH-1:0]		 Id;
   input			 CallIn, ReturnIn;
   output			 CallOut;


   /* a status register */

   reg [7:0]			 status;


   /* support reading scan output unless reading status*/

   assign ScanEnable=(SCAN && RD && (Addr[IDWIDTH-1:0] != Id));
   assign ScanOut = 0;

   
   /* support reading of the status */   

   assign DataOut[`GlobalDataWidth-1:0] =
      (Addr[IDWIDTH-1:0] == Id) ? status:
      ((ScanEnable && RD) ? ScanReg : `GlobalDataHighZ);


   /* get the top node started */

   assign CallOut = (status == 1);


   /* Logic to reset and change the state */

   always @(posedge Clk) begin
      
      $write("control status: %d\n", status);


      /* store current scan output */

      ScanReg = ScanIn;

      if (Reset) status = 0;	                            // not started
      else if (WR && (Addr[IDWIDTH-1:0] == Id)) status = 1; // start state
      else if (status == 1) status = 2;                     // in progress
      else if ((status == 2) && (CallIn)) status = 3;       // success
      else if ((status == 2) && (ReturnIn)) status = 4;     // failure

   end

endmodule
