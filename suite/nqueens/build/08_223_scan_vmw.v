
module NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, Id, CallIn, ReturnIn, ColIn, PDiagIn, 
    NDiagIn, CallOut, ReturnOut, ColOut, PDiagOut, NDiagOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [3:0] Id;
input  [7:0] ColIn;
output [7:0] ColOut;
input  [3:0] ScanIn;
output [3:0] ScanOut;
input  [7:0] NDiagIn;
output [7:0] PDiagOut;
output [7:0] NDiagOut;
input  [7:0] PDiagIn;
input  Clk, Reset, RD, WR, ScanEnable, CallIn, ReturnIn;
output CallOut, ReturnOut;
    wire \NDiagOut[0] , n1242, n1280, n1237, n1265, n1259, n1289, n1250, n1239, 
        n1277, n1292, n1295, n1270, n1257, n1230, n1279, n1245, n1262, 
        ReturnOut521, n1287, n1238, n1256, n1271, n1294, n1231, n1244, n1263, 
        n1286, n1278, n1236, n1243, n1258, n1264, n1281, n1251, n1293, n1276, 
        n1241, n1266, n1283, n1288, n1234, n1298, n1248, n1253, n1274, 
        CallOut528, n1301, n1291, n1233, n1254, n1296, n1268, n1273, n1246, 
        n1261, n1284, n1269, n1255, n1272, n1297, n1285, n1247, n1260, n1232, 
        n1299, n1235, n1267, n1240, n1282, n1300, n1290, n1275, n1249, n1252;
    assign PDiagOut[7] = \NDiagOut[0] ;
    assign NDiagOut[0] = \NDiagOut[0] ;
    VMW_OR2 U271 ( .A(n1234), .B(PDiagIn[3]), .Z(PDiagOut[2]) );
    VMW_AND2 U338 ( .A(n1271), .B(n1279), .Z(n1257) );
    VMW_INV U356 ( .A(ReturnIn), .Z(n1278) );
    VMW_MUX2I U294 ( .A(ScanOut[0]), .B(ScanIn[0]), .S(ScanEnable), .Z(n1251)
         );
    VMW_AND3 U304 ( .A(n1267), .B(n1268), .C(n1241), .Z(n1245) );
    VMW_AND3 U323 ( .A(ScanOut[1]), .B(n1288), .C(n1280), .Z(n1231) );
    VMW_OR2 U276 ( .A(ColIn[5]), .B(n1232), .Z(ColOut[5]) );
    VMW_OR2 U278 ( .A(ColIn[3]), .B(n1234), .Z(ColOut[3]) );
    VMW_OR2 U286 ( .A(n1235), .B(NDiagIn[2]), .Z(NDiagOut[3]) );
    VMW_OR4 U316 ( .A(n1285), .B(NDiagIn[3]), .C(ColIn[3]), .D(PDiagIn[3]), 
        .Z(n1265) );
    VMW_AND3 U331 ( .A(n1288), .B(n1289), .C(n1282), .Z(n1239) );
    VMW_OR2 U281 ( .A(ColIn[0]), .B(n1239), .Z(ColOut[0]) );
    VMW_AO21 U311 ( .A(n1278), .B(n1279), .C(Reset), .Z(n1243) );
    VMW_OAI211 U336 ( .A(CallIn), .B(n1270), .C(n1291), .D(n1286), .Z(n1264)
         );
    VMW_OR3 U343 ( .A(n1251), .B(n1252), .C(n1253), .Z(n1260) );
    VMW_OR4 U344 ( .A(NDiagIn[7]), .B(n1258), .C(PDiagIn[7]), .D(ColIn[7]), 
        .Z(n1276) );
    VMW_INV U358 ( .A(n1261), .Z(n1298) );
    VMW_OR3 U293 ( .A(n1244), .B(n1249), .C(n1250), .Z(n1299) );
    VMW_AND3 U324 ( .A(ScanOut[0]), .B(n1289), .C(n1280), .Z(n1232) );
    VMW_AND3 U303 ( .A(n1263), .B(n1266), .C(n1241), .Z(n1247) );
    VMW_NAND2 U280 ( .A(n1237), .B(n1238), .Z(ColOut[1]) );
    VMW_OR2 U288 ( .A(NDiagIn[0]), .B(n1239), .Z(NDiagOut[1]) );
    VMW_INV U351 ( .A(ColIn[1]), .Z(n1238) );
    VMW_NOR2 U318 ( .A(PDiagIn[4]), .B(ColIn[4]), .Z(n1287) );
    VMW_OAI211 U337 ( .A(CallIn), .B(n1269), .C(n1292), .D(n1287), .Z(n1274)
         );
    VMW_AND5 U310 ( .A(n1275), .B(n1256), .C(n1276), .D(n1277), .E(n1263), .Z(
        n1242) );
    VMW_INV U359 ( .A(n1243), .Z(n1241) );
    VMW_OR2 U270 ( .A(n1233), .B(PDiagIn[4]), .Z(PDiagOut[3]) );
    VMW_OR2 U277 ( .A(ColIn[4]), .B(n1233), .Z(ColOut[4]) );
    VMW_AND2 U289 ( .A(n1241), .B(n1242), .Z(ReturnOut521) );
    VMW_AO22 U319 ( .A(ScanOut[3]), .B(n1284), .C(ScanIn[3]), .D(n1283), .Z(
        n1262) );
    VMW_OAI211 U342 ( .A(n1297), .B(n1265), .C(n1295), .D(n1272), .Z(n1267) );
    VMW_FD CallOut_reg ( .D(CallOut528), .CP(Clk), .Q(CallOut) );
    VMW_INV U350 ( .A(ScanOut[0]), .Z(n1288) );
    VMW_OR3 U292 ( .A(n1244), .B(n1247), .C(n1248), .Z(n1300) );
    VMW_AND4 U302 ( .A(n1241), .B(n1263), .C(n1264), .D(n1265), .Z(n1249) );
    VMW_AND3 U325 ( .A(n1288), .B(n1289), .C(n1280), .Z(n1233) );
    VMW_FD \MyColumn_reg[1]  ( .D(n1300), .CP(Clk), .Q(ScanOut[1]) );
    VMW_MUX2I U295 ( .A(ScanOut[1]), .B(ScanIn[1]), .S(ScanEnable), .Z(n1252)
         );
    VMW_AND2 U305 ( .A(n1259), .B(n1253), .Z(n1269) );
    VMW_AO22 U322 ( .A(ScanOut[0]), .B(n1284), .C(ScanIn[0]), .D(n1283), .Z(
        n1246) );
    VMW_OR2 U279 ( .A(n1235), .B(ColIn[2]), .Z(ColOut[2]) );
    VMW_OAI21 U339 ( .A(n1255), .B(n1271), .C(n1279), .Z(n1293) );
    VMW_INV U357 ( .A(n1273), .Z(n1277) );
    VMW_FD \MyColumn_reg[3]  ( .D(n1298), .CP(Clk), .Q(ScanOut[3]) );
    VMW_OAI211 U345 ( .A(n1296), .B(n1273), .C(n1264), .D(n1265), .Z(n1266) );
    VMW_INV U362 ( .A(n1275), .Z(n1296) );
    VMW_PULLDOWN U266 ( .Z(\NDiagOut[0] ) );
    VMW_OR2 U267 ( .A(n1230), .B(PDiagIn[7]), .Z(PDiagOut[6]) );
    VMW_OR2 U269 ( .A(n1232), .B(PDiagIn[5]), .Z(PDiagOut[4]) );
    VMW_NAND2 U287 ( .A(n1237), .B(n1240), .Z(NDiagOut[2]) );
    VMW_NOR2 U317 ( .A(PDiagIn[2]), .B(ColIn[2]), .Z(n1286) );
    VMW_AND3 U330 ( .A(ScanOut[1]), .B(ScanOut[0]), .C(n1280), .Z(n1230) );
    VMW_OR2 U272 ( .A(PDiagIn[2]), .B(n1235), .Z(PDiagOut[1]) );
    VMW_INV U355 ( .A(CallIn), .Z(n1279) );
    VMW_OR2 U285 ( .A(NDiagIn[3]), .B(n1234), .Z(NDiagOut[4]) );
    VMW_OR2 U297 ( .A(n1251), .B(n1252), .Z(n1254) );
    VMW_AO22 U320 ( .A(ScanOut[2]), .B(n1284), .C(ScanIn[2]), .D(n1283), .Z(
        n1250) );
    VMW_OAI21 U307 ( .A(n1252), .B(n1253), .C(n1259), .Z(n1271) );
    VMW_NOR3 U315 ( .A(CallIn), .B(ScanEnable), .C(n1241), .Z(n1284) );
    VMW_OR4 U332 ( .A(PDiagIn[0]), .B(n1279), .C(ColIn[0]), .D(NDiagIn[0]), 
        .Z(n1268) );
    VMW_OR4 U299 ( .A(n1257), .B(NDiagIn[6]), .C(ColIn[6]), .D(PDiagIn[6]), 
        .Z(n1256) );
    VMW_AND2 U329 ( .A(n1283), .B(CallIn), .Z(n1244) );
    VMW_INV U347 ( .A(PDiagIn[1]), .Z(n1236) );
    VMW_FD \MyColumn_reg[2]  ( .D(n1299), .CP(Clk), .Q(ScanOut[2]) );
    VMW_INV U360 ( .A(n1264), .Z(n1297) );
    VMW_NAND3 U309 ( .A(n1264), .B(n1265), .C(n1274), .Z(n1273) );
    VMW_OR4 U340 ( .A(n1294), .B(NDiagIn[5]), .C(ColIn[5]), .D(PDiagIn[5]), 
        .Z(n1275) );
    VMW_OR2 U275 ( .A(ColIn[6]), .B(n1231), .Z(ColOut[6]) );
    VMW_OR2 U282 ( .A(NDiagIn[6]), .B(n1231), .Z(NDiagOut[7]) );
    VMW_FD \MyColumn_reg[0]  ( .D(n1301), .CP(Clk), .Q(ScanOut[0]) );
    VMW_NOR2 U290 ( .A(n1242), .B(n1243), .Z(CallOut528) );
    VMW_AOI21 U300 ( .A(n1259), .B(n1260), .C(CallIn), .Z(n1258) );
    VMW_AND2 U312 ( .A(ScanOut[2]), .B(n1281), .Z(n1280) );
    VMW_AOI21 U335 ( .A(n1254), .B(n1269), .C(CallIn), .Z(n1285) );
    VMW_AND3 U327 ( .A(ScanOut[1]), .B(n1288), .C(n1282), .Z(n1235) );
    VMW_INV U349 ( .A(ScanOut[1]), .Z(n1289) );
    VMW_OR2 U283 ( .A(NDiagIn[5]), .B(n1232), .Z(NDiagOut[6]) );
    VMW_NOR2 U313 ( .A(ScanOut[3]), .B(ScanOut[2]), .Z(n1282) );
    VMW_INV U352 ( .A(NDiagIn[4]), .Z(n1292) );
    VMW_NAND4 U334 ( .A(n1290), .B(n1240), .C(n1238), .D(n1236), .Z(n1272) );
    VMW_OR2 U268 ( .A(n1231), .B(PDiagIn[6]), .Z(PDiagOut[5]) );
    VMW_NAND2 U273 ( .A(n1236), .B(n1237), .Z(PDiagOut[0]) );
    VMW_OR2 U274 ( .A(n1230), .B(ColIn[7]), .Z(ColOut[7]) );
    VMW_NOR2 U298 ( .A(n1251), .B(n1253), .Z(n1255) );
    VMW_AND2 U308 ( .A(n1272), .B(n1268), .Z(n1263) );
    VMW_OAI21 U341 ( .A(n1256), .B(n1296), .C(n1277), .Z(n1295) );
    VMW_INV U348 ( .A(ScanOut[3]), .Z(n1281) );
    VMW_INV U353 ( .A(NDiagIn[2]), .Z(n1291) );
    VMW_OR3 U291 ( .A(n1244), .B(n1245), .C(n1246), .Z(n1301) );
    VMW_MUX2I U296 ( .A(ScanOut[2]), .B(ScanIn[2]), .S(ScanEnable), .Z(n1253)
         );
    VMW_AOI211 U301 ( .A(n1241), .B(n1242), .C(n1262), .D(n1244), .Z(n1261) );
    VMW_AND2 U306 ( .A(n1252), .B(n1269), .Z(n1270) );
    VMW_AO22 U321 ( .A(ScanOut[1]), .B(n1284), .C(ScanIn[1]), .D(n1283), .Z(
        n1248) );
    VMW_AND3 U326 ( .A(ScanOut[1]), .B(ScanOut[0]), .C(n1282), .Z(n1234) );
    VMW_FD ReturnOut_reg ( .D(ReturnOut521), .CP(Clk), .Q(ReturnOut) );
    VMW_OR2 U284 ( .A(NDiagIn[4]), .B(n1233), .Z(NDiagOut[5]) );
    VMW_NAND3 U328 ( .A(ScanOut[0]), .B(n1289), .C(n1282), .Z(n1237) );
    VMW_INV U354 ( .A(NDiagIn[1]), .Z(n1240) );
    VMW_AO21 U333 ( .A(n1270), .B(n1251), .C(CallIn), .Z(n1290) );
    VMW_MUX2I U346 ( .A(ScanOut[3]), .B(ScanIn[3]), .S(ScanEnable), .Z(n1259)
         );
    VMW_INV U361 ( .A(n1293), .Z(n1294) );
    VMW_NOR2 U314 ( .A(n1284), .B(n1241), .Z(n1283) );
