
module system ( Clk, PBusAddr, PBusData, PBusRDN, PBusReadyN, PBusResetN, 
    PBusWRN );
input  [16:2] PBusAddr;
inout  [31:0] PBusData;
input  Clk, PBusRDN, PBusResetN, PBusWRN;
output PBusReadyN;
    wire \DataOut[27] , \DataOut[14] , \DataOut[23] , \DataOut[19] , 
        \DataOut[10] , \DataOut[31] , \DataOut[28] , \DataOut[21] , 
        \DataOut[12] , \DataOut[25] , \DataOut[16] , Reset, WR, \DataOut[3] , 
        \DataOut[7] , \DataOut[5] , RD, \DataOut[8] , \DataOut[1] , 
        \DataOut[9] , \DataOut[0] , \DataOut[4] , \DataOut[6] , \DataOut[2] , 
        \DataOut[24] , \DataOut[17] , \DataOut[30] , \DataOut[29] , 
        \DataOut[20] , \DataOut[13] , \DataOut[22] , \DataOut[18] , 
        \DataOut[11] , \DataOut[26] , \DataOut[15] ;
    interface Uinterface ( .Clk(Clk), .PBusResetN(PBusResetN), .PBusRDN(
        PBusRDN), .PBusWRN(PBusWRN), .PBusReadyN(PBusReadyN), .Reset(Reset), 
        .RD(RD), .WR(WR) );
    VMW_OBUFZ B01 ( .A(\DataOut[1] ), .E(RD), .Z(PBusData[1]) );
    VMW_OBUFZ B08 ( .A(\DataOut[8] ), .E(RD), .Z(PBusData[8]) );
    VMW_OBUFZ B13 ( .A(\DataOut[13] ), .E(RD), .Z(PBusData[13]) );
    VMW_OBUFZ B26 ( .A(\DataOut[26] ), .E(RD), .Z(PBusData[26]) );
    main Umain ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(PBusAddr), 
        .DataIn(PBusData), .DataOut({\DataOut[31] , \DataOut[30] , 
        \DataOut[29] , \DataOut[28] , \DataOut[27] , \DataOut[26] , 
        \DataOut[25] , \DataOut[24] , \DataOut[23] , \DataOut[22] , 
        \DataOut[21] , \DataOut[20] , \DataOut[19] , \DataOut[18] , 
        \DataOut[17] , \DataOut[16] , \DataOut[15] , \DataOut[14] , 
        \DataOut[13] , \DataOut[12] , \DataOut[11] , \DataOut[10] , 
        \DataOut[9] , \DataOut[8] , \DataOut[7] , \DataOut[6] , \DataOut[5] , 
        \DataOut[4] , \DataOut[3] , \DataOut[2] , \DataOut[1] , \DataOut[0] })
         );
    VMW_OBUFZ B06 ( .A(\DataOut[6] ), .E(RD), .Z(PBusData[6]) );
    VMW_OBUFZ B07 ( .A(\DataOut[7] ), .E(RD), .Z(PBusData[7]) );
    VMW_OBUFZ B14 ( .A(\DataOut[14] ), .E(RD), .Z(PBusData[14]) );
    VMW_OBUFZ B21 ( .A(\DataOut[21] ), .E(RD), .Z(PBusData[21]) );
    VMW_OBUFZ B28 ( .A(\DataOut[28] ), .E(RD), .Z(PBusData[28]) );
    VMW_OBUFZ B09 ( .A(\DataOut[9] ), .E(RD), .Z(PBusData[9]) );
    VMW_OBUFZ B12 ( .A(\DataOut[12] ), .E(RD), .Z(PBusData[12]) );
    VMW_OBUFZ B15 ( .A(\DataOut[15] ), .E(RD), .Z(PBusData[15]) );
    VMW_OBUFZ B20 ( .A(\DataOut[20] ), .E(RD), .Z(PBusData[20]) );
    VMW_OBUFZ B29 ( .A(\DataOut[29] ), .E(RD), .Z(PBusData[29]) );
    VMW_OBUFZ B00 ( .A(\DataOut[0] ), .E(RD), .Z(PBusData[0]) );
    VMW_OBUFZ B27 ( .A(\DataOut[27] ), .E(RD), .Z(PBusData[27]) );
    VMW_OBUFZ B02 ( .A(\DataOut[2] ), .E(RD), .Z(PBusData[2]) );
    VMW_OBUFZ B10 ( .A(\DataOut[10] ), .E(RD), .Z(PBusData[10]) );
    VMW_OBUFZ B03 ( .A(\DataOut[3] ), .E(RD), .Z(PBusData[3]) );
    VMW_OBUFZ B04 ( .A(\DataOut[4] ), .E(RD), .Z(PBusData[4]) );
    VMW_OBUFZ B05 ( .A(\DataOut[5] ), .E(RD), .Z(PBusData[5]) );
    VMW_OBUFZ B19 ( .A(\DataOut[19] ), .E(RD), .Z(PBusData[19]) );
    VMW_OBUFZ B25 ( .A(\DataOut[25] ), .E(RD), .Z(PBusData[25]) );
    VMW_OBUFZ B22 ( .A(\DataOut[22] ), .E(RD), .Z(PBusData[22]) );
    VMW_OBUFZ B17 ( .A(\DataOut[17] ), .E(RD), .Z(PBusData[17]) );
    VMW_OBUFZ B30 ( .A(\DataOut[30] ), .E(RD), .Z(PBusData[30]) );
    VMW_OBUFZ B23 ( .A(\DataOut[23] ), .E(RD), .Z(PBusData[23]) );
    VMW_OBUFZ B11 ( .A(\DataOut[11] ), .E(RD), .Z(PBusData[11]) );
    VMW_OBUFZ B16 ( .A(\DataOut[16] ), .E(RD), .Z(PBusData[16]) );
    VMW_OBUFZ B31 ( .A(\DataOut[31] ), .E(RD), .Z(PBusData[31]) );
    VMW_OBUFZ B18 ( .A(\DataOut[18] ), .E(RD), .Z(PBusData[18]) );
    VMW_OBUFZ B24 ( .A(\DataOut[24] ), .E(RD), .Z(PBusData[24]) );
endmodule

