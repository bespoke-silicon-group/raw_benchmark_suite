/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/des/src/library.v,v 1.5 1997/08/09 05:57:07 jbabb Exp $
 *
 * Library for DES benchmark
 *
 * Authors: Victor W. K. Lee        (wklee@lcs.mit.edu)
 *           Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


// This is the behavioral verilog library for the DES benchmark.  
// By convention, all module names start with the benchmark name.
// All top-level modules must have the global connections:
//    Clk, Reset, RD, WR, Addr, DataIn, DataOut
// Modules may also have any number of local connections or
// sub-modules without restriction.


`define DATA    0
`define DATA_LO 0
`define DATA_HI 1
`define KEY     1
`define START   2
`define STATUS  3


module DES_Node (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		 ScanIn, ScanOut, ScanEnable, 
		 Id, key, start, rdy);

   parameter WIDTH = 64,
	     MEMSPACE = 2,
	     IDWIDTH = 8,
	     SCAN = 1;
   

   /* global connections */

   input			 Clk;
   input			 Reset;
   input			 RD;
   input			 WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global scan connection */

   input [`GlobalDataWidth-1:0]	 ScanIn;
   output [`GlobalDataWidth-1:0] ScanOut;
   input			 ScanEnable;
			 

   /* local connections */

   input [IDWIDTH-1:0]		 Id;
   input [WIDTH-1:0]		 key;
   input			 start;
   output			 rdy;
   

   /* local data structure */

   wire				 rdy;
   wire				 IdEnable;
   wire [63:0]			 out;

   reg [63:0]			 x;
   reg				 startflag;
				 
   
   /* Output Assignments */

   assign IdEnable = (!SCAN && Addr[MEMSPACE+IDWIDTH-1:MEMSPACE] == Id);

   assign DataOut[`GlobalDataWidth-1:0] = 
      (!SCAN && RD && IdEnable) ? x[31:0] : `GlobalDataHighZ;
   
   assign ScanOut = SCAN ? x[31:0] : 0;


   /* Calling the DES module */
   
   DES_ECB #(1) des_module (Clk, Reset, start, x, key, out, rdy);


   /* The main control loop */

   always @(posedge Clk)
      begin


	 /* logic to copy result back to x when done */

	 if(Reset)
	    startflag=0;

	 else if (start)
	    startflag=1;	 

	 else if (startflag && rdy)
	    begin
	       startflag=0;	       
	       x = out;
	    end

	 
	 if (SCAN && ScanEnable)
	    x = {ScanIn,x[63:32]};
	 
	 else if (!SCAN && WR && IdEnable)
	    x = {DataIn,x[63:32]};

	 else if (!SCAN && RD && IdEnable)
	    x[31:0]=x[63:32];

      end
   
endmodule


module DES_Control (Clk, Reset, RD, WR, Addr, DataIn, DataOut,
		    ScanIn, ScanOut, ScanEnable, ScanId, 
		    Id, key, start, rdy);

   parameter			 WIDTH = 64,
	     MEMSPACE = 2,
	     IDWIDTH = 8,
	     SCAN = 1;
   
   
   /* global connections */

   input			 Clk;
   input			 Reset;
   input			 RD;
   input			 WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;


   /* global scan input */

   input [IDWIDTH-1:0]		 ScanId;
   input [`GlobalDataWidth-1:0]	 ScanIn;
   output [`GlobalDataWidth-1:0] ScanOut;
   output			 ScanEnable;
   
   reg [`GlobalDataWidth-1:0]	 ScanReg;

   
   /* local connections */

   input [IDWIDTH-1:0]		 Id;
   output [WIDTH-1:0]		 key;
   reg [WIDTH-1:0]		 key;
   output			 start;
   input			 rdy;
   wire				 IdEnable;

   
   assign IdEnable = (Addr[MEMSPACE+IDWIDTH-1:MEMSPACE] == Id);
   
   assign ScanEnable = (SCAN && (RD || WR) &&
			(Addr[MEMSPACE+IDWIDTH-1:MEMSPACE] == ScanId));


   /* support writing scan input */

   assign ScanOut = WR ? DataIn[31:0] : 0;


   /* support reading of the status and scan output */

   assign DataOut[`GlobalDataWidth-1:0] =
      (IdEnable && (Addr[MEMSPACE-1:0] == `STATUS)) ? rdy : 
      (ScanEnable && RD) ? ScanReg: `GlobalDataHighZ;
      
   
   /* start signal */
   
   assign start = (WR && IdEnable && (Addr[MEMSPACE-1:0] == `START));
   
   
   always @(posedge Clk)
      begin
	 ScanReg = ScanIn;

	 
	 /* write key */

	 if (WR && IdEnable && (Addr[MEMSPACE-1:0] == `KEY))
	    key = {DataIn,key[63:32]};	       
      end
   
endmodule


// The DES encryption for DES benchmark.  It performs the simpliest
// DES encryption.  The inputs are: Clk, Reset, Start, X, KEY, OUT, RDY
//
//  -> Clk is the usual clock connection.  This module takes 16 clock
//     cycles to run.
//  -> Reset resets the internal registers.
//  -> Start triggers the circuit to start.
//  -> X is the 64-bit data to be encrypted.
//  -> KEY is the 64-bit key to be used.
//  <- OUT is the 64-bit output of the encryption result.
//  <- RDY is a one bit status.  1 = ready, 0 = busy.
//
// Author: Victor Lee
// Verison: 1.0 Initial version only cover encryption. 1/28/97
//

module DES_ECB (Clk, Reset, Start, X, KEY, OUT, RDY);

   parameter	 dummy = 1;
   

   /* Communication signals */

   input	 Clk;
   input	 Reset;
   input	 Start;
   input [63:0]	 X, KEY;
   output [63:0] OUT;
   output	 RDY;
	 

   /* Internal Registers */

   reg [5:0]	 i;
   reg [47:0]	 ikey;
   reg [63:0]	 temp;
   reg [63:0]	 OUT;

   assign RDY = (i==16);
         
   always @(posedge Clk)
      begin
	 if (Reset)
	    i = 16;
	 
	 else if (Start)
	    begin
	       i = 0;
 	       temp = IP(X);
	    end
	 
	 else if (i != 16)
	    begin
	       ikey = gen_key (KEY,i);
	       temp = DES_ECB_KERN(temp, ikey);
	       i = i + 1;
	    end
 
	 OUT = IIP({temp[31:0],temp[63:32]});
      end

   
   /* Includes the internal functions */

   function [63:0] IP;
   
      input [63:0] X;
   
      reg [31:0]   L, R;
   
   begin
      L = {X[64-58], X[64-50], X[64-42], X[64-34],
	   X[64-26], X[64-18], X[64-10], X[64-2],
	   X[64-60], X[64-52], X[64-44], X[64-36],
	   X[64-28], X[64-20], X[64-12], X[64-4],
	   X[64-62], X[64-54], X[64-46], X[64-38],
	   X[64-30], X[64-22], X[64-14], X[64-6],
	   X[64-64], X[64-56], X[64-48], X[64-40],
	   X[64-32], X[64-24], X[64-16], X[64-8]};
      
      R = {X[64-57], X[64-49], X[64-41], X[64-33],
	   X[64-25], X[64-17], X[64-9], X[64-1],
	   X[64-59], X[64-51], X[64-43], X[64-35],
	   X[64-27], X[64-19], X[64-11], X[64-3],
	   X[64-61], X[64-53], X[64-45], X[64-37],
	   X[64-29], X[64-21], X[64-13], X[64-5],
	   X[64-63], X[64-55], X[64-47], X[64-39],
	   X[64-31], X[64-23], X[64-15], X[64-7]};
      
      IP = {L,R};
      
   end
   
   endfunction

   function [63:0] IIP;
   
      input [63:0] LR;
   
   begin
      IIP = { LR[64-40],LR[64-8],LR[64-48],LR[64-16],LR[64-56],LR[64-24],LR[64-64],LR[64-32],
	      LR[64-39],LR[64-7],LR[64-47],LR[64-15],LR[64-55],LR[64-23],LR[64-63],LR[64-31],
	      LR[64-38],LR[64-6],LR[64-46],LR[64-14],LR[64-54],LR[64-22],LR[64-62],LR[64-30],
	      LR[64-37],LR[64-5],LR[64-45],LR[64-13],LR[64-53],LR[64-21],LR[64-61],LR[64-29],
	      LR[64-36],LR[64-4],LR[64-44],LR[64-12],LR[64-52],LR[64-20],LR[64-60],LR[64-28],
	      LR[64-35],LR[64-3],LR[64-43],LR[64-11],LR[64-51],LR[64-19],LR[64-59],LR[64-27],
	      LR[64-34],LR[64-2],LR[64-42],LR[64-10],LR[64-50],LR[64-18],LR[64-58],LR[64-26],
	      LR[64-33],LR[64-1],LR[64-41],LR[64-9],LR[64-49],LR[64-17],LR[64-57],LR[64-25] };
   end
   
   endfunction
   
   function [63:0] DES_ECB_KERN;
   
      input [63:0] LR;
      input [47:0] KEY;
   
      reg [31:0]   L, Li, R, Ri;
      reg [47:0]   e, tau;
      reg [3:0]	   so1, so2, so3, so4, so5, so6, so7, so8;
      reg [31:0]   tp, t;

   begin
      L = LR [63:32];
      R = LR [31:0];
      
      e = {   R[32-32],R[32-1], R[32-2], R[32-3], R[32-4], R[32-5],
	      R[32-4], R[32-5], R[32-6], R[32-7], R[32-8], R[32-9],
	      R[32-8], R[32-9], R[32-10],R[32-11],R[32-12],R[32-13],
	      R[32-12],R[32-13],R[32-14],R[32-15],R[32-16],R[32-17],
	      R[32-16],R[32-17],R[32-18],R[32-19],R[32-20],R[32-21],
	      R[32-20],R[32-21],R[32-22],R[32-23],R[32-24],R[32-25],
	      R[32-24],R[32-25],R[32-26],R[32-27],R[32-28],R[32-29],
	      R[32-28],R[32-29],R[32-30],R[32-31],R[32-32],R[32-1] };

      tau = e ^ KEY;
      
      so1 = S1(tau[47:42]);
      so2 = S2(tau[41:36]);
      so3 = S3(tau[35:30]);
      so4 = S4(tau[29:24]);
      so5 = S5(tau[23:18]);
      so6 = S6(tau[17:12]);
      so7 = S7(tau[11:6]);
      so8 = S8(tau[5:0]);
      /*
       so1 = S1(({R[32-32],R[32-1],R[32-2],R[32-3],R[32-4],R[32-5]}^KEY[47:42]));
       so2 = S2(({R[32-4],R[32-5],R[32-6],R[32-7],R[32-8],R[32-9]}^KEY[41:36]));
       so3 = S3(({R[32-8],R[32-9],R[32-10],R[32-11],R[32-12],R[32-13]}^KEY[35:30]));
       so4 = S4(({R[32-12],R[32-13],R[32-14],R[32-15],R[32-16],R[32-17]}^KEY[29:24]));
       so5 = S5(({R[32-16],R[32-17],R[32-18],R[32-19],R[32-20],R[32-21]}^KEY[23:18]));
       so6 = S6(({R[32-20],R[32-21],R[32-22],R[32-23],R[32-24],R[32-25]}^KEY[17:12]));
       so7 = S7(({R[32-24],R[32-25],R[32-26],R[32-27],R[32-28],R[32-29]}^KEY[11:6]));
       so8 = S8(({R[32-28],R[32-9],R[32-30],R[32-31],R[32-32],R[32-1]}^KEY[5:0]));
       */
      t = {so1, so2, so3, so4, so5, so6, so7, so8};
      tp = PermP(t);
      //	Ri = L ^ PermP(t);
      Ri = L ^ tp;
      Li = R;
      
      DES_ECB_KERN = {Li,Ri};

   end
   
   endfunction
   
   function [47:0] gen_key;
   
      input [63:0] KEY;
      input [3:0]  SEQ;

   begin
      case (SEQ)
	
	0: gen_key = {KEY[64-10], KEY[64-51], KEY[64-34], KEY[64-60], 
		      KEY[64-49], KEY[64-17], KEY[64-33], KEY[64-57], 
		      KEY[64-2], KEY[64-9], KEY[64-19], KEY[64-42],
		      KEY[64-3], KEY[64-35], KEY[64-26], KEY[64-25], 
		      KEY[64-44], KEY[64-58], KEY[64-59], KEY[64-1], 
		      KEY[64-36], KEY[64-27], KEY[64-18], KEY[64-41],
		      KEY[64-22], KEY[64-28], KEY[64-39], KEY[64-54], 
		      KEY[64-37], KEY[64-4], KEY[64-47], KEY[64-30], 
		      KEY[64-5], KEY[64-53], KEY[64-23], KEY[64-29],
		      KEY[64-61], KEY[64-21], KEY[64-38], KEY[64-63], 
		      KEY[64-15], KEY[64-20], KEY[64-45], KEY[64-14], 
		      KEY[64-13], KEY[64-62], KEY[64-55], KEY[64-31]};

	1: gen_key = {KEY[64-2], KEY[64-43], KEY[64-26], KEY[64-52], 
		      KEY[64-41], KEY[64-9], KEY[64-25], KEY[64-49], 
		      KEY[64-59], KEY[64-1], KEY[64-11], KEY[64-34],
		      KEY[64-60], KEY[64-27], KEY[64-18], KEY[64-17],
		      KEY[64-36], KEY[64-50], KEY[64-51], KEY[64-58], 
		      KEY[64-57], KEY[64-19], KEY[64-10], KEY[64-33],
		      KEY[64-14], KEY[64-20], KEY[64-31], KEY[64-46],
		      KEY[64-29], KEY[64-63], KEY[64-39], KEY[64-22], 
		      KEY[64-28], KEY[64-45], KEY[64-15], KEY[64-21],
		      KEY[64-53], KEY[64-13], KEY[64-30], KEY[64-55],
		      KEY[64-7], KEY[64-12], KEY[64-37], KEY[64-6], 
		      KEY[64-5], KEY[64-54], KEY[64-47], KEY[64-23]};
	
	2: gen_key = {KEY[64-51], KEY[64-27], KEY[64-10], KEY[64-36], 
		      KEY[64-25], KEY[64-58], KEY[64-9], KEY[64-33], 
		      KEY[64-43], KEY[64-50], KEY[64-60], KEY[64-18],
		      KEY[64-44], KEY[64-11], KEY[64-2], KEY[64-1],
		      KEY[64-49], KEY[64-34], KEY[64-35], KEY[64-42], 
		      KEY[64-41], KEY[64-3], KEY[64-59], KEY[64-17],
		      KEY[64-61], KEY[64-4], KEY[64-15], KEY[64-30],
		      KEY[64-13], KEY[64-47], KEY[64-23], KEY[64-6], 
		      KEY[64-12], KEY[64-29], KEY[64-62], KEY[64-5],
		      KEY[64-37], KEY[64-28], KEY[64-14], KEY[64-39],
		      KEY[64-54], KEY[64-63], KEY[64-21], KEY[64-53], 
		      KEY[64-20], KEY[64-38], KEY[64-31], KEY[64-7]};
	
	3: gen_key = {KEY[64-35], KEY[64-11], KEY[64-59], KEY[64-49], 
		      KEY[64-9], KEY[64-42], KEY[64-58], KEY[64-17], 
		      KEY[64-27], KEY[64-34], KEY[64-44], KEY[64-2],
		      KEY[64-57], KEY[64-60], KEY[64-51], KEY[64-50],
		      KEY[64-33], KEY[64-18], KEY[64-19], KEY[64-26], 
		      KEY[64-25], KEY[64-52], KEY[64-43], KEY[64-1],
		      KEY[64-45], KEY[64-55], KEY[64-62], KEY[64-14],
		      KEY[64-28], KEY[64-31], KEY[64-7], KEY[64-53], 
		      KEY[64-63], KEY[64-13], KEY[64-46], KEY[64-20],
		      KEY[64-21], KEY[64-12], KEY[64-61], KEY[64-23],
		      KEY[64-38], KEY[64-47], KEY[64-5], KEY[64-37], 
		      KEY[64-4], KEY[64-22], KEY[64-15], KEY[64-54]};
	
	4: gen_key = {KEY[64-19], KEY[64-60], KEY[64-43], KEY[64-33], 
		      KEY[64-58], KEY[64-26], KEY[64-42], KEY[64-1], 
		      KEY[64-11], KEY[64-18], KEY[64-57], KEY[64-51],
		      KEY[64-41], KEY[64-44], KEY[64-35], KEY[64-34],
		      KEY[64-17], KEY[64-2], KEY[64-3], KEY[64-10], 
		      KEY[64-9], KEY[64-36], KEY[64-27], KEY[64-50],
		      KEY[64-29], KEY[64-39], KEY[64-46], KEY[64-61],
		      KEY[64-12], KEY[64-15], KEY[64-54], KEY[64-37], 
		      KEY[64-47], KEY[64-28], KEY[64-30], KEY[64-4],
		      KEY[64-5], KEY[64-63], KEY[64-45], KEY[64-7],
		      KEY[64-22], KEY[64-31], KEY[64-20], KEY[64-21], 
		      KEY[64-55], KEY[64-6], KEY[64-62], KEY[64-38]};

	5: gen_key = {KEY[64-3], KEY[64-44], KEY[64-27], KEY[64-17], 
		      KEY[64-42], KEY[64-10], KEY[64-26], KEY[64-50], 
		      KEY[64-60], KEY[64-2], KEY[64-41], KEY[64-35],
		      KEY[64-25], KEY[64-57], KEY[64-19], KEY[64-18],
		      KEY[64-1], KEY[64-51], KEY[64-52], KEY[64-59], 
		      KEY[64-58], KEY[64-49], KEY[64-11], KEY[64-34],
		      KEY[64-13], KEY[64-23], KEY[64-30], KEY[64-45],
		      KEY[64-63], KEY[64-62], KEY[64-38], KEY[64-21], 
		      KEY[64-31], KEY[64-12], KEY[64-14], KEY[64-55],
		      KEY[64-20], KEY[64-47], KEY[64-29], KEY[64-54],
		      KEY[64-6], KEY[64-15], KEY[64-4], KEY[64-5], 
		      KEY[64-39], KEY[64-53], KEY[64-46], KEY[64-22]};
	
	6: gen_key = {KEY[64-52], KEY[64-57], KEY[64-11], KEY[64-1], 
		      KEY[64-26], KEY[64-59], KEY[64-10], KEY[64-34], 
		      KEY[64-44], KEY[64-51], KEY[64-25], KEY[64-19],
		      KEY[64-9], KEY[64-41], KEY[64-3], KEY[64-2],
		      KEY[64-50], KEY[64-35], KEY[64-36], KEY[64-43], 
		      KEY[64-42], KEY[64-33], KEY[64-60], KEY[64-18],
		      KEY[64-28], KEY[64-7], KEY[64-14], KEY[64-29],
		      KEY[64-47], KEY[64-46], KEY[64-22], KEY[64-5], 
		      KEY[64-15], KEY[64-63], KEY[64-61], KEY[64-39],
		      KEY[64-4], KEY[64-31], KEY[64-13], KEY[64-38],
		      KEY[64-53], KEY[64-62], KEY[64-55], KEY[64-20], 
		      KEY[64-23], KEY[64-37], KEY[64-30], KEY[64-6]};
	
	7: gen_key = {KEY[64-36], KEY[64-41], KEY[64-60], KEY[64-50], 
		      KEY[64-10], KEY[64-43], KEY[64-59], KEY[64-18], 
		      KEY[64-57], KEY[64-35], KEY[64-9], KEY[64-3],
		      KEY[64-58], KEY[64-25], KEY[64-52], KEY[64-51],
		      KEY[64-34], KEY[64-19], KEY[64-49], KEY[64-27], 
		      KEY[64-26], KEY[64-17], KEY[64-44], KEY[64-2],
		      KEY[64-12], KEY[64-54], KEY[64-61], KEY[64-13],
		      KEY[64-31], KEY[64-30], KEY[64-6], KEY[64-20], 
		      KEY[64-62], KEY[64-47], KEY[64-45], KEY[64-23],
		      KEY[64-55], KEY[64-15], KEY[64-28], KEY[64-22],
		      KEY[64-37], KEY[64-46], KEY[64-39], KEY[64-4], 
		      KEY[64-7], KEY[64-21], KEY[64-14], KEY[64-53]};

	8: gen_key = {KEY[64-57], KEY[64-33], KEY[64-52], KEY[64-42], 
		      KEY[64-2], KEY[64-35], KEY[64-51], KEY[64-10], 
		      KEY[64-49], KEY[64-27], KEY[64-1], KEY[64-60],
		      KEY[64-50], KEY[64-17], KEY[64-44], KEY[64-43],
		      KEY[64-26], KEY[64-11], KEY[64-41], KEY[64-19], 
		      KEY[64-18], KEY[64-9], KEY[64-36], KEY[64-59],
		      KEY[64-4], KEY[64-46], KEY[64-53], KEY[64-5],
		      KEY[64-23], KEY[64-22], KEY[64-61], KEY[64-12], 
		      KEY[64-54], KEY[64-39], KEY[64-37], KEY[64-15],
		      KEY[64-47], KEY[64-7], KEY[64-20], KEY[64-14],
		      KEY[64-29], KEY[64-38], KEY[64-31], KEY[64-63], 
		      KEY[64-62], KEY[64-13], KEY[64-6], KEY[64-45]};
	
	9: gen_key = {KEY[64-41], KEY[64-17], KEY[64-36], KEY[64-26], 
		      KEY[64-51], KEY[64-19], KEY[64-35], KEY[64-59], 
		      KEY[64-33], KEY[64-11], KEY[64-50], KEY[64-44],
		      KEY[64-34], KEY[64-1], KEY[64-57], KEY[64-27],
		      KEY[64-10], KEY[64-60], KEY[64-25], KEY[64-3], 
		      KEY[64-2], KEY[64-58], KEY[64-49], KEY[64-43],
		      KEY[64-55], KEY[64-30], KEY[64-37], KEY[64-20],
		      KEY[64-7], KEY[64-6], KEY[64-45], KEY[64-63], 
		      KEY[64-38], KEY[64-23], KEY[64-21], KEY[64-62],
		      KEY[64-31], KEY[64-54], KEY[64-4], KEY[64-61],
		      KEY[64-13], KEY[64-22], KEY[64-15], KEY[64-47], 
		      KEY[64-46], KEY[64-28], KEY[64-53], KEY[64-29]};

	10: gen_key = {KEY[64-25], KEY[64-1], KEY[64-49], KEY[64-10], 
		       KEY[64-35], KEY[64-3], KEY[64-19], KEY[64-43], 
		       KEY[64-17], KEY[64-60], KEY[64-34], KEY[64-57],
		       KEY[64-18], KEY[64-50], KEY[64-41], KEY[64-11],
		       KEY[64-59], KEY[64-44], KEY[64-9], KEY[64-52], 
		       KEY[64-51], KEY[64-42], KEY[64-33], KEY[64-27],
		       KEY[64-39], KEY[64-14], KEY[64-21], KEY[64-4],
		       KEY[64-54], KEY[64-53], KEY[64-29], KEY[64-47], 
		       KEY[64-22], KEY[64-7], KEY[64-5], KEY[64-46],
		       KEY[64-15], KEY[64-38], KEY[64-55], KEY[64-45],
		       KEY[64-28], KEY[64-6], KEY[64-62], KEY[64-31], 
		       KEY[64-30], KEY[64-12], KEY[64-37], KEY[64-13]};
	
	11: gen_key = {KEY[64-9], KEY[64-50], KEY[64-33], KEY[64-59], 
		       KEY[64-19], KEY[64-52], KEY[64-3], KEY[64-27], 
		       KEY[64-1], KEY[64-44], KEY[64-18], KEY[64-41],
		       KEY[64-2], KEY[64-34], KEY[64-25], KEY[64-60],
		       KEY[64-43], KEY[64-57], KEY[64-58], KEY[64-36], 
		       KEY[64-35], KEY[64-26], KEY[64-17], KEY[64-11],
		       KEY[64-23], KEY[64-61], KEY[64-5], KEY[64-55],
		       KEY[64-38], KEY[64-37], KEY[64-13], KEY[64-31], 
		       KEY[64-6], KEY[64-54], KEY[64-20], KEY[64-30],
		       KEY[64-62], KEY[64-22], KEY[64-39], KEY[64-29],
		       KEY[64-12], KEY[64-53], KEY[64-46], KEY[64-15], 
		       KEY[64-14], KEY[64-63], KEY[64-21], KEY[64-28]};

	12: gen_key = {KEY[64-58], KEY[64-34], KEY[64-17], KEY[64-43], 
		       KEY[64-3], KEY[64-36], KEY[64-52], KEY[64-11], 
		       KEY[64-50], KEY[64-57], KEY[64-2], KEY[64-25],
		       KEY[64-51], KEY[64-18], KEY[64-9], KEY[64-44],
		       KEY[64-27], KEY[64-41], KEY[64-42], KEY[64-49], 
		       KEY[64-19], KEY[64-10], KEY[64-1], KEY[64-60],
		       KEY[64-7], KEY[64-45], KEY[64-20], KEY[64-39],
		       KEY[64-22], KEY[64-21], KEY[64-28], KEY[64-15], 
		       KEY[64-53], KEY[64-38], KEY[64-4], KEY[64-14],
		       KEY[64-46], KEY[64-6], KEY[64-23], KEY[64-13],
		       KEY[64-63], KEY[64-37], KEY[64-30], KEY[64-62], 
		       KEY[64-61], KEY[64-47], KEY[64-5], KEY[64-12]};
	
	13: gen_key = {KEY[64-42], KEY[64-18], KEY[64-1], KEY[64-27], 
		       KEY[64-52], KEY[64-49], KEY[64-36], KEY[64-60], 
		       KEY[64-34], KEY[64-41], KEY[64-51], KEY[64-9],
		       KEY[64-35], KEY[64-2], KEY[64-58], KEY[64-57],
		       KEY[64-11], KEY[64-25], KEY[64-26], KEY[64-33], 
		       KEY[64-3], KEY[64-59], KEY[64-50], KEY[64-44],
		       KEY[64-54], KEY[64-29], KEY[64-4], KEY[64-23],
		       KEY[64-6], KEY[64-5], KEY[64-12], KEY[64-62], 
		       KEY[64-37], KEY[64-22], KEY[64-55], KEY[64-61],
		       KEY[64-30], KEY[64-53], KEY[64-7], KEY[64-28],
		       KEY[64-47], KEY[64-21], KEY[64-14], KEY[64-46], 
		       KEY[64-45], KEY[64-31], KEY[64-20], KEY[64-63]};

	14: gen_key = {KEY[64-26], KEY[64-2], KEY[64-50], KEY[64-11], 
		       KEY[64-36], KEY[64-33], KEY[64-49], KEY[64-44], 
		       KEY[64-18], KEY[64-25], KEY[64-35], KEY[64-58],
		       KEY[64-19], KEY[64-51], KEY[64-42], KEY[64-41],
		       KEY[64-60], KEY[64-9], KEY[64-10], KEY[64-17], 
		       KEY[64-52], KEY[64-43], KEY[64-34], KEY[64-57],
		       KEY[64-38], KEY[64-13], KEY[64-55], KEY[64-7],
		       KEY[64-53], KEY[64-20], KEY[64-63], KEY[64-46], 
		       KEY[64-21], KEY[64-6], KEY[64-39], KEY[64-45],
		       KEY[64-14], KEY[64-37], KEY[64-54], KEY[64-12],
		       KEY[64-31], KEY[64-5], KEY[64-61], KEY[64-30], 
		       KEY[64-29], KEY[64-15], KEY[64-4], KEY[64-47]};

	15: gen_key = {KEY[64-18], KEY[64-59], KEY[64-42], KEY[64-3], 
		       KEY[64-57], KEY[64-25], KEY[64-41], KEY[64-36], 
		       KEY[64-10], KEY[64-17], KEY[64-27], KEY[64-50],
		       KEY[64-11], KEY[64-43], KEY[64-34], KEY[64-33],
		       KEY[64-52], KEY[64-1], KEY[64-2], KEY[64-9], 
		       KEY[64-44], KEY[64-35], KEY[64-26], KEY[64-49],
		       KEY[64-30], KEY[64-5], KEY[64-47], KEY[64-62],
		       KEY[64-45], KEY[64-12], KEY[64-55], KEY[64-38], 
		       KEY[64-13], KEY[64-61], KEY[64-31], KEY[64-37],
		       KEY[64-6], KEY[64-29], KEY[64-46], KEY[64-4],
		       KEY[64-23], KEY[64-28], KEY[64-53], KEY[64-22], 
		       KEY[64-21], KEY[64-7], KEY[64-63], KEY[64-39]};
      endcase
      
   end
   endfunction

   function [31:0] PermP;
   
      input [31:0] IN;

   PermP= { IN[32-16], IN[32-7],  IN[32-20], IN[32-21], 
	    IN[32-29], IN[32-12], IN[32-28], IN[32-17],
	    IN[32-1],  IN[32-15], IN[32-23], IN[32-26], 
	    IN[32-5],  IN[32-18], IN[32-31], IN[32-10],
	    IN[32-2],  IN[32-8],  IN[32-24], IN[32-14], 
	    IN[32-32], IN[32-27], IN[32-3],  IN[32-9],
	    IN[32-19], IN[32-13], IN[32-30], IN[32-6],  
	    IN[32-22], IN[32-11], IN[32-4],  IN[32-25]
	    };

   endfunction

   function [3:0] S1;
   
      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 0 of the table: */
	6'd0:	OUT = 4'd14;
	6'd1:	OUT = 4'd4;
	6'd2:	OUT = 4'd13;
	6'd3:	OUT = 4'd1;
	6'd4:	OUT = 4'd2;
	6'd5:	OUT = 4'd15;
	6'd6:	OUT = 4'd11;
	6'd7:	OUT = 4'd8;
	6'd8:	OUT = 4'd3;
	6'd9:	OUT = 4'd10;
	6'd10:	OUT = 4'd6;
	6'd11:	OUT = 4'd12;
	6'd12:	OUT = 4'd5;
	6'd13:	OUT = 4'd9;
	6'd14:	OUT = 4'd0;
	6'd15:	OUT = 4'd7;

	/* Row 1 of the table: */
	6'd16:	OUT = 4'd0;
	6'd17:	OUT = 4'd15;
	6'd18:	OUT = 4'd7;
	6'd19:	OUT = 4'd4;
	6'd20:	OUT = 4'd14;
	6'd21:	OUT = 4'd2;
	6'd22:	OUT = 4'd13;
	6'd23:	OUT = 4'd1;
	6'd24:	OUT = 4'd10;
	6'd25:	OUT = 4'd6;
	6'd26:	OUT = 4'd12;
	6'd27:	OUT = 4'd11;
	6'd28:	OUT = 4'd9;
	6'd29:	OUT = 4'd5;
	6'd30:	OUT = 4'd3;
	6'd31:	OUT = 4'd8;

	/* Row 2 of the table: */
	6'd32:	OUT = 4'd4;
	6'd33:	OUT = 4'd1;
	6'd34:	OUT = 4'd14;
	6'd35:	OUT = 4'd8;
	6'd36:	OUT = 4'd13;
	6'd37:	OUT = 4'd6;
	6'd38:	OUT = 4'd2;
	6'd39:	OUT = 4'd11;
	6'd40:	OUT = 4'd15;
	6'd41:	OUT = 4'd12;
	6'd42:	OUT = 4'd9;
	6'd43:	OUT = 4'd7;
	6'd44:	OUT = 4'd3;
	6'd45:	OUT = 4'd10;
	6'd46:	OUT = 4'd5;
	6'd47:	OUT = 4'd0;

	/* Row 3 of the table: */
	6'd48:	OUT = 4'd15;
	6'd49:	OUT = 4'd12;
	6'd50:	OUT = 4'd8;
	6'd51:	OUT = 4'd2;
	6'd52:	OUT = 4'd4;
	6'd53:	OUT = 4'd9;
	6'd54:	OUT = 4'd1;
	6'd55:	OUT = 4'd7;
	6'd56:	OUT = 4'd5;
	6'd57:	OUT = 4'd11;
	6'd58:	OUT = 4'd3;
	6'd59:	OUT = 4'd14;
	6'd60:	OUT = 4'd10;
	6'd61:	OUT = 4'd0;
	6'd62:	OUT = 4'd6;
	6'd63:	OUT = 4'd13;
	
      endcase
      S1 = OUT;
      
   end
endfunction

function [3:0] S2;

   input [5:0] A;
   reg [3:0] OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 4 of the table: */
	6'd0:	OUT = 4'd15;
	6'd1:	OUT = 4'd1;
	6'd2:	OUT = 4'd8;
	6'd3:	OUT = 4'd14;
	6'd4:	OUT = 4'd6;
	6'd5:	OUT = 4'd11;
	6'd6:	OUT = 4'd3;
	6'd7:	OUT = 4'd4;
	6'd8:	OUT = 4'd9;
	6'd9:	OUT = 4'd7;
	6'd10:	OUT = 4'd2;
	6'd11:	OUT = 4'd13;
	6'd12:	OUT = 4'd12;
	6'd13:	OUT = 4'd0;
	6'd14:	OUT = 4'd5;
	6'd15:	OUT = 4'd10;

	/* Row 5 of the table: */
	6'd16:	OUT = 4'd3;
	6'd17:	OUT = 4'd13;
	6'd18:	OUT = 4'd4;
	6'd19:	OUT = 4'd7;
	6'd20:	OUT = 4'd15;
	6'd21:	OUT = 4'd2;
	6'd22:	OUT = 4'd8;
	6'd23:	OUT = 4'd14;
	6'd24:	OUT = 4'd12;
	6'd25:	OUT = 4'd0;
	6'd26:	OUT = 4'd1;
	6'd27:	OUT = 4'd10;
	6'd28:	OUT = 4'd6;
	6'd29:	OUT = 4'd9;
	6'd30:	OUT = 4'd11;
	6'd31:	OUT = 4'd5;

	/* Row 6 of the table: */
	6'd32:	OUT = 4'd0;
	6'd33:	OUT = 4'd14;
	6'd34:	OUT = 4'd7;
	6'd35:	OUT = 4'd11;
	6'd36:	OUT = 4'd10;
	6'd37:	OUT = 4'd4;
	6'd38:	OUT = 4'd13;
	6'd39:	OUT = 4'd1;
	6'd40:	OUT = 4'd5;
	6'd41:	OUT = 4'd8;
	6'd42:	OUT = 4'd12;
	6'd43:	OUT = 4'd6;
	6'd44:	OUT = 4'd9;
	6'd45:	OUT = 4'd3;
	6'd46:	OUT = 4'd2;
	6'd47:	OUT = 4'd15;

	/* Row 7 of the table: */
	6'd48:	OUT = 4'd13;
	6'd49:	OUT = 4'd8;
	6'd50:	OUT = 4'd10;
	6'd51:	OUT = 4'd1;
	6'd52:	OUT = 4'd3;
	6'd53:	OUT = 4'd15;
	6'd54:	OUT = 4'd4;
	6'd55:	OUT = 4'd2;
	6'd56:	OUT = 4'd11;
	6'd57:	OUT = 4'd6;
	6'd58:	OUT = 4'd7;
	6'd59:	OUT = 4'd12;
	6'd60:	OUT = 4'd0;
	6'd61:	OUT = 4'd5;
	6'd62:	OUT = 4'd14;
	6'd63:	OUT = 4'd9;
	  
      endcase
      S2 = OUT;
      
   end
   endfunction

   function [3:0] S3;
   
      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 8 of the table: */
	6'd0:	OUT = 4'd10;
	6'd1:	OUT = 4'd0;
	6'd2:	OUT = 4'd9;
	6'd3:	OUT = 4'd14;
	6'd4:	OUT = 4'd6;
	6'd5:	OUT = 4'd3;
	6'd6:	OUT = 4'd15;
	6'd7:	OUT = 4'd5;
	6'd8:	OUT = 4'd1;
	6'd9:	OUT = 4'd13;
	6'd10:	OUT = 4'd12;
	6'd11:	OUT = 4'd7;
	6'd12:	OUT = 4'd11;
	6'd13:	OUT = 4'd4;
	6'd14:	OUT = 4'd2;
	6'd15:	OUT = 4'd8;

	/* Row 9 of the table: */
	6'd16:	OUT = 4'd13;
	6'd17:	OUT = 4'd7;
	6'd18:	OUT = 4'd0;
	6'd19:	OUT = 4'd9;
	6'd20:	OUT = 4'd3;
	6'd21:	OUT = 4'd4;
	6'd22:	OUT = 4'd6;
	6'd23:	OUT = 4'd10;
	6'd24:	OUT = 4'd2;
	6'd25:	OUT = 4'd8;
	6'd26:	OUT = 4'd5;
	6'd27:	OUT = 4'd14;
	6'd28:	OUT = 4'd12;
	6'd29:	OUT = 4'd11;
	6'd30:	OUT = 4'd15;
	6'd31:	OUT = 4'd1;

	/* Row 10 of the table: */
	6'd32:	OUT = 4'd13;
	6'd33:	OUT = 4'd6;
	6'd34:	OUT = 4'd4;
	6'd35:	OUT = 4'd9;
	6'd36:	OUT = 4'd8;
	6'd37:	OUT = 4'd15;
	6'd38:	OUT = 4'd3;
	6'd39:	OUT = 4'd0;
	6'd40:	OUT = 4'd11;
	6'd41:	OUT = 4'd1;
	6'd42:	OUT = 4'd2;
	6'd43:	OUT = 4'd12;
	6'd44:	OUT = 4'd5;
	6'd45:	OUT = 4'd10;
	6'd46:	OUT = 4'd14;
	6'd47:	OUT = 4'd7;

	/* Row 11 of the table: */
	6'd48:	OUT = 4'd1;
	6'd49:	OUT = 4'd10;
	6'd50:	OUT = 4'd13;
	6'd51:	OUT = 4'd0;
	6'd52:	OUT = 4'd6;
	6'd53:	OUT = 4'd9;
	6'd54:	OUT = 4'd8;
	6'd55:	OUT = 4'd7;
	6'd56:	OUT = 4'd4;
	6'd57:	OUT = 4'd15;
	6'd58:	OUT = 4'd14;
	6'd59:	OUT = 4'd3;
	6'd60:	OUT = 4'd11;
	6'd61:	OUT = 4'd5;
	6'd62:	OUT = 4'd2;
	6'd63:	OUT = 4'd12;

      endcase
      S3 = OUT;

   end
   endfunction

   function [3:0] S4;

      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 12 of the table: */
	6'd0:	OUT = 4'd7;
	6'd1:	OUT = 4'd13;
	6'd2:	OUT = 4'd14;
	6'd3:	OUT = 4'd3;
	6'd4:	OUT = 4'd0;
	6'd5:	OUT = 4'd6;
	6'd6:	OUT = 4'd9;
	6'd7:	OUT = 4'd10;
	6'd8:	OUT = 4'd1;
	6'd9:	OUT = 4'd2;
	6'd10:	OUT = 4'd8;
	6'd11:	OUT = 4'd5;
	6'd12:	OUT = 4'd11;
	6'd13:	OUT = 4'd12;
	6'd14:	OUT = 4'd4;
	6'd15:	OUT = 4'd15;

	/* Row 13 of the table: */
	6'd16:	OUT = 4'd13;
	6'd17:	OUT = 4'd8;
	6'd18:	OUT = 4'd11;
	6'd19:	OUT = 4'd5;
	6'd20:	OUT = 4'd6;
	6'd21:	OUT = 4'd15;
	6'd22:	OUT = 4'd0;
	6'd23:	OUT = 4'd3;
	6'd24:	OUT = 4'd4;
	6'd25:	OUT = 4'd7;
	6'd26:	OUT = 4'd2;
	6'd27:	OUT = 4'd12;
	6'd28:	OUT = 4'd1;
	6'd29:	OUT = 4'd10;
	6'd30:	OUT = 4'd14;
	6'd31:	OUT = 4'd9;

	/* Row 14 of the table: */
	6'd32:	OUT = 4'd10;
	6'd33:	OUT = 4'd6;
	6'd34:	OUT = 4'd9;
	6'd35:	OUT = 4'd0;
	6'd36:	OUT = 4'd12;
	6'd37:	OUT = 4'd11;
	6'd38:	OUT = 4'd7;
	6'd39:	OUT = 4'd13;
	6'd40:	OUT = 4'd15;
	6'd41:	OUT = 4'd1;
	6'd42:	OUT = 4'd3;
	6'd43:	OUT = 4'd14;
	6'd44:	OUT = 4'd5;
	6'd45:	OUT = 4'd2;
	6'd46:	OUT = 4'd8;
	6'd47:	OUT = 4'd4;

	/* Row 15 of the table: */
	6'd48:	OUT = 4'd3;
	6'd49:	OUT = 4'd15;
	6'd50:	OUT = 4'd0;
	6'd51:	OUT = 4'd6;
	6'd52:	OUT = 4'd10;
	6'd53:	OUT = 4'd1;
	6'd54:	OUT = 4'd13;
	6'd55:	OUT = 4'd8;
	6'd56:	OUT = 4'd9;
	6'd57:	OUT = 4'd4;
	6'd58:	OUT = 4'd5;
	6'd59:	OUT = 4'd11;
	6'd60:	OUT = 4'd12;
	6'd61:	OUT = 4'd7;
	6'd62:	OUT = 4'd2;
	6'd63:	OUT = 4'd14;

      endcase
      S4 = OUT;

   end
   endfunction

   function [3:0] S5;

      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 16 of the table: */
	6'd0:	OUT = 4'd2;
	6'd1:	OUT = 4'd12;
	6'd2:	OUT = 4'd4;
	6'd3:	OUT = 4'd1;
	6'd4:	OUT = 4'd7;
	6'd5:	OUT = 4'd10;
	6'd6:	OUT = 4'd11;
	6'd7:	OUT = 4'd6;
	6'd8:	OUT = 4'd8;
	6'd9:	OUT = 4'd5;
	6'd10:	OUT = 4'd3;
	6'd11:	OUT = 4'd15;
	6'd12:	OUT = 4'd13;
	6'd13:	OUT = 4'd0;
	6'd14:	OUT = 4'd14;
	6'd15:	OUT = 4'd9;

	/* Row 17 of the table: */
	6'd16:	OUT = 4'd14;
	6'd17:	OUT = 4'd11;
	6'd18:	OUT = 4'd2;
	6'd19:	OUT = 4'd12;
	6'd20:	OUT = 4'd4;
	6'd21:	OUT = 4'd7;
	6'd22:	OUT = 4'd13;
	6'd23:	OUT = 4'd1;
	6'd24:	OUT = 4'd5;
	6'd25:	OUT = 4'd0;
	6'd26:	OUT = 4'd15;
	6'd27:	OUT = 4'd10;
	6'd28:	OUT = 4'd3;
	6'd29:	OUT = 4'd9;
	6'd30:	OUT = 4'd8;
	6'd31:	OUT = 4'd6;

	/* Row 18 of the table: */
	6'd32:	OUT = 4'd4;
	6'd33:	OUT = 4'd2;
	6'd34:	OUT = 4'd1;
	6'd35:	OUT = 4'd11;
	6'd36:	OUT = 4'd10;
	6'd37:	OUT = 4'd13;
	6'd38:	OUT = 4'd7;
	6'd39:	OUT = 4'd8;
	6'd40:	OUT = 4'd15;
	6'd41:	OUT = 4'd9;
	6'd42:	OUT = 4'd12;
	6'd43:	OUT = 4'd5;
	6'd44:	OUT = 4'd6;
	6'd45:	OUT = 4'd3;
	6'd46:	OUT = 4'd0;
	6'd47:	OUT = 4'd14;

	/* Row 19 of the table: */
	6'd48:	OUT = 4'd11;
	6'd49:	OUT = 4'd8;
	6'd50:	OUT = 4'd12;
	6'd51:	OUT = 4'd7;
	6'd52:	OUT = 4'd1;
	6'd53:	OUT = 4'd14;
	6'd54:	OUT = 4'd2;
	6'd55:	OUT = 4'd13;
	6'd56:	OUT = 4'd6;
	6'd57:	OUT = 4'd15;
	6'd58:	OUT = 4'd0;
	6'd59:	OUT = 4'd9;
	6'd60:	OUT = 4'd10;
	6'd61:	OUT = 4'd4;
	6'd62:	OUT = 4'd5;
	6'd63:	OUT = 4'd3;

      endcase
      S5 = OUT;

   end
   endfunction

   function [3:0] S6;

      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 20 of the table: */
	6'd0:	OUT = 4'd12;
	6'd1:	OUT = 4'd1;
	6'd2:	OUT = 4'd10;
	6'd3:	OUT = 4'd15;
	6'd4:	OUT = 4'd9;
	6'd5:	OUT = 4'd2;
	6'd6:	OUT = 4'd6;
	6'd7:	OUT = 4'd8;
	6'd8:	OUT = 4'd0;
	6'd9:	OUT = 4'd13;
	6'd10:	OUT = 4'd3;
	6'd11:	OUT = 4'd4;
	6'd12:	OUT = 4'd14;
	6'd13:	OUT = 4'd7;
	6'd14:	OUT = 4'd5;
	6'd15:	OUT = 4'd11;

	/* Row 21 of the table: */
	6'd16:	OUT = 4'd10;
	6'd17:	OUT = 4'd15;
	6'd18:	OUT = 4'd4;
	6'd19:	OUT = 4'd2;
	6'd20:	OUT = 4'd7;
	6'd21:	OUT = 4'd12;
	6'd22:	OUT = 4'd9;
	6'd23:	OUT = 4'd5;
	6'd24:	OUT = 4'd6;
	6'd25:	OUT = 4'd1;
	6'd26:	OUT = 4'd13;
	6'd27:	OUT = 4'd14;
	6'd28:	OUT = 4'd0;
	6'd29:	OUT = 4'd11;
	6'd30:	OUT = 4'd3;
	6'd31:	OUT = 4'd8;

	/* Row 22 of the table: */
	6'd32:	OUT = 4'd9;
	6'd33:	OUT = 4'd14;
	6'd34:	OUT = 4'd15;
	6'd35:	OUT = 4'd5;
	6'd36:	OUT = 4'd2;
	6'd37:	OUT = 4'd8;
	6'd38:	OUT = 4'd12;
	6'd39:	OUT = 4'd3;
	6'd40:	OUT = 4'd7;
	6'd41:	OUT = 4'd0;
	6'd42:	OUT = 4'd4;
	6'd43:	OUT = 4'd10;
	6'd44:	OUT = 4'd1;
	6'd45:	OUT = 4'd13;
	6'd46:	OUT = 4'd11;
	6'd47:	OUT = 4'd6;

	/* Row 23 of the table: */
	6'd48:	OUT = 4'd4;
	6'd49:	OUT = 4'd3;
	6'd50:	OUT = 4'd2;
	6'd51:	OUT = 4'd12;
	6'd52:	OUT = 4'd9;
	6'd53:	OUT = 4'd5;
	6'd54:	OUT = 4'd15;
	6'd55:	OUT = 4'd10;
	6'd56:	OUT = 4'd11;
	6'd57:	OUT = 4'd14;
	6'd58:	OUT = 4'd1;
	6'd59:	OUT = 4'd7;
	6'd60:	OUT = 4'd6;
	6'd61:	OUT = 4'd0;
	6'd62:	OUT = 4'd8;
	6'd63:	OUT = 4'd13;

      endcase
      S6 = OUT;

   end
   endfunction

   function [3:0] S7;

      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 24 of the table: */
	6'd0:	OUT = 4'd4;
	6'd1:	OUT = 4'd11;
	6'd2:	OUT = 4'd2;
	6'd3:	OUT = 4'd14;
	6'd4:	OUT = 4'd15;
	6'd5:	OUT = 4'd0;
	6'd6:	OUT = 4'd8;
	6'd7:	OUT = 4'd13;
	6'd8:	OUT = 4'd3;
	6'd9:	OUT = 4'd12;
	6'd10:	OUT = 4'd9;
	6'd11:	OUT = 4'd7;
	6'd12:	OUT = 4'd5;
	6'd13:	OUT = 4'd10;
	6'd14:	OUT = 4'd6;
	6'd15:	OUT = 4'd1;

	/* Row 25 of the table: */
	6'd16:	OUT = 4'd13;
	6'd17:	OUT = 4'd0;
	6'd18:	OUT = 4'd11;
	6'd19:	OUT = 4'd7;
	6'd20:	OUT = 4'd4;
	6'd21:	OUT = 4'd9;
	6'd22:	OUT = 4'd1;
	6'd23:	OUT = 4'd10;
	6'd24:	OUT = 4'd14;
	6'd25:	OUT = 4'd3;
	6'd26:	OUT = 4'd5;
	6'd27:	OUT = 4'd12;
	6'd28:	OUT = 4'd2;
	6'd29:	OUT = 4'd15;
	6'd30:	OUT = 4'd8;
	6'd31:	OUT = 4'd6;

	/* Row 26 of the table: */
	6'd32:	OUT = 4'd1;
	6'd33:	OUT = 4'd4;
	6'd34:	OUT = 4'd11;
	6'd35:	OUT = 4'd13;
	6'd36:	OUT = 4'd12;
	6'd37:	OUT = 4'd3;
	6'd38:	OUT = 4'd7;
	6'd39:	OUT = 4'd14;
	6'd40:	OUT = 4'd10;
	6'd41:	OUT = 4'd15;
	6'd42:	OUT = 4'd6;
	6'd43:	OUT = 4'd8;
	6'd44:	OUT = 4'd0;
	6'd45:	OUT = 4'd5;
	6'd46:	OUT = 4'd9;
	6'd47:	OUT = 4'd2;

	/* Row 27 of the table: */
	6'd48:	OUT = 4'd6;
	6'd49:	OUT = 4'd11;
	6'd50:	OUT = 4'd13;
	6'd51:	OUT = 4'd8;
	6'd52:	OUT = 4'd1;
	6'd53:	OUT = 4'd4;
	6'd54:	OUT = 4'd10;
	6'd55:	OUT = 4'd7;
	6'd56:	OUT = 4'd9;
	6'd57:	OUT = 4'd5;
	6'd58:	OUT = 4'd0;
	6'd59:	OUT = 4'd15;
	6'd60:	OUT = 4'd14;
	6'd61:	OUT = 4'd2;
	6'd62:	OUT = 4'd3;
	6'd63:	OUT = 4'd12;

      endcase
      S7 = OUT;

   end
   endfunction
   
   function [3:0] S8;

      input [5:0] A;
      reg [3:0]	  OUT;

   begin
      case ({A[5], A[0], A[4], A[3], A[2], A[1]})

	/* Row 28 of the table: */
	6'd0:	OUT = 4'd13;
	6'd1:	OUT = 4'd2;
	6'd2:	OUT = 4'd8;
	6'd3:	OUT = 4'd4;
	6'd4:	OUT = 4'd6;
	6'd5:	OUT = 4'd15;
	6'd6:	OUT = 4'd11;
	6'd7:	OUT = 4'd1;
	6'd8:	OUT = 4'd10;
	6'd9:	OUT = 4'd9;
	6'd10:	OUT = 4'd3;
	6'd11:	OUT = 4'd14;
	6'd12:	OUT = 4'd5;
	6'd13:	OUT = 4'd0;
	6'd14:	OUT = 4'd12;
	6'd15:	OUT = 4'd7;

	/* Row 29 of the table: */
	6'd16:	OUT = 4'd1;
	6'd17:	OUT = 4'd15;
	6'd18:	OUT = 4'd13;
	6'd19:	OUT = 4'd8;
	6'd20:	OUT = 4'd10;
	6'd21:	OUT = 4'd3;
	6'd22:	OUT = 4'd7;
	6'd23:	OUT = 4'd4;
	6'd24:	OUT = 4'd12;
	6'd25:	OUT = 4'd5;
	6'd26:	OUT = 4'd6;
	6'd27:	OUT = 4'd11;
	6'd28:	OUT = 4'd0;
	6'd29:	OUT = 4'd14;
	6'd30:	OUT = 4'd9;
	6'd31:	OUT = 4'd2;

	/* Row 30 of the table: */
	6'd32:	OUT = 4'd7;
	6'd33:	OUT = 4'd11;
	6'd34:	OUT = 4'd4;
	6'd35:	OUT = 4'd1;
	6'd36:	OUT = 4'd9;
	6'd37:	OUT = 4'd12;
	6'd38:	OUT = 4'd14;
	6'd39:	OUT = 4'd2;
	6'd40:	OUT = 4'd0;
	6'd41:	OUT = 4'd6;
	6'd42:	OUT = 4'd10;
	6'd43:	OUT = 4'd13;
	6'd44:	OUT = 4'd15;
	6'd45:	OUT = 4'd3;
	6'd46:	OUT = 4'd5;
	6'd47:	OUT = 4'd8;

	/* Row 31 of the table: */
	6'd48:	OUT = 4'd2;
	6'd49:	OUT = 4'd1;
	6'd50:	OUT = 4'd14;
	6'd51:	OUT = 4'd7;
	6'd52:	OUT = 4'd4;
	6'd53:	OUT = 4'd10;
	6'd54:	OUT = 4'd8;
	6'd55:	OUT = 4'd13;
	6'd56:	OUT = 4'd15;
	6'd57:	OUT = 4'd12;
	6'd58:	OUT = 4'd9;
	6'd59:	OUT = 4'd0;
	6'd60:	OUT = 4'd3;
	6'd61:	OUT = 4'd5;
	6'd62:	OUT = 4'd6;
	6'd63:	OUT = 4'd11;

      endcase
      S8 = OUT;

   end
   endfunction
   
endmodule
