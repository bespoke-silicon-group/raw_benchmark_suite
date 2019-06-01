/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bheap/src/library.v,v 1.4 1997/08/09 05:56:52 jbabb Exp $
 *
 * Library for Binary Heap Benchmark
 *
 * Authors: Elliot Waingold         (elliotw@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


/*
 * BHeap_Node is the basic three-way compare node (fully combinational)
 */

module BHeap_Node(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		  Enable, P_WR, P_In, P_Out,
		  L_WR, L_In, L_Out, R_WR, R_In, R_Out);
   
   parameter			 WIDTH=8;
   

   /* global connections */
   
   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* local connections */

   input			 Enable;
   output			 P_WR;
   input [WIDTH-1:0]		 P_In;
   output [WIDTH-1:0]		 P_Out;
   output			 L_WR;
   input [WIDTH-1:0]		 L_In;
   output [WIDTH-1:0]		 L_Out;
   output			 R_WR;
   input [WIDTH-1:0]		 R_In;
   output [WIDTH-1:0]		 R_Out;

   assign L_WR = (Enable && (L_In > P_In) && (L_In >= R_In));
   assign R_WR = (Enable && (R_In > P_In) && (R_In > L_In));
   assign P_WR = (L_WR || R_WR);

   assign P_Out = L_WR ? L_In : (R_WR ? R_In : `GlobalDataHighZ);
   assign L_Out = L_WR ? P_In : `GlobalDataHighZ;
   assign R_Out = R_WR ? P_In : `GlobalDataHighZ;

endmodule

/*
 * BHeap_Reg is a register with two inputs and two enables
 */

module BHeap_Reg(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		 ScanIn, ScanOut, ScanEnable,
		 Id, Out, Enable1, Enable2, In1, In2);

   parameter			 WIDTH=8, 
	     IDWIDTH=8,
	     SCAN=1;


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
   
   input [IDWIDTH-1:0]		 Id;
   output [WIDTH-1:0]		 Out;
   reg [WIDTH-1:0]		 Out;
   input			 Enable1;
   input			 Enable2;
   input [WIDTH-1:0]		 In1;
   input [WIDTH-1:0]		 In2;
   
   
   /* support reading of the node data value (non-scan only) */
   
   assign 	DataOut[`GlobalDataWidth-1:0] =
      (!SCAN && Addr[IDWIDTH-1:0] == Id) ? Out : `GlobalDataHighZ;
   
   
   /* support scan out of the node data value */
   
   assign ScanOut = SCAN ? Out: 0;
   
   always @(posedge Clk)
      begin
	 
	 
	 /* reset will initialize the entire array to zero */
	 
	 if (Reset)
	    Out = 0;
	 
	 
	 /* support scan in */
	 
	 else if  (SCAN && ScanEnable)
	    Out = ScanIn[WIDTH-1:0];
	 
	 
	 /* support writing of the node data value (non-scan only) */
	 
	 else if (!SCAN && WR && (Addr[IDWIDTH-1:0] == Id))
	    Out = DataIn[WIDTH-1:0];

	 
	 /* heap operation */
	 
	 else if (Enable1)
	    Out = In1;
	 else if (Enable2)
	    Out = In2;
      end 
endmodule 


/* 
 * BHeap_CtrlReg is a one-bit register used in shifting control from 
 * level to level
 */

module BHeap_CtrlReg(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		     In, Out, Enable);
   
   parameter			 WIDTH=8;

   
   /* global connections */

   input			 Clk, Reset, RD, WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;
   
   
   /* local connections */

   input			 In;
   output			 Out;
   reg				 Out;
   output			 Enable;
   
   assign Enable = Out;
   
   always @(posedge Clk)
      begin
	 if (Reset)
	    Out = 0;
	 else
	    Out = In;
      end
endmodule


/*
 * BHeap_Control is the controller node
 */

module BHeap_Control(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		     ScanIn, ScanOut, ScanEnable, ScanId,
		     Id, Go, Done);

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
   output			 Go;
   reg				 Go;
   input			 Done;


   /* a register for the counter and scan */

   reg [CWIDTH-1:0]		 Count;
   reg [WIDTH-1:0]		 ScanReg;
   

   /* support writing scan input */

   assign ScanEnable=(SCAN && (RD || WR) && Addr[IDWIDTH-1:0]==ScanId);
   assign ScanOut= WR ? DataIn[WIDTH-1:0]: 0;


   /* support reading of the counter and scan output */

   assign DataOut[`GlobalDataWidth-1:0] =
      (Addr[IDWIDTH-1:0] == Id) ? Count : 
         (ScanEnable && RD) ? ScanReg: `GlobalDataHighZ;

   always @(posedge Clk)
      begin
	 ScanReg = ScanIn;

	 Go = 0;
	 if (Reset)
	    begin
	       $display("[%d] resetting\n", Id);     
	       Count = 0;
	       $display("[%d] Count = %d\n", Id, Count);
	    end
	 else if (WR && (Addr[IDWIDTH-1:0] == Id))
	    begin
	       $display("[%d] reading host data\n", Id);
	       Count = DataIn[CWIDTH-1:0];
	       if (Count)
		  Go = 1;
	       $display("[%d] Count = %d, Go = %d\n", Id, Count, Go);
	    end
	 else if (Done)
	    begin
	       $display("[%d] got Done signal\n", Id);
	       Count = Count-1;
	       if (Count)
		  Go = 1;
	       $display("[%d] Count = %d, Go = %d\n", Id, Count, Go);
	    end
      end
endmodule
