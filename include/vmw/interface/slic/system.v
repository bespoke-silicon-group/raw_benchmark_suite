/*
 * $Header: /projects/raw/cvsroot/benchmark/include/vmw/interface/slic/system.v,v 1.2 1997/08/09 05:56:29 jbabb Exp $
 *
 * RAW Benchmark Suite Top Level Module for Reconfigurable Computer
 * 
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */


`include "main_define.v"

/*
   Top level module for reconfigurable computing system.
   This version is an IKOS VirtuaLogic Emulation System connected
   to a Sun workstation via the PBus of a SLIC interface card from
   Dawn VME Products.
*/ 

module system (
               Clk,
               PBusAddr,
               PBusData,
               PBusRDN,
               PBusReadyN,
               PBusResetN,
               PBusWRN
              );
input  Clk;
input  [`GlobalAddrWidth+1:2] PBusAddr;
inout  [`GlobalDataWidth-1:0] PBusData;
input  PBusRDN;
input  PBusWRN;
output PBusReadyN;
input  PBusResetN;

wire   [`GlobalDataWidth-1:0] DataOut;
wire   RD;
wire   WR;


/*
  Interface logic to communication between the asynchronous PBus
  and a synchronous address space (Addr,Data) for the main module.
*/

interface Uinterface (
                     .Clk(Clk),
                     .PBusResetN(PBusResetN),
                     .PBusRDN(PBusRDN),
                     .PBusWRN(PBusWRN),
                     .PBusReadyN(PBusReadyN),
                     .Reset(Reset),
                     .RD(RD),
                     .WR(WR)
                     );


/* 
  Generic instantiation of "main" to be supplied by each application.
*/

main Umain (
            .Clk(Clk),
            .Reset(Reset),
            .RD(RD),
            .WR(WR),
            .Addr(PBusAddr),
            .DataIn(PBusData),
            .DataOut(DataOut)
           );


/* 
  Need output buffers for VMW to be explicitly instantiated as
  the behavioral compiler chooses an internal buffer instead.
*/

VMW_OBUFZ B00 ( .A(DataOut[0] ), .E(RD), .Z(PBusData[0] ) );
VMW_OBUFZ B01 ( .A(DataOut[1] ), .E(RD), .Z(PBusData[1] ) );
VMW_OBUFZ B02 ( .A(DataOut[2] ), .E(RD), .Z(PBusData[2] ) );
VMW_OBUFZ B03 ( .A(DataOut[3] ), .E(RD), .Z(PBusData[3] ) );
VMW_OBUFZ B04 ( .A(DataOut[4] ), .E(RD), .Z(PBusData[4] ) );
VMW_OBUFZ B05 ( .A(DataOut[5] ), .E(RD), .Z(PBusData[5] ) );
VMW_OBUFZ B06 ( .A(DataOut[6] ), .E(RD), .Z(PBusData[6] ) );
VMW_OBUFZ B07 ( .A(DataOut[7] ), .E(RD), .Z(PBusData[7] ) );

VMW_OBUFZ B08 ( .A(DataOut[8] ), .E(RD), .Z(PBusData[8] ) );
VMW_OBUFZ B09 ( .A(DataOut[9] ), .E(RD), .Z(PBusData[9] ) );
VMW_OBUFZ B10 ( .A(DataOut[10] ), .E(RD), .Z(PBusData[10] ) );
VMW_OBUFZ B11 ( .A(DataOut[11] ), .E(RD), .Z(PBusData[11] ) );
VMW_OBUFZ B12 ( .A(DataOut[12] ), .E(RD), .Z(PBusData[12] ) );
VMW_OBUFZ B13 ( .A(DataOut[13] ), .E(RD), .Z(PBusData[13] ) );
VMW_OBUFZ B14 ( .A(DataOut[14] ), .E(RD), .Z(PBusData[14] ) );
VMW_OBUFZ B15 ( .A(DataOut[15] ), .E(RD), .Z(PBusData[15] ) );

VMW_OBUFZ B16 ( .A(DataOut[16] ), .E(RD), .Z(PBusData[16] ) );
VMW_OBUFZ B17 ( .A(DataOut[17] ), .E(RD), .Z(PBusData[17] ) );
VMW_OBUFZ B18 ( .A(DataOut[18] ), .E(RD), .Z(PBusData[18] ) );
VMW_OBUFZ B19 ( .A(DataOut[19] ), .E(RD), .Z(PBusData[19] ) );
VMW_OBUFZ B20 ( .A(DataOut[20] ), .E(RD), .Z(PBusData[20] ) );
VMW_OBUFZ B21 ( .A(DataOut[21] ), .E(RD), .Z(PBusData[21] ) );
VMW_OBUFZ B22 ( .A(DataOut[22] ), .E(RD), .Z(PBusData[22] ) );
VMW_OBUFZ B23 ( .A(DataOut[23] ), .E(RD), .Z(PBusData[23] ) );

VMW_OBUFZ B24 ( .A(DataOut[24] ), .E(RD), .Z(PBusData[24] ) );
VMW_OBUFZ B25 ( .A(DataOut[25] ), .E(RD), .Z(PBusData[25] ) );
VMW_OBUFZ B26 ( .A(DataOut[26] ), .E(RD), .Z(PBusData[26] ) );
VMW_OBUFZ B27 ( .A(DataOut[27] ), .E(RD), .Z(PBusData[27] ) );
VMW_OBUFZ B28 ( .A(DataOut[28] ), .E(RD), .Z(PBusData[28] ) );
VMW_OBUFZ B29 ( .A(DataOut[29] ), .E(RD), .Z(PBusData[29] ) );
VMW_OBUFZ B30 ( .A(DataOut[30] ), .E(RD), .Z(PBusData[30] ) );
VMW_OBUFZ B31 ( .A(DataOut[31] ), .E(RD), .Z(PBusData[31] ) );

endmodule
