/*
 * $Header: /projects/raw/cvsroot/benchmark/include/vmw/interface/slic/interface-4cycle.v,v 1.2 1997/08/09 05:56:26 jbabb Exp $
 *
 * RAW Benchmark Suite Inteface Verilog
 * 
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

/*
 * Interface logic to communication between the asynchronous PBus
 * and a synchronous address space (Addr,Data) for the main module.
 *
 * 4 cycle read, 2 cycle write.
 *
 * Note: not compatible with scan I/O because of double read strobe.
 */


module interface (
		  Clk,
		  PBusResetN,
		  PBusRDN,
		  PBusWRN,
		  PBusReadyN,
		  Reset,
		  RD,
		  WR
		  );

   input     Clk;
   input     PBusResetN;
   input     PBusRDN;
   input     PBusWRN;
   output    PBusReadyN;
   output    Reset;
   output    RD;
   output    WR;
   
   reg [1:0] State;
   
/* 
   State machine to conservatively control handshaking:

   2 cycle writes:
    State    0 1
    PBusRDN  x x
    PBusWRN  0 x
    Ready    1 0
    WR       1 0

   4 cycle reads:
    State   0 1 2 3
    PBusRDN 0 x x x
    PBusWRN 1 x x x
    Ready   0 1 1 0
    RD      1 1 0 0

 */

   assign PBusReadyN = !((State==0 && !PBusWRN) || (State==1) || (State==2));
   assign RD         =   (State==0 && !PBusRDN) || (State==1);
   assign WR         =   (State==0 && !PBusWRN);
   assign Reset      = !  PBusResetN;
   
   always @(posedge Clk)
      begin
	 if (!PBusResetN) 
	    State=0; 
	 else
	    case (State)
	      0: if (!PBusRDN) 
		 State=1;
	      else if (!PBusWRN)
		 State=3;
	      else
		 State=0;
	      1: State=2;
	      2: State=3;
	      3: State=0;
	    endcase
      end
endmodule
