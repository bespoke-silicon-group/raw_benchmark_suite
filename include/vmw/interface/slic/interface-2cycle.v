/*
 * $Header: /projects/raw/cvsroot/benchmark/include/vmw/interface/slic/interface-2cycle.v,v 1.2 1997/08/09 05:56:24 jbabb Exp $
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
 * 2 cycle read, 2 cycle write.
 *
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
   
   reg State;
   
   /* 
    State machine to control handshaking:
    
    2 cycle write:
    State    0 1
    PBusRDN  x x
    PBusWRN  0 x
    Ready    1 0
    WR       1 0
    
    2 cycle read:
    State    0 1
    PBusRDN  0 x
    PBusWRN  1 x
    Ready    1 0
    RD       1 0
    
    */

   assign PBusReadyN =  !(State==0 && (!PBusWRN || !PBusRDN));
   assign RD         =   (State==0 && !PBusRDN);
   assign WR         =   (State==0 && !PBusWRN);
   assign Reset      =  ! PBusResetN;
         
   always @(posedge Clk)
      begin
	 if (!PBusResetN) 
	    State=0; 
	 else
	    case (State)
	      0: if (!PBusWRN || !PBusRDN) 
		 State=1;
	      else
		 State=0;
	      1: State=0;
	    endcase
      end
endmodule
