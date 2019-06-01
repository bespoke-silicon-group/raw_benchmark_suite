/*
 * $Header: /projects/raw/cvsroot/benchmark/include/common/test_shell.v,v 1.3 1997/08/09 05:56:16 jbabb Exp $
 *
 * RAW Benchmark Suite simulation test shell
 * 
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */


`include "main_define.v"


/* Top level test shell */

module test_shell();

wire  Clk;
wire  Reset;
wire  RD;
wire  WR;
wire  [`GlobalAddrWidth-1:0] Addr;
wire  [`GlobalDataWidth-1:0] DataIn;
wire  [`GlobalDataWidth-1:0] DataOut;
wire  [`GlobalDataWidth-1:0] DataCheck;

integer cycle;


/* instantiate main (should be include the interface?) */

main Umain (
             Clk,
             Reset,
             RD,
             WR,
             Addr,
             DataIn,
             DataOut
           );


/* Generate clock */

initial
  cycle=0;

initial
  forever
    begin
     force Clk = 1'b0;
     #50;
     force Clk = 1'b1;
     cycle=cycle+1;
     $display("Cycle=%d",cycle);
     #50;

     /* Monitor all signals */
     $monitor(" Clk=",Clk,
              " Reset=",Reset,
              " RD=",RD,
              " WR=",WR,
              " Addr=",Addr,
              " DataIn=", DataIn,
              " DataOut=", DataOut,
             );
   end


/* Check data automatically */

initial
  forever
    begin
     #90;
       
     if(RD)
	case (DataOut)
	  DataCheck: ;
	  default: $display("Error: cycle %d, Addr %d, Data %d, expected %d",
			    cycle,Addr,DataOut,DataCheck);
	  
	endcase
       #10;
    end


/* Main vector firing loop */

initial
    begin


/* Reset sequence */

    force Reset   = 1;
    force RD      = 0;
    force WR      = 0;
    force Addr    = 0;
    force DataIn  = 0;
    #100;
    force Reset   = 0;
    #100;


/* Test vectors */

`include "vectors.v"


/* Exit */

  $finish(0);

  end

endmodule