endmodule


module NQueens_Control_IDWIDTH4_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, Id, ScanId, CallIn, ReturnIn, 
    CallOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [3:0] Id;
input  [3:0] ScanIn;
output [3:0] ScanOut;
input  [3:0] ScanId;
input  Clk, Reset, RD, WR, CallIn, ReturnIn;
output ScanEnable, CallOut;
    wire n433, n387, n421, n406, n414, n395, n446, n428, n441, n389, n408, 
        n413, n434, n392, n426, n401, n448, n412, n393, \status[4] , n435, 
        \ScanReg[2] , n440, n409, n388, n449, \status[0] , n427, n400, n420, 
        n386, n407, \status[2] , n429, n447, \ScanReg[0] , n432, n415, n394, 
        n439, \status[6] , \ScanReg[1] , n422, n405, \status[7] , n417, n430, 
        n396, \status[3] , n445, \status[1] , n442, n437, n391, n402, n425, 
        n410, \status[5] , n411, n419, n398, \ScanReg[3] , n436, n390, n443, 
        n418, n399, n424, n403, n423, n385, n404, Logic01, n438, n444, n416, 
        n397, n431;
    tri \arr[31] , \arr[22] , \arr[11] , \arr[18] , \arr[26] , \arr[15] , 
        \arr[30] , \arr[24] , \arr[17] , \arr[29] , \arr[20] , \arr[13] , 
        \arr[3] , \arr[7] , \arr[8] , \arr[5] , \arr[9] , \arr[1] , \arr[0] , 
        \arr[6] , \arr[4] , \arr[2] , \arr[28] , \arr[21] , \arr[12] , 
        \arr[27] , \arr[25] , \arr[16] , \arr[14] , \arr[23] , \arr[10] , 
        \arr[19] ;
    assign DataOut[31] = \arr[31] ;
    assign DataOut[30] = \arr[30] ;
    assign DataOut[29] = \arr[29] ;
    assign DataOut[28] = \arr[28] ;
    assign DataOut[27] = \arr[27] ;
    assign DataOut[26] = \arr[26] ;
    assign DataOut[25] = \arr[25] ;
    assign DataOut[24] = \arr[24] ;
    assign DataOut[23] = \arr[23] ;
    assign DataOut[22] = \arr[22] ;
    assign DataOut[21] = \arr[21] ;
    assign DataOut[20] = \arr[20] ;
    assign DataOut[19] = \arr[19] ;
    assign DataOut[18] = \arr[18] ;
    assign DataOut[17] = \arr[17] ;
    assign DataOut[16] = \arr[16] ;
    assign DataOut[15] = \arr[15] ;
    assign DataOut[14] = \arr[14] ;
    assign DataOut[13] = \arr[13] ;
    assign DataOut[12] = \arr[12] ;
    assign DataOut[11] = \arr[11] ;
    assign DataOut[10] = \arr[10] ;
    assign DataOut[9] = \arr[9] ;
    assign DataOut[8] = \arr[8] ;
    assign DataOut[7] = \arr[7] ;
    assign DataOut[6] = \arr[6] ;
    assign DataOut[5] = \arr[5] ;
    assign DataOut[4] = \arr[4] ;
    assign DataOut[3] = \arr[3] ;
    assign DataOut[2] = \arr[2] ;
    assign DataOut[1] = \arr[1] ;
    assign DataOut[0] = \arr[0] ;
    assign ScanOut[3] = Logic01;
    assign ScanOut[2] = Logic01;
    assign ScanOut[1] = Logic01;
    assign ScanOut[0] = Logic01;
    VMW_PULLDOWN U96 ( .Z(n434) );
    VMW_AND4 U113 ( .A(n388), .B(n389), .C(n390), .D(n391), .Z(n447) );
    VMW_XNOR2 U134 ( .A(Addr[2]), .B(Id[2]), .Z(n399) );
    VMW_AND2 U108 ( .A(\status[5] ), .B(n387), .Z(n436) );
    VMW_INV U141 ( .A(Reset), .Z(n390) );
    VMW_BUFIZ U166 ( .A(n431), .E(n414), .Z(\arr[17] ) );
    VMW_PULLDOWN U83 ( .Z(n418) );
    VMW_PULLDOWN U84 ( .Z(n419) );
    VMW_BUFIZ U148 ( .A(n412), .E(n414), .Z(\arr[10] ) );
    VMW_BUFIZ U153 ( .A(n418), .E(n414), .Z(\arr[25] ) );
    VMW_BUFIZ U174 ( .A(n439), .E(n414), .Z(\arr[11] ) );
    VMW_FD \ScanReg_reg[1]  ( .D(ScanIn[1]), .CP(Clk), .Q(\ScanReg[1] ) );
    VMW_PULLDOWN U101 ( .Z(Logic01) );
    VMW_AND2 U106 ( .A(\status[6] ), .B(n386), .Z(n443) );
    VMW_NAND4 U121 ( .A(n405), .B(n407), .C(n390), .D(n391), .Z(n393) );
    VMW_AND2 U126 ( .A(n403), .B(n404), .Z(CallOut) );
    VMW_BUFIZ U168 ( .A(n433), .E(n414), .Z(\arr[26] ) );
    VMW_PULLDOWN U91 ( .Z(n428) );
    VMW_PULLDOWN U98 ( .Z(n438) );
    VMW_FD \ScanReg_reg[3]  ( .D(ScanIn[3]), .CP(Clk), .Q(\ScanReg[3] ) );
    VMW_AND2 U128 ( .A(n402), .B(CallIn), .Z(n406) );
    VMW_BUFIZ U154 ( .A(n419), .E(n414), .Z(\arr[16] ) );
    VMW_BUFIZ U173 ( .A(n438), .E(n414), .Z(\arr[18] ) );
    VMW_BUFIZ U146 ( .A(n410), .E(n414), .Z(\arr[0] ) );
    VMW_BUFIZ U161 ( .A(n426), .E(n414), .Z(\arr[13] ) );
    VMW_PULLDOWN U99 ( .Z(n439) );
    VMW_OAI21 U114 ( .A(n392), .B(n393), .C(n394), .Z(n448) );
    VMW_XNOR2 U133 ( .A(Addr[3]), .B(Id[3]), .Z(n400) );
    VMW_FD \status_reg[7]  ( .D(n442), .CP(Clk), .Q(\status[7] ) );
    VMW_BUFIZ U155 ( .A(n420), .E(n414), .Z(\arr[12] ) );
    VMW_BUFIZ U172 ( .A(n437), .E(n414), .Z(\arr[22] ) );
    VMW_PULLDOWN U82 ( .Z(n417) );
    VMW_BUFIZ U169 ( .A(n434), .E(n414), .Z(\arr[15] ) );
    VMW_PULLDOWN U85 ( .Z(n420) );
    VMW_PULLDOWN U90 ( .Z(n427) );
    VMW_AND2 U107 ( .A(\status[7] ), .B(n386), .Z(n442) );
    VMW_NOR2 U120 ( .A(n406), .B(CallOut), .Z(n405) );
    VMW_OAI21 U115 ( .A(n395), .B(n393), .C(n396), .Z(n449) );
    VMW_OAI21 U132 ( .A(n406), .B(n408), .C(n390), .Z(n396) );
    VMW_FD \status_reg[3]  ( .D(n446), .CP(Clk), .Q(\status[3] ) );
    VMW_PULLDOWN U97 ( .Z(n437) );
    VMW_AND2 U109 ( .A(\status[7] ), .B(n387), .Z(n435) );
    VMW_NAND2 U129 ( .A(ReturnIn), .B(n402), .Z(n407) );
    VMW_BUFIZ U147 ( .A(n411), .E(n414), .Z(\arr[23] ) );
    VMW_BUFIZ U160 ( .A(n425), .E(n414), .Z(\arr[2] ) );
    VMW_INV U140 ( .A(\status[0] ), .Z(n395) );
    VMW_BUFIZ U167 ( .A(n432), .E(n414), .Z(\arr[3] ) );
    VMW_PULLDOWN U100 ( .Z(n441) );
    VMW_OR2 U112 ( .A(n387), .B(RD), .Z(n414) );
    VMW_XNOR2 U135 ( .A(Addr[1]), .B(Id[1]), .Z(n398) );
    VMW_FD \status_reg[1]  ( .D(n448), .CP(Clk), .Q(\status[1] ) );
    VMW_AND2 U127 ( .A(n387), .B(WR), .Z(n408) );
    VMW_BUFIZ U149 ( .A(n413), .E(n414), .Z(\arr[9] ) );
    VMW_BUFIZ U152 ( .A(n417), .E(n414), .Z(\arr[14] ) );
    VMW_BUFIZ U175 ( .A(n440), .E(n414), .Z(\arr[1] ) );
    VMW_FD \status_reg[5]  ( .D(n444), .CP(Clk), .Q(\status[5] ) );
    VMW_PULLDOWN U77 ( .Z(n409) );
    VMW_PULLDOWN U79 ( .Z(n412) );
    VMW_PULLDOWN U95 ( .Z(n433) );
    VMW_AND2 U110 ( .A(\status[6] ), .B(n387), .Z(n421) );
    VMW_INV U137 ( .A(n387), .Z(n385) );
    VMW_BUFIZ U159 ( .A(n424), .E(n414), .Z(\arr[28] ) );
    VMW_AND3 U119 ( .A(n401), .B(n392), .C(\status[0] ), .Z(n404) );
    VMW_INV U142 ( .A(n393), .Z(n386) );
    VMW_FD \status_reg[4]  ( .D(n445), .CP(Clk), .Q(\status[4] ) );
    VMW_BUFIZ U165 ( .A(n430), .E(n414), .Z(\arr[24] ) );
    VMW_PULLDOWN U80 ( .Z(n413) );
    VMW_PULLDOWN U87 ( .Z(n423) );
    VMW_BUFIZ U150 ( .A(n415), .E(n414), .Z(\arr[4] ) );
    VMW_AND2 U102 ( .A(RD), .B(n385), .Z(ScanEnable) );
    VMW_AO22 U125 ( .A(\ScanReg[0] ), .B(n385), .C(\status[0] ), .D(n387), .Z(
        n410) );
    VMW_AND2 U105 ( .A(\status[5] ), .B(n386), .Z(n444) );
    VMW_FD \status_reg[0]  ( .D(n449), .CP(Clk), .Q(\status[0] ) );
    VMW_AO22 U122 ( .A(\ScanReg[3] ), .B(n385), .C(\status[3] ), .D(n387), .Z(
        n432) );
    VMW_FD \status_reg[2]  ( .D(n447), .CP(Clk), .Q(\status[2] ) );
    VMW_PULLDOWN U89 ( .Z(n426) );
    VMW_INV U139 ( .A(\status[1] ), .Z(n392) );
    VMW_BUFIZ U157 ( .A(n422), .E(n414), .Z(\arr[31] ) );
    VMW_BUFIZ U170 ( .A(n435), .E(n414), .Z(\arr[7] ) );
    VMW_PULLDOWN U92 ( .Z(n429) );
    VMW_BUFIZ U145 ( .A(n409), .E(n414), .Z(\arr[19] ) );
    VMW_BUFIZ U162 ( .A(n427), .E(n414), .Z(\arr[30] ) );
    VMW_FD \status_reg[6]  ( .D(n443), .CP(Clk), .Q(\status[6] ) );
    VMW_NOR5 U117 ( .A(\status[6] ), .B(\status[7] ), .C(\status[5] ), .D(
        \status[3] ), .E(\status[4] ), .Z(n401) );
    VMW_PULLDOWN U78 ( .Z(n411) );
    VMW_PULLDOWN U81 ( .Z(n416) );
    VMW_OAI21 U130 ( .A(n404), .B(n386), .C(n403), .Z(n388) );
    VMW_INV U138 ( .A(\status[2] ), .Z(n403) );
    VMW_BUFIZ U156 ( .A(n421), .E(n414), .Z(\arr[6] ) );
    VMW_BUFIZ U171 ( .A(n436), .E(n414), .Z(\arr[5] ) );
    VMW_PULLDOWN U86 ( .Z(n422) );
    VMW_PULLDOWN U88 ( .Z(n424) );
    VMW_PULLDOWN U93 ( .Z(n430) );
    VMW_AND2 U104 ( .A(\status[4] ), .B(n386), .Z(n445) );
    VMW_AND4 U116 ( .A(n397), .B(n398), .C(n399), .D(n400), .Z(n387) );
    VMW_AO22 U123 ( .A(\ScanReg[2] ), .B(n385), .C(\status[2] ), .D(n387), .Z(
        n425) );
    VMW_OR3 U131 ( .A(Reset), .B(n408), .C(n405), .Z(n394) );
    VMW_FD \ScanReg_reg[2]  ( .D(ScanIn[2]), .CP(Clk), .Q(\ScanReg[2] ) );
    VMW_PULLDOWN U94 ( .Z(n431) );
    VMW_INV U143 ( .A(n408), .Z(n391) );
    VMW_INV U144 ( .A(n406), .Z(n389) );
    VMW_BUFIZ U163 ( .A(n428), .E(n414), .Z(\arr[29] ) );
    VMW_BUFIZ U158 ( .A(n423), .E(n414), .Z(\arr[21] ) );
    VMW_BUFIZ U164 ( .A(n429), .E(n414), .Z(\arr[20] ) );
    VMW_AND2 U103 ( .A(\status[3] ), .B(n386), .Z(n446) );
    VMW_AND2 U111 ( .A(\status[4] ), .B(n387), .Z(n415) );
    VMW_XNOR2 U136 ( .A(Addr[0]), .B(Id[0]), .Z(n397) );
    VMW_FD \ScanReg_reg[0]  ( .D(ScanIn[0]), .CP(Clk), .Q(\ScanReg[0] ) );
    VMW_AO22 U124 ( .A(\ScanReg[1] ), .B(n385), .C(\status[1] ), .D(n387), .Z(
        n440) );
    VMW_AND4 U118 ( .A(\status[1] ), .B(n401), .C(n395), .D(n403), .Z(n402) );
    VMW_BUFIZ U151 ( .A(n416), .E(n414), .Z(\arr[27] ) );
    VMW_BUFIZ U176 ( .A(n441), .E(n414), .Z(\arr[8] ) );
