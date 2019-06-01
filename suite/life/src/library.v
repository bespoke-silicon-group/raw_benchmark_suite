/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/life/src/library.v,v 1.5 1997/08/09 21:04:55 jbabb Exp $
 *
 * Library for Life benchmark
 *
 * Authors: Rajeev Kumar Barua      (barua@lcs.mit.edu)
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

// Defines one cell of the game of life program.

module CELL ( DATA_IN, cell_value, Reset, WR, Enable,
                Clk, NEIGHBORS);

   // add a dummy parameter to keep template logic from breaking */
   parameter DUMMY=0;
   
   input       DATA_IN;         // for loading in initial data
   output      cell_value;      // current cell contents
   input       Reset;
   input       WR;              // load cell with DATA_IN data
   input       Enable;          // modify cell based on neighbor cells 
   input       Clk;
   
   input [7:0] NEIGHBORS;       // 8 neighboring values, clockwise from North=0
   
   reg	       cell_value;      // Current value of cell
   
   integer     i, count;


   always @(posedge Clk)
      begin
	 // Reset will initialize the entire array to zero
	 if (Reset)
	    begin
	       cell_value=0;
	    end
	 
	 // Condition to write to node
	 else if (WR)
	    begin
	       cell_value = DATA_IN;
	    end
	 // Condition to do the work              	
	 else if (Enable) begin
	    count = 0;
	    for (i=0; i < 8; i = i + 1) begin
	       count = count + NEIGHBORS[i];
	    end 
	    if (cell_value) begin
	       if ((count != 2) & (count != 3))
		  cell_value = 1'b0;
	    end
	    else
	       if (count == 3)
		  begin
		     cell_value = 1'b1;
		  end
	 end			
      end   
endmodule


/* defines a block GlobalDataWidth bits by 1 bit, 
 * corresp. to one word in host program */

module Life_Block ( Clk, Reset, RD, WR, Addr, DataIn, DataOut, 
		   ScanIn, ScanOut, ScanEnable,
		   Id, Enable, BLOCK_VALUE, 
		   NORTH_EDGE, SOUTH_EDGE, EAST_EDGE, WEST_EDGE,
		   NW_EDGE, SW_EDGE, NE_EDGE, SE_EDGE);
   
   parameter IDWIDTH  = 8,
	     SCAN   = 1;


   /* global connections */

   input			 Clk;
   input			 Reset;
   
   input			 RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;
   

   /* global connections for scan path (scan = 1) */

   input [`GlobalDataWidth-1:0]	 ScanIn;
   output [`GlobalDataWidth-1:0] ScanOut;
   input			 ScanEnable;   



   /* local connections */

   input [IDWIDTH-1:0]     Id;          // This block's id number
   input		     Enable;     // modify cells based on neighbor values
   output [`GlobalDataWidth-1:0] BLOCK_VALUE; // Current value of all cells
   input [`GlobalDataWidth-1:0]  NORTH_EDGE;
   input [`GlobalDataWidth-1:0]  SOUTH_EDGE;
   input		     EAST_EDGE;
   input		     WEST_EDGE;
   input		     NW_EDGE;
   input		     SW_EDGE;
   input		     NE_EDGE;
   input		     SE_EDGE;
   
   
   // Neighbor names to make wiring easier :
   // 8 neighboring values, clockwise from North=n0
   
   wire [`GlobalDataWidth-1:0]    n0;  
   wire [`GlobalDataWidth-1:0]    n1;
   wire [`GlobalDataWidth-1:0]    n2;
   wire [`GlobalDataWidth-1:0]    n3;
   wire [`GlobalDataWidth-1:0]    n4;
   wire [`GlobalDataWidth-1:0]    n5;
   wire [`GlobalDataWidth-1:0]    n6;
   wire [`GlobalDataWidth-1:0]    n7;
   
   wire CELL_WR; // Set when address check succeeds in this block

   wire [`GlobalDataWidth-1:0]	 DIN; // either scan or non-scan input


   // Declaration of `GlobalDataWidth cells

`include "../src/cell_list.v"
   

   // Make wiring connections 

   assign n0[30:1] = NORTH_EDGE[30:1];
   assign n1[30:1] = NORTH_EDGE[29:0];
   assign n2[30:1] = BLOCK_VALUE[29:0];
   assign n3[30:1] = SOUTH_EDGE[29:0];
   assign n4[30:1] = SOUTH_EDGE[30:1];
   assign n5[30:1] = SOUTH_EDGE[31:2];
   assign n6[30:1] = BLOCK_VALUE[31:2];
   assign n7[30:1] = NORTH_EDGE[31:2];
       
   // Two end points, cells 0 and `GlobalDataWidth-1
   assign n0[`GlobalDataWidth-1] = NORTH_EDGE[`GlobalDataWidth-1];
   assign n1[`GlobalDataWidth-1] = NORTH_EDGE[`GlobalDataWidth-2];
   assign n2[`GlobalDataWidth-1] = BLOCK_VALUE[`GlobalDataWidth-2];
   assign n3[`GlobalDataWidth-1] = SOUTH_EDGE[`GlobalDataWidth-2];
   assign n4[`GlobalDataWidth-1] = SOUTH_EDGE[`GlobalDataWidth-1];
   assign n5[`GlobalDataWidth-1] = SW_EDGE;
   assign n6[`GlobalDataWidth-1] = WEST_EDGE;
   assign n7[`GlobalDataWidth-1] = NW_EDGE;
      
   assign n0[0] = NORTH_EDGE[0];
   assign n1[0] = NE_EDGE;
   assign n2[0] = EAST_EDGE;
   assign n3[0] = SE_EDGE;
   assign n4[0] = SOUTH_EDGE[0];
   assign n5[0] = SOUTH_EDGE[1];
   assign n6[0] = BLOCK_VALUE[1];
   assign n7[0] = NORTH_EDGE[1];


   // For handling writes / scan in

   assign CELL_WR = SCAN ? ScanEnable : WR && (Id==Addr[IDWIDTH-1:0]);
   

   // For handling reads (non-scan only)

   assign DataOut = (!SCAN && Id==Addr[IDWIDTH-1:0]) ? 
      BLOCK_VALUE : `GlobalDataHighZ;
   

   /* support scan out of the node data value */

   assign ScanOut = SCAN ? BLOCK_VALUE: 0;


   // hookup scan path or not:

   assign DIN = SCAN ? ScanIn: DataIn;

endmodule


/* 
  A control module to count iterations. Writing to Address==Id will
  set a counter. The other Life blocks will be enabled by this
  module when count is greater than zero. The counter will decrement
  every cycle down to zero.
*/

module Life_Control (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		       ScanIn, ScanOut, ScanEnable,
		       Id,ScanId,Enable);
   
   parameter WIDTH = 8,
	     CWIDTH = 8,
	     IDWIDTH = 8,
	     SCAN   = 1;

      
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
	 else
	    if(count) 
	       count=count-1;

      end
endmodule