endmodule


module main ( Clk, Reset, RD, WR, Addr, DataIn, DataOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  Clk, Reset, RD, WR;
    wire \wColumn_3[4] , \wNDiag_4[1] , \wPDiag_5[1] , \wPDiag_6[2] , 
        \wNDiag_7[2] , \wNDiag_1[5] , \wNDiag_2[6] , \wPDiag_3[6] , 
        \wScan_5[2] , \wScan_6[1] , \wColumn_5[3] , \wCall_6[0] , 
        \wColumn_6[0] , \wScan_0[2] , \wPDiag_5[5] , \wScan_3[1] , 
        \wCall_3[0] , \wColumn_3[0] , \wNDiag_4[5] , \wPDiag_6[6] , 
        \wNDiag_7[6] , \wColumn_5[7] , \wColumn_6[4] , \wScan_8[3] , 
        \wNDiag_1[3] , \wNDiag_1[1] , \wPDiag_3[2] , \wNDiag_2[2] , 
        \wNDiag_2[0] , \wPDiag_3[0] , \wColumn_5[5] , \wColumn_6[6] , 
        \wCall_8[0] , \wReturn_0[0] , \wColumn_3[2] , \wScan_8[1] , 
        \wScan_0[0] , \wScan_3[3] , \wPDiag_6[4] , \wNDiag_4[7] , 
        \wPDiag_5[7] , \wReturn_5[0] , \wNDiag_7[4] , \wColumn_5[1] , 
        \wColumn_6[2] , \wNDiag_1[7] , \wNDiag_2[4] , \wPDiag_3[4] , 
        \wNDiag_4[3] , \wScan_5[0] , \wScan_6[3] , \wNDiag_7[0] , 
        \wPDiag_5[3] , \wPDiag_6[0] , \wColumn_3[6] , \wColumn_4[5] , 
        \wColumn_7[6] , \wPDiag_1[3] , \wPDiag_2[0] , \wNDiag_3[0] , 
        \wScan_1[0] , \wScan_2[3] , \wPDiag_4[7] , \wPDiag_7[4] , 
        \wNDiag_5[7] , \wNDiag_6[4] , \wReturn_1[0] , \wColumn_1[1] , 
        \wColumn_2[2] , \wNDiag_3[4] , \wPDiag_1[7] , \wScan_4[0] , 
        \wPDiag_2[4] , \wScan_7[3] , \wColumn_1[5] , \wReturn_4[0] , 
        \wColumn_4[1] , \wColumn_7[2] , \wColumn_2[6] , \wNDiag_5[3] , 
        \wNDiag_6[0] , \wPDiag_4[3] , \wPDiag_7[0] , \wPDiag_4[1] , 
        \wNDiag_5[1] , \wNDiag_6[2] , \wPDiag_7[2] , \wColumn_1[7] , 
        \wColumn_2[4] , \wScanEnable[0] , \wColumn_4[3] , \wCall_7[0] , 
        \wColumn_7[0] , \wNDiag_3[6] , \wScan_1[2] , \wColumn_1[3] , 
        \wPDiag_1[5] , \wPDiag_2[6] , \wScan_7[1] , \wCall_2[0] , \wScan_4[2] , 
        \wScan_2[1] , \wColumn_2[0] , \wPDiag_4[5] , \wPDiag_7[6] , 
        \wNDiag_5[5] , \wNDiag_6[6] , \wPDiag_1[1] , \wPDiag_2[2] , 
        \wNDiag_3[2] , \wColumn_4[7] , \wColumn_7[4] , \wScan_1[3] , 
        \wColumn_1[2] , \wColumn_2[1] , \wReturn_2[0] , \wPDiag_4[4] , 
        \wScan_2[0] , \wPDiag_7[7] , \wPDiag_1[0] , \wPDiag_2[3] , 
        \wNDiag_5[4] , \wNDiag_6[7] , \wNDiag_3[3] , \wColumn_4[6] , 
        \wColumn_7[5] , \wNDiag_5[0] , \wNDiag_6[3] , \wPDiag_4[0] , 
        \wPDiag_7[3] , \wColumn_1[6] , \wColumn_2[5] , \wReturn_7[0] , 
        \wNDiag_3[7] , \wColumn_4[2] , \wColumn_7[1] , \wPDiag_1[4] , 
        \wPDiag_2[7] , \wScan_4[3] , \wScan_7[0] , \wNDiag_3[5] , 
        \wPDiag_1[6] , \wPDiag_2[5] , \wScan_4[1] , \wScan_7[2] , 
        \wColumn_1[4] , \wColumn_2[7] , \wCall_4[0] , \wColumn_4[0] , 
        \wColumn_7[3] , \wNDiag_5[2] , \wNDiag_6[1] , \wColumn_4[4] , 
        \wPDiag_4[2] , \wColumn_7[7] , \wPDiag_7[1] , \wPDiag_1[2] , 
        \wPDiag_2[1] , \wNDiag_3[1] , \wScan_1[1] , \wScan_2[2] , 
        \wPDiag_7[5] , \wPDiag_4[6] , \wCall_1[0] , \wColumn_1[0] , 
        \wNDiag_5[6] , \wNDiag_6[5] , \wColumn_2[3] , \wCall_5[0] , 
        \wColumn_5[0] , \wColumn_6[3] , \wNDiag_1[6] , \wNDiag_2[5] , 
        \wPDiag_3[5] , \wScan_5[1] , \wNDiag_4[2] , \wScan_6[2] , 
        \wNDiag_7[1] , \wPDiag_5[2] , \wPDiag_6[1] , \wNDiag_1[2] , 
        \wColumn_3[7] , \wPDiag_3[1] , \wNDiag_2[1] , \wColumn_5[4] , 
        \wColumn_6[7] , \wScan_8[0] , \wCall_0[0] , \wColumn_3[3] , 
        \wScan_0[1] , \wScan_3[2] , \wPDiag_5[6] , \wPDiag_6[5] , \wScan_0[3] , 
        \wScan_3[0] , \wNDiag_4[6] , \wNDiag_7[5] , \wPDiag_5[4] , 
        \wPDiag_6[7] , \wColumn_3[1] , \wNDiag_4[4] , \wNDiag_7[7] , 
        \wReturn_3[0] , \wColumn_5[6] , \wColumn_6[5] , \wScan_8[2] , 
        \wNDiag_1[0] , \wNDiag_2[3] , \wPDiag_3[3] , \wColumn_3[5] , 
        \wNDiag_4[0] , \wNDiag_7[3] , \wNDiag_1[4] , \wPDiag_5[0] , 
        \wPDiag_6[3] , \wNDiag_2[7] , \wPDiag_3[7] , \wScan_6[0] , 
        \wScan_5[3] , \wColumn_5[2] , \wReturn_6[0] , \wColumn_6[1] ;
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_0 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_1[3] , \wScan_1[2] , \wScan_1[1] , 
        \wScan_1[0] }), .ScanOut({\wScan_0[3] , \wScan_0[2] , \wScan_0[1] , 
        \wScan_0[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_0[0] ), .ReturnIn(\wReturn_1[0] ), .ColIn({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .PDiagIn({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .NDiagIn({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .CallOut(\wCall_1[0] ), .ReturnOut(\wReturn_0[0] ), 
        .ColOut({\wColumn_1[7] , \wColumn_1[6] , \wColumn_1[5] , 
        \wColumn_1[4] , \wColumn_1[3] , \wColumn_1[2] , \wColumn_1[1] , 
        \wColumn_1[0] }), .PDiagOut({\wPDiag_1[7] , \wPDiag_1[6] , 
        \wPDiag_1[5] , \wPDiag_1[4] , \wPDiag_1[3] , \wPDiag_1[2] , 
        \wPDiag_1[1] , \wPDiag_1[0] }), .NDiagOut({\wNDiag_1[7] , 
        \wNDiag_1[6] , \wNDiag_1[5] , \wNDiag_1[4] , \wNDiag_1[3] , 
        \wNDiag_1[2] , \wNDiag_1[1] , \wNDiag_1[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_2 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_3[3] , \wScan_3[2] , \wScan_3[1] , 
        \wScan_3[0] }), .ScanOut({\wScan_2[3] , \wScan_2[2] , \wScan_2[1] , 
        \wScan_2[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_2[0] ), .ReturnIn(\wReturn_3[0] ), .ColIn({
        \wColumn_2[7] , \wColumn_2[6] , \wColumn_2[5] , \wColumn_2[4] , 
        \wColumn_2[3] , \wColumn_2[2] , \wColumn_2[1] , \wColumn_2[0] }), 
        .PDiagIn({\wPDiag_2[7] , \wPDiag_2[6] , \wPDiag_2[5] , \wPDiag_2[4] , 
        \wPDiag_2[3] , \wPDiag_2[2] , \wPDiag_2[1] , \wPDiag_2[0] }), 
        .NDiagIn({\wNDiag_2[7] , \wNDiag_2[6] , \wNDiag_2[5] , \wNDiag_2[4] , 
        \wNDiag_2[3] , \wNDiag_2[2] , \wNDiag_2[1] , \wNDiag_2[0] }), 
        .CallOut(\wCall_3[0] ), .ReturnOut(\wReturn_2[0] ), .ColOut({
        \wColumn_3[7] , \wColumn_3[6] , \wColumn_3[5] , \wColumn_3[4] , 
        \wColumn_3[3] , \wColumn_3[2] , \wColumn_3[1] , \wColumn_3[0] }), 
        .PDiagOut({\wPDiag_3[7] , \wPDiag_3[6] , \wPDiag_3[5] , \wPDiag_3[4] , 
        \wPDiag_3[3] , \wPDiag_3[2] , \wPDiag_3[1] , \wPDiag_3[0] }), 
        .NDiagOut({\wNDiag_3[7] , \wNDiag_3[6] , \wNDiag_3[5] , \wNDiag_3[4] , 
        \wNDiag_3[3] , \wNDiag_3[2] , \wNDiag_3[1] , \wNDiag_3[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_3 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_4[3] , \wScan_4[2] , \wScan_4[1] , 
        \wScan_4[0] }), .ScanOut({\wScan_3[3] , \wScan_3[2] , \wScan_3[1] , 
        \wScan_3[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_3[0] ), .ReturnIn(\wReturn_4[0] ), .ColIn({
        \wColumn_3[7] , \wColumn_3[6] , \wColumn_3[5] , \wColumn_3[4] , 
        \wColumn_3[3] , \wColumn_3[2] , \wColumn_3[1] , \wColumn_3[0] }), 
        .PDiagIn({\wPDiag_3[7] , \wPDiag_3[6] , \wPDiag_3[5] , \wPDiag_3[4] , 
        \wPDiag_3[3] , \wPDiag_3[2] , \wPDiag_3[1] , \wPDiag_3[0] }), 
        .NDiagIn({\wNDiag_3[7] , \wNDiag_3[6] , \wNDiag_3[5] , \wNDiag_3[4] , 
        \wNDiag_3[3] , \wNDiag_3[2] , \wNDiag_3[1] , \wNDiag_3[0] }), 
        .CallOut(\wCall_4[0] ), .ReturnOut(\wReturn_3[0] ), .ColOut({
        \wColumn_4[7] , \wColumn_4[6] , \wColumn_4[5] , \wColumn_4[4] , 
        \wColumn_4[3] , \wColumn_4[2] , \wColumn_4[1] , \wColumn_4[0] }), 
        .PDiagOut({\wPDiag_4[7] , \wPDiag_4[6] , \wPDiag_4[5] , \wPDiag_4[4] , 
        \wPDiag_4[3] , \wPDiag_4[2] , \wPDiag_4[1] , \wPDiag_4[0] }), 
        .NDiagOut({\wNDiag_4[7] , \wNDiag_4[6] , \wNDiag_4[5] , \wNDiag_4[4] , 
        \wNDiag_4[3] , \wNDiag_4[2] , \wNDiag_4[1] , \wNDiag_4[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_4 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_5[3] , \wScan_5[2] , \wScan_5[1] , 
        \wScan_5[0] }), .ScanOut({\wScan_4[3] , \wScan_4[2] , \wScan_4[1] , 
        \wScan_4[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_4[0] ), .ReturnIn(\wReturn_5[0] ), .ColIn({
        \wColumn_4[7] , \wColumn_4[6] , \wColumn_4[5] , \wColumn_4[4] , 
        \wColumn_4[3] , \wColumn_4[2] , \wColumn_4[1] , \wColumn_4[0] }), 
        .PDiagIn({\wPDiag_4[7] , \wPDiag_4[6] , \wPDiag_4[5] , \wPDiag_4[4] , 
        \wPDiag_4[3] , \wPDiag_4[2] , \wPDiag_4[1] , \wPDiag_4[0] }), 
        .NDiagIn({\wNDiag_4[7] , \wNDiag_4[6] , \wNDiag_4[5] , \wNDiag_4[4] , 
        \wNDiag_4[3] , \wNDiag_4[2] , \wNDiag_4[1] , \wNDiag_4[0] }), 
        .CallOut(\wCall_5[0] ), .ReturnOut(\wReturn_4[0] ), .ColOut({
        \wColumn_5[7] , \wColumn_5[6] , \wColumn_5[5] , \wColumn_5[4] , 
        \wColumn_5[3] , \wColumn_5[2] , \wColumn_5[1] , \wColumn_5[0] }), 
        .PDiagOut({\wPDiag_5[7] , \wPDiag_5[6] , \wPDiag_5[5] , \wPDiag_5[4] , 
        \wPDiag_5[3] , \wPDiag_5[2] , \wPDiag_5[1] , \wPDiag_5[0] }), 
        .NDiagOut({\wNDiag_5[7] , \wNDiag_5[6] , \wNDiag_5[5] , \wNDiag_5[4] , 
        \wNDiag_5[3] , \wNDiag_5[2] , \wNDiag_5[1] , \wNDiag_5[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_5 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_6[3] , \wScan_6[2] , \wScan_6[1] , 
        \wScan_6[0] }), .ScanOut({\wScan_5[3] , \wScan_5[2] , \wScan_5[1] , 
        \wScan_5[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_5[0] ), .ReturnIn(\wReturn_6[0] ), .ColIn({
        \wColumn_5[7] , \wColumn_5[6] , \wColumn_5[5] , \wColumn_5[4] , 
        \wColumn_5[3] , \wColumn_5[2] , \wColumn_5[1] , \wColumn_5[0] }), 
        .PDiagIn({\wPDiag_5[7] , \wPDiag_5[6] , \wPDiag_5[5] , \wPDiag_5[4] , 
        \wPDiag_5[3] , \wPDiag_5[2] , \wPDiag_5[1] , \wPDiag_5[0] }), 
        .NDiagIn({\wNDiag_5[7] , \wNDiag_5[6] , \wNDiag_5[5] , \wNDiag_5[4] , 
        \wNDiag_5[3] , \wNDiag_5[2] , \wNDiag_5[1] , \wNDiag_5[0] }), 
        .CallOut(\wCall_6[0] ), .ReturnOut(\wReturn_5[0] ), .ColOut({
        \wColumn_6[7] , \wColumn_6[6] , \wColumn_6[5] , \wColumn_6[4] , 
        \wColumn_6[3] , \wColumn_6[2] , \wColumn_6[1] , \wColumn_6[0] }), 
        .PDiagOut({\wPDiag_6[7] , \wPDiag_6[6] , \wPDiag_6[5] , \wPDiag_6[4] , 
        \wPDiag_6[3] , \wPDiag_6[2] , \wPDiag_6[1] , \wPDiag_6[0] }), 
        .NDiagOut({\wNDiag_6[7] , \wNDiag_6[6] , \wNDiag_6[5] , \wNDiag_6[4] , 
        \wNDiag_6[3] , \wNDiag_6[2] , \wNDiag_6[1] , \wNDiag_6[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_1 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_2[3] , \wScan_2[2] , \wScan_2[1] , 
        \wScan_2[0] }), .ScanOut({\wScan_1[3] , \wScan_1[2] , \wScan_1[1] , 
        \wScan_1[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_1[0] ), .ReturnIn(\wReturn_2[0] ), .ColIn({
        \wColumn_1[7] , \wColumn_1[6] , \wColumn_1[5] , \wColumn_1[4] , 
        \wColumn_1[3] , \wColumn_1[2] , \wColumn_1[1] , \wColumn_1[0] }), 
        .PDiagIn({\wPDiag_1[7] , \wPDiag_1[6] , \wPDiag_1[5] , \wPDiag_1[4] , 
        \wPDiag_1[3] , \wPDiag_1[2] , \wPDiag_1[1] , \wPDiag_1[0] }), 
        .NDiagIn({\wNDiag_1[7] , \wNDiag_1[6] , \wNDiag_1[5] , \wNDiag_1[4] , 
        \wNDiag_1[3] , \wNDiag_1[2] , \wNDiag_1[1] , \wNDiag_1[0] }), 
        .CallOut(\wCall_2[0] ), .ReturnOut(\wReturn_1[0] ), .ColOut({
        \wColumn_2[7] , \wColumn_2[6] , \wColumn_2[5] , \wColumn_2[4] , 
        \wColumn_2[3] , \wColumn_2[2] , \wColumn_2[1] , \wColumn_2[0] }), 
        .PDiagOut({\wPDiag_2[7] , \wPDiag_2[6] , \wPDiag_2[5] , \wPDiag_2[4] , 
        \wPDiag_2[3] , \wPDiag_2[2] , \wPDiag_2[1] , \wPDiag_2[0] }), 
        .NDiagOut({\wNDiag_2[7] , \wNDiag_2[6] , \wNDiag_2[5] , \wNDiag_2[4] , 
        \wNDiag_2[3] , \wNDiag_2[2] , \wNDiag_2[1] , \wNDiag_2[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_6 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_7[3] , \wScan_7[2] , \wScan_7[1] , 
        \wScan_7[0] }), .ScanOut({\wScan_6[3] , \wScan_6[2] , \wScan_6[1] , 
        \wScan_6[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_6[0] ), .ReturnIn(\wReturn_7[0] ), .ColIn({
        \wColumn_6[7] , \wColumn_6[6] , \wColumn_6[5] , \wColumn_6[4] , 
        \wColumn_6[3] , \wColumn_6[2] , \wColumn_6[1] , \wColumn_6[0] }), 
        .PDiagIn({\wPDiag_6[7] , \wPDiag_6[6] , \wPDiag_6[5] , \wPDiag_6[4] , 
        \wPDiag_6[3] , \wPDiag_6[2] , \wPDiag_6[1] , \wPDiag_6[0] }), 
        .NDiagIn({\wNDiag_6[7] , \wNDiag_6[6] , \wNDiag_6[5] , \wNDiag_6[4] , 
        \wNDiag_6[3] , \wNDiag_6[2] , \wNDiag_6[1] , \wNDiag_6[0] }), 
        .CallOut(\wCall_7[0] ), .ReturnOut(\wReturn_6[0] ), .ColOut({
        \wColumn_7[7] , \wColumn_7[6] , \wColumn_7[5] , \wColumn_7[4] , 
        \wColumn_7[3] , \wColumn_7[2] , \wColumn_7[1] , \wColumn_7[0] }), 
        .PDiagOut({\wPDiag_7[7] , \wPDiag_7[6] , \wPDiag_7[5] , \wPDiag_7[4] , 
        \wPDiag_7[3] , \wPDiag_7[2] , \wPDiag_7[1] , \wPDiag_7[0] }), 
        .NDiagOut({\wNDiag_7[7] , \wNDiag_7[6] , \wNDiag_7[5] , \wNDiag_7[4] , 
        \wNDiag_7[3] , \wNDiag_7[2] , \wNDiag_7[1] , \wNDiag_7[0] }) );
    NQueens_Node_WIDTH8_IDWIDTH4_SCAN1 U_NQueens_Node_7 ( .Clk(Clk), .Reset(
        Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(
        DataOut), .ScanIn({\wScan_8[3] , \wScan_8[2] , \wScan_8[1] , 
        \wScan_8[0] }), .ScanOut({\wScan_7[3] , \wScan_7[2] , \wScan_7[1] , 
        \wScan_7[0] }), .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 
        1'b0}), .CallIn(\wCall_7[0] ), .ReturnIn(1'b0), .ColIn({\wColumn_7[7] , 
        \wColumn_7[6] , \wColumn_7[5] , \wColumn_7[4] , \wColumn_7[3] , 
        \wColumn_7[2] , \wColumn_7[1] , \wColumn_7[0] }), .PDiagIn({
        \wPDiag_7[7] , \wPDiag_7[6] , \wPDiag_7[5] , \wPDiag_7[4] , 
        \wPDiag_7[3] , \wPDiag_7[2] , \wPDiag_7[1] , \wPDiag_7[0] }), 
        .NDiagIn({\wNDiag_7[7] , \wNDiag_7[6] , \wNDiag_7[5] , \wNDiag_7[4] , 
        \wNDiag_7[3] , \wNDiag_7[2] , \wNDiag_7[1] , \wNDiag_7[0] }), 
        .CallOut(\wCall_8[0] ), .ReturnOut(\wReturn_7[0] ) );
    NQueens_Control_IDWIDTH4_SCAN1 U_NQueens_Control ( .Clk(Clk), .Reset(Reset
        ), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
        .ScanIn({\wScan_0[3] , \wScan_0[2] , \wScan_0[1] , \wScan_0[0] }), 
        .ScanOut({\wScan_8[3] , \wScan_8[2] , \wScan_8[1] , \wScan_8[0] }), 
        .ScanEnable(\wScanEnable[0] ), .Id({1'b0, 1'b0, 1'b0, 1'b1}), .ScanId(
        {1'b0, 1'b0, 1'b0, 1'b0}), .CallIn(\wCall_8[0] ), .ReturnIn(
        \wReturn_0[0] ), .CallOut(\wCall_0[0] ) );
endmodule

