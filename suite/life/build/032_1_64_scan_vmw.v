
module CELL_DUMMY0_DW01_add_5_0 ( A, B, CI, SUM, CO );
input  [4:0] A;
input  [4:0] B;
output [4:0] SUM;
input  CI;
output CO;
    wire n1, \carry[2] , n2, n3, \carry[1] ;
    VMW_PULLDOWN U1 ( .Z(n1) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(n2), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_PULLDOWN U2 ( .Z(n2) );
    VMW_FADD U1_2 ( .CI(\carry[2] ), .A(A[2]), .B(n1), .S(SUM[2]), .CO(SUM[3])
         );
    VMW_FADD U1_0 ( .CI(n3), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
         );
    VMW_PULLDOWN U3 ( .Z(n3) );
endmodule


module CELL_DUMMY0_DW01_add_6_0 ( A, B, CI, SUM, CO );
input  [5:0] A;
input  [5:0] B;
output [5:0] SUM;
input  CI;
output CO;
    wire n4, n6, n7, \carry[2] , n5, \carry[3] , \carry[1] ;
    VMW_PULLDOWN U1 ( .Z(n4) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(n6), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_PULLDOWN U2 ( .Z(n5) );
    VMW_FADD U1_2 ( .CI(\carry[2] ), .A(A[2]), .B(n5), .S(SUM[2]), .CO(
        \carry[3] ) );
    VMW_FADD U1_0 ( .CI(n7), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
         );
    VMW_PULLDOWN U3 ( .Z(n6) );
    VMW_PULLDOWN U4 ( .Z(n7) );
    VMW_FADD U1_3 ( .CI(\carry[3] ), .A(A[3]), .B(n4), .S(SUM[3]), .CO(SUM[4])
         );
endmodule


module CELL_DUMMY0_DW01_add_7_0 ( A, B, CI, SUM, CO );
input  [6:0] A;
input  [6:0] B;
output [6:0] SUM;
input  CI;
output CO;
    wire n8, n9, \carry[4] , n12, \carry[2] , n10, n11, \carry[3] , \carry[1] ;
    VMW_PULLDOWN U1 ( .Z(n8) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(n11), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_PULLDOWN U2 ( .Z(n9) );
    VMW_PULLDOWN U5 ( .Z(n12) );
    VMW_FADD U1_2 ( .CI(\carry[2] ), .A(A[2]), .B(n10), .S(SUM[2]), .CO(
        \carry[3] ) );
    VMW_FADD U1_0 ( .CI(n12), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
         );
    VMW_PULLDOWN U3 ( .Z(n10) );
    VMW_PULLDOWN U4 ( .Z(n11) );
    VMW_FADD U1_4 ( .CI(\carry[4] ), .A(A[4]), .B(n8), .S(SUM[4]), .CO(SUM[5])
         );
    VMW_FADD U1_3 ( .CI(\carry[3] ), .A(A[3]), .B(n9), .S(SUM[3]), .CO(
        \carry[4] ) );
endmodule


module CELL_DUMMY0_DW01_add_8_0 ( A, B, CI, SUM, CO );
input  [7:0] A;
input  [7:0] B;
output [7:0] SUM;
input  CI;
output CO;
    wire n13, n15, \carry[4] , \carry[2] , n14, n16, n17, n18, \carry[3] , 
        \carry[1] , \carry[5] ;
    VMW_PULLDOWN U1 ( .Z(n13) );
    VMW_PULLDOWN U6 ( .Z(n18) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(n17), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_PULLDOWN U2 ( .Z(n14) );
    VMW_PULLDOWN U5 ( .Z(n17) );
    VMW_FADD U1_2 ( .CI(\carry[2] ), .A(A[2]), .B(n16), .S(SUM[2]), .CO(
        \carry[3] ) );
    VMW_FADD U1_0 ( .CI(n18), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
         );
    VMW_PULLDOWN U3 ( .Z(n15) );
    VMW_FADD U1_5 ( .CI(\carry[5] ), .A(A[5]), .B(n13), .S(SUM[5]), .CO(SUM[6]
        ) );
    VMW_PULLDOWN U4 ( .Z(n16) );
    VMW_FADD U1_4 ( .CI(\carry[4] ), .A(A[4]), .B(n14), .S(SUM[4]), .CO(
        \carry[5] ) );
    VMW_FADD U1_3 ( .CI(\carry[3] ), .A(A[3]), .B(n15), .S(SUM[3]), .CO(
        \carry[4] ) );
endmodule


module CELL_DUMMY0 ( DATA_IN, cell_value, Reset, WR, Enable, Clk, NEIGHBORS );
input  [7:0] NEIGHBORS;
input  DATA_IN, Reset, WR, Enable, Clk;
output cell_value;
    wire n759, n776, \count75[6] , n758, n764, \count358[3] , \count353[1] , 
        \count75[4] , \count75[0] , \count75[2] , n771, n757, \count358[1] , 
        n763, n762, n770, \count363[2] , \count368[4] , \count368[0] , 
        \count368[2] , n773, n775, \count363[5] , \count368[6] , n765, 
        \count363[0] , n767, \count363[4] , \count368[3] , n375, \count75[5] , 
        n769, n772, \count363[3] , \count363[1] , \count368[1] , n760, 
        \count368[5] , \count353[2] , n768, \count358[0] , n774, \count358[4] , 
        n761, \count75[1] , \count75[3] , n766, \count358[2] , \count353[0] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 ;
    VMW_PULLDOWN U123 ( .Z(n759) );
    VMW_PULLDOWN U125 ( .Z(n774) );
    VMW_PULLDOWN U126 ( .Z(n775) );
    VMW_AND2 U134 ( .A(NEIGHBORS[3]), .B(n758), .Z(n760) );
    VMW_XOR2 U141 ( .A(NEIGHBORS[3]), .B(n758), .Z(\count353[0] ) );
    VMW_INV U148 ( .A(\count75[1] ), .Z(n766) );
    VMW_PULLDOWN U127 ( .Z(n776) );
    VMW_PULLDOWN U128 ( .Z(n375) );
    CELL_DUMMY0_DW01_add_7_0 add_62_6 ( .A({n375, \count363[5] , \count363[4] , 
        \count363[3] , \count363[2] , \count363[1] , \count363[0] }), .B({n774, 
        n774, n774, n774, n774, n774, NEIGHBORS[6]}), .CI(n774), .SUM({
        UNCONNECTED_1, \count368[5] , \count368[4] , \count368[3] , 
        \count368[2] , \count368[1] , \count368[0] }) );
    VMW_PULLDOWN U129 ( .Z(\count358[4] ) );
    VMW_OR3 U132 ( .A(\count75[5] ), .B(\count75[4] ), .C(\count75[6] ), .Z(
        n767) );
    VMW_AND3 U133 ( .A(n757), .B(n758), .C(NEIGHBORS[3]), .Z(\count353[2] ) );
    VMW_MUX2I U146 ( .A(n768), .B(cell_value), .S(n761), .Z(n764) );
    CELL_DUMMY0_DW01_add_8_0 add_62_7 ( .A({n375, \count368[6] , \count368[5] , 
        \count368[4] , \count368[3] , \count368[2] , \count368[1] , 
        \count368[0] }), .B({n773, n773, n773, n773, n773, n773, n773, 
        NEIGHBORS[7]}), .CI(n773), .SUM({UNCONNECTED_2, \count75[6] , 
        \count75[5] , \count75[4] , \count75[3] , \count75[2] , \count75[1] , 
        \count75[0] }) );
    VMW_OR2 U147 ( .A(Reset), .B(n770), .Z(n771) );
    VMW_AND2 U135 ( .A(\count75[0] ), .B(n762), .Z(n761) );
    VMW_XOR2 U140 ( .A(n757), .B(n760), .Z(\count353[1] ) );
    VMW_XOR2 U137 ( .A(NEIGHBORS[1]), .B(NEIGHBORS[0]), .Z(n765) );
    VMW_INV U149 ( .A(cell_value), .Z(n769) );
    VMW_OR2 U142 ( .A(n762), .B(n769), .Z(n768) );
    VMW_FD cell_value_reg ( .D(n772), .CP(Clk), .Q(cell_value) );
    VMW_PULLDOWN U130 ( .Z(\count363[5] ) );
    VMW_NOR4 U139 ( .A(\count75[3] ), .B(\count75[2] ), .C(n766), .D(n767), 
        .Z(n762) );
    CELL_DUMMY0_DW01_add_6_0 add_62_5 ( .A({n375, \count358[4] , \count358[3] , 
        \count358[2] , \count358[1] , \count358[0] }), .B({n775, n775, n775, 
        n775, n775, NEIGHBORS[5]}), .CI(n775), .SUM({UNCONNECTED_3, 
        \count363[4] , \count363[3] , \count363[2] , \count363[1] , 
        \count363[0] }) );
    VMW_AO22 U145 ( .A(NEIGHBORS[1]), .B(NEIGHBORS[0]), .C(NEIGHBORS[2]), .D(
        n765), .Z(n757) );
    VMW_XOR2 U138 ( .A(NEIGHBORS[2]), .B(n765), .Z(n758) );
    VMW_PULLDOWN U124 ( .Z(n773) );
    VMW_PULLDOWN U131 ( .Z(\count368[6] ) );
    CELL_DUMMY0_DW01_add_5_0 add_62_4 ( .A({n375, n759, \count353[2] , 
        \count353[1] , \count353[0] }), .B({n776, n776, n776, n776, 
        NEIGHBORS[4]}), .CI(n776), .SUM({UNCONNECTED_4, \count358[3] , 
        \count358[2] , \count358[1] , \count358[0] }) );
    VMW_AOI211 U136 ( .A(n764), .B(Enable), .C(WR), .D(Reset), .Z(n763) );
    VMW_MUX2I U143 ( .A(n769), .B(DATA_IN), .S(WR), .Z(n770) );
    VMW_MUX2I U144 ( .A(n771), .B(n769), .S(n763), .Z(n772) );
endmodule


module Life_Block_IDWIDTH1_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, DataOut, 
    ScanIn, ScanOut, ScanEnable, Id, Enable, BLOCK_VALUE, NORTH_EDGE, 
    SOUTH_EDGE, EAST_EDGE, WEST_EDGE, NW_EDGE, SW_EDGE, NE_EDGE, SE_EDGE );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Id;
input  [31:0] ScanIn;
output [31:0] ScanOut;
output [31:0] BLOCK_VALUE;
input  [31:0] NORTH_EDGE;
input  [31:0] SOUTH_EDGE;
input  Clk, Reset, RD, WR, ScanEnable, Enable, EAST_EDGE, WEST_EDGE, NW_EDGE, 
    SW_EDGE, NE_EDGE, SE_EDGE;
    wire \BLOCK_VALUE[31] , \BLOCK_VALUE[5] , \BLOCK_VALUE[1] , 
        \BLOCK_VALUE[8] , \BLOCK_VALUE[7] , \BLOCK_VALUE[3] , 
        \BLOCK_VALUE[25] , \BLOCK_VALUE[16] , \BLOCK_VALUE[21] , 
        \BLOCK_VALUE[12] , \BLOCK_VALUE[28] , \BLOCK_VALUE[19] , 
        \BLOCK_VALUE[23] , \BLOCK_VALUE[10] , \BLOCK_VALUE[27] , 
        \BLOCK_VALUE[14] , \BLOCK_VALUE[26] , \BLOCK_VALUE[15] , 
        \BLOCK_VALUE[18] , \BLOCK_VALUE[22] , \BLOCK_VALUE[11] , 
        \BLOCK_VALUE[20] , \BLOCK_VALUE[13] , \BLOCK_VALUE[30] , 
        \BLOCK_VALUE[29] , \BLOCK_VALUE[24] , \BLOCK_VALUE[17] , 
        \BLOCK_VALUE[2] , \BLOCK_VALUE[6] , \BLOCK_VALUE[4] , \BLOCK_VALUE[0] , 
        \BLOCK_VALUE[9] ;
    assign ScanOut[31] = \BLOCK_VALUE[31] ;
    assign ScanOut[30] = \BLOCK_VALUE[30] ;
    assign ScanOut[29] = \BLOCK_VALUE[29] ;
    assign ScanOut[28] = \BLOCK_VALUE[28] ;
    assign ScanOut[27] = \BLOCK_VALUE[27] ;
    assign ScanOut[26] = \BLOCK_VALUE[26] ;
    assign ScanOut[25] = \BLOCK_VALUE[25] ;
    assign ScanOut[24] = \BLOCK_VALUE[24] ;
    assign ScanOut[23] = \BLOCK_VALUE[23] ;
    assign ScanOut[22] = \BLOCK_VALUE[22] ;
    assign ScanOut[21] = \BLOCK_VALUE[21] ;
    assign ScanOut[20] = \BLOCK_VALUE[20] ;
    assign ScanOut[19] = \BLOCK_VALUE[19] ;
    assign ScanOut[18] = \BLOCK_VALUE[18] ;
    assign ScanOut[17] = \BLOCK_VALUE[17] ;
    assign ScanOut[16] = \BLOCK_VALUE[16] ;
    assign ScanOut[15] = \BLOCK_VALUE[15] ;
    assign ScanOut[14] = \BLOCK_VALUE[14] ;
    assign ScanOut[13] = \BLOCK_VALUE[13] ;
    assign ScanOut[12] = \BLOCK_VALUE[12] ;
    assign ScanOut[11] = \BLOCK_VALUE[11] ;
    assign ScanOut[10] = \BLOCK_VALUE[10] ;
    assign ScanOut[9] = \BLOCK_VALUE[9] ;
    assign ScanOut[8] = \BLOCK_VALUE[8] ;
    assign ScanOut[7] = \BLOCK_VALUE[7] ;
    assign ScanOut[6] = \BLOCK_VALUE[6] ;
    assign ScanOut[5] = \BLOCK_VALUE[5] ;
    assign ScanOut[4] = \BLOCK_VALUE[4] ;
    assign ScanOut[3] = \BLOCK_VALUE[3] ;
    assign ScanOut[2] = \BLOCK_VALUE[2] ;
    assign ScanOut[1] = \BLOCK_VALUE[1] ;
    assign ScanOut[0] = \BLOCK_VALUE[0] ;
    assign BLOCK_VALUE[31] = \BLOCK_VALUE[31] ;
    assign BLOCK_VALUE[30] = \BLOCK_VALUE[30] ;
    assign BLOCK_VALUE[29] = \BLOCK_VALUE[29] ;
    assign BLOCK_VALUE[28] = \BLOCK_VALUE[28] ;
    assign BLOCK_VALUE[27] = \BLOCK_VALUE[27] ;
    assign BLOCK_VALUE[26] = \BLOCK_VALUE[26] ;
    assign BLOCK_VALUE[25] = \BLOCK_VALUE[25] ;
    assign BLOCK_VALUE[24] = \BLOCK_VALUE[24] ;
    assign BLOCK_VALUE[23] = \BLOCK_VALUE[23] ;
    assign BLOCK_VALUE[22] = \BLOCK_VALUE[22] ;
    assign BLOCK_VALUE[21] = \BLOCK_VALUE[21] ;
    assign BLOCK_VALUE[20] = \BLOCK_VALUE[20] ;
    assign BLOCK_VALUE[19] = \BLOCK_VALUE[19] ;
    assign BLOCK_VALUE[18] = \BLOCK_VALUE[18] ;
    assign BLOCK_VALUE[17] = \BLOCK_VALUE[17] ;
    assign BLOCK_VALUE[16] = \BLOCK_VALUE[16] ;
    assign BLOCK_VALUE[15] = \BLOCK_VALUE[15] ;
    assign BLOCK_VALUE[14] = \BLOCK_VALUE[14] ;
    assign BLOCK_VALUE[13] = \BLOCK_VALUE[13] ;
    assign BLOCK_VALUE[12] = \BLOCK_VALUE[12] ;
    assign BLOCK_VALUE[11] = \BLOCK_VALUE[11] ;
    assign BLOCK_VALUE[10] = \BLOCK_VALUE[10] ;
    assign BLOCK_VALUE[9] = \BLOCK_VALUE[9] ;
    assign BLOCK_VALUE[8] = \BLOCK_VALUE[8] ;
    assign BLOCK_VALUE[7] = \BLOCK_VALUE[7] ;
    assign BLOCK_VALUE[6] = \BLOCK_VALUE[6] ;
    assign BLOCK_VALUE[5] = \BLOCK_VALUE[5] ;
    assign BLOCK_VALUE[4] = \BLOCK_VALUE[4] ;
    assign BLOCK_VALUE[3] = \BLOCK_VALUE[3] ;
    assign BLOCK_VALUE[2] = \BLOCK_VALUE[2] ;
    assign BLOCK_VALUE[1] = \BLOCK_VALUE[1] ;
    assign BLOCK_VALUE[0] = \BLOCK_VALUE[0] ;
    CELL_DUMMY0 cell_4 ( .DATA_IN(ScanIn[4]), .cell_value(\BLOCK_VALUE[4] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[5], \BLOCK_VALUE[5] , SOUTH_EDGE[5], 
        SOUTH_EDGE[4], SOUTH_EDGE[3], \BLOCK_VALUE[3] , NORTH_EDGE[3], 
        NORTH_EDGE[4]}) );
    CELL_DUMMY0 cell_15 ( .DATA_IN(ScanIn[15]), .cell_value(\BLOCK_VALUE[15] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[16], \BLOCK_VALUE[16] , SOUTH_EDGE[16], 
        SOUTH_EDGE[15], SOUTH_EDGE[14], \BLOCK_VALUE[14] , NORTH_EDGE[14], 
        NORTH_EDGE[15]}) );
    CELL_DUMMY0 cell_29 ( .DATA_IN(ScanIn[29]), .cell_value(\BLOCK_VALUE[29] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[30], \BLOCK_VALUE[30] , SOUTH_EDGE[30], 
        SOUTH_EDGE[29], SOUTH_EDGE[28], \BLOCK_VALUE[28] , NORTH_EDGE[28], 
        NORTH_EDGE[29]}) );
    CELL_DUMMY0 cell_3 ( .DATA_IN(ScanIn[3]), .cell_value(\BLOCK_VALUE[3] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[4], \BLOCK_VALUE[4] , SOUTH_EDGE[4], 
        SOUTH_EDGE[3], SOUTH_EDGE[2], \BLOCK_VALUE[2] , NORTH_EDGE[2], 
        NORTH_EDGE[3]}) );
    CELL_DUMMY0 cell_20 ( .DATA_IN(ScanIn[20]), .cell_value(\BLOCK_VALUE[20] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[21], \BLOCK_VALUE[21] , SOUTH_EDGE[21], 
        SOUTH_EDGE[20], SOUTH_EDGE[19], \BLOCK_VALUE[19] , NORTH_EDGE[19], 
        NORTH_EDGE[20]}) );
    CELL_DUMMY0 cell_27 ( .DATA_IN(ScanIn[27]), .cell_value(\BLOCK_VALUE[27] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[28], \BLOCK_VALUE[28] , SOUTH_EDGE[28], 
        SOUTH_EDGE[27], SOUTH_EDGE[26], \BLOCK_VALUE[26] , NORTH_EDGE[26], 
        NORTH_EDGE[27]}) );
    CELL_DUMMY0 cell_12 ( .DATA_IN(ScanIn[12]), .cell_value(\BLOCK_VALUE[12] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[13], \BLOCK_VALUE[13] , SOUTH_EDGE[13], 
        SOUTH_EDGE[12], SOUTH_EDGE[11], \BLOCK_VALUE[11] , NORTH_EDGE[11], 
        NORTH_EDGE[12]}) );
    CELL_DUMMY0 cell_26 ( .DATA_IN(ScanIn[26]), .cell_value(\BLOCK_VALUE[26] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[27], \BLOCK_VALUE[27] , SOUTH_EDGE[27], 
        SOUTH_EDGE[26], SOUTH_EDGE[25], \BLOCK_VALUE[25] , NORTH_EDGE[25], 
        NORTH_EDGE[26]}) );
    CELL_DUMMY0 cell_2 ( .DATA_IN(ScanIn[2]), .cell_value(\BLOCK_VALUE[2] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[3], \BLOCK_VALUE[3] , SOUTH_EDGE[3], 
        SOUTH_EDGE[2], SOUTH_EDGE[1], \BLOCK_VALUE[1] , NORTH_EDGE[1], 
        NORTH_EDGE[2]}) );
    CELL_DUMMY0 cell_5 ( .DATA_IN(ScanIn[5]), .cell_value(\BLOCK_VALUE[5] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[6], \BLOCK_VALUE[6] , SOUTH_EDGE[6], 
        SOUTH_EDGE[5], SOUTH_EDGE[4], \BLOCK_VALUE[4] , NORTH_EDGE[4], 
        NORTH_EDGE[5]}) );
    CELL_DUMMY0 cell_13 ( .DATA_IN(ScanIn[13]), .cell_value(\BLOCK_VALUE[13] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[14], \BLOCK_VALUE[14] , SOUTH_EDGE[14], 
        SOUTH_EDGE[13], SOUTH_EDGE[12], \BLOCK_VALUE[12] , NORTH_EDGE[12], 
        NORTH_EDGE[13]}) );
    CELL_DUMMY0 cell_14 ( .DATA_IN(ScanIn[14]), .cell_value(\BLOCK_VALUE[14] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[15], \BLOCK_VALUE[15] , SOUTH_EDGE[15], 
        SOUTH_EDGE[14], SOUTH_EDGE[13], \BLOCK_VALUE[13] , NORTH_EDGE[13], 
        NORTH_EDGE[14]}) );
    CELL_DUMMY0 cell_21 ( .DATA_IN(ScanIn[21]), .cell_value(\BLOCK_VALUE[21] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[22], \BLOCK_VALUE[22] , SOUTH_EDGE[22], 
        SOUTH_EDGE[21], SOUTH_EDGE[20], \BLOCK_VALUE[20] , NORTH_EDGE[20], 
        NORTH_EDGE[21]}) );
    CELL_DUMMY0 cell_28 ( .DATA_IN(ScanIn[28]), .cell_value(\BLOCK_VALUE[28] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[29], \BLOCK_VALUE[29] , SOUTH_EDGE[29], 
        SOUTH_EDGE[28], SOUTH_EDGE[27], \BLOCK_VALUE[27] , NORTH_EDGE[27], 
        NORTH_EDGE[28]}) );
    CELL_DUMMY0 cell_0 ( .DATA_IN(ScanIn[0]), .cell_value(\BLOCK_VALUE[0] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[1], \BLOCK_VALUE[1] , SOUTH_EDGE[1], 
        SOUTH_EDGE[0], SE_EDGE, EAST_EDGE, NE_EDGE, NORTH_EDGE[0]}) );
    CELL_DUMMY0 cell_7 ( .DATA_IN(ScanIn[7]), .cell_value(\BLOCK_VALUE[7] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[8], \BLOCK_VALUE[8] , SOUTH_EDGE[8], 
        SOUTH_EDGE[7], SOUTH_EDGE[6], \BLOCK_VALUE[6] , NORTH_EDGE[6], 
        NORTH_EDGE[7]}) );
    CELL_DUMMY0 cell_16 ( .DATA_IN(ScanIn[16]), .cell_value(\BLOCK_VALUE[16] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[17], \BLOCK_VALUE[17] , SOUTH_EDGE[17], 
        SOUTH_EDGE[16], SOUTH_EDGE[15], \BLOCK_VALUE[15] , NORTH_EDGE[15], 
        NORTH_EDGE[16]}) );
    CELL_DUMMY0 cell_31 ( .DATA_IN(ScanIn[31]), .cell_value(\BLOCK_VALUE[31] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NW_EDGE, WEST_EDGE, SW_EDGE, SOUTH_EDGE[31], 
        SOUTH_EDGE[30], \BLOCK_VALUE[30] , NORTH_EDGE[30], NORTH_EDGE[31]}) );
    CELL_DUMMY0 cell_9 ( .DATA_IN(ScanIn[9]), .cell_value(\BLOCK_VALUE[9] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[10], \BLOCK_VALUE[10] , SOUTH_EDGE[10], 
        SOUTH_EDGE[9], SOUTH_EDGE[8], \BLOCK_VALUE[8] , NORTH_EDGE[8], 
        NORTH_EDGE[9]}) );
    CELL_DUMMY0 cell_18 ( .DATA_IN(ScanIn[18]), .cell_value(\BLOCK_VALUE[18] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[19], \BLOCK_VALUE[19] , SOUTH_EDGE[19], 
        SOUTH_EDGE[18], SOUTH_EDGE[17], \BLOCK_VALUE[17] , NORTH_EDGE[17], 
        NORTH_EDGE[18]}) );
    CELL_DUMMY0 cell_23 ( .DATA_IN(ScanIn[23]), .cell_value(\BLOCK_VALUE[23] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[24], \BLOCK_VALUE[24] , SOUTH_EDGE[24], 
        SOUTH_EDGE[23], SOUTH_EDGE[22], \BLOCK_VALUE[22] , NORTH_EDGE[22], 
        NORTH_EDGE[23]}) );
    CELL_DUMMY0 cell_24 ( .DATA_IN(ScanIn[24]), .cell_value(\BLOCK_VALUE[24] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[25], \BLOCK_VALUE[25] , SOUTH_EDGE[25], 
        SOUTH_EDGE[24], SOUTH_EDGE[23], \BLOCK_VALUE[23] , NORTH_EDGE[23], 
        NORTH_EDGE[24]}) );
    CELL_DUMMY0 cell_1 ( .DATA_IN(ScanIn[1]), .cell_value(\BLOCK_VALUE[1] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[2], \BLOCK_VALUE[2] , SOUTH_EDGE[2], 
        SOUTH_EDGE[1], SOUTH_EDGE[0], \BLOCK_VALUE[0] , NORTH_EDGE[0], 
        NORTH_EDGE[1]}) );
    CELL_DUMMY0 cell_8 ( .DATA_IN(ScanIn[8]), .cell_value(\BLOCK_VALUE[8] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[9], \BLOCK_VALUE[9] , SOUTH_EDGE[9], 
        SOUTH_EDGE[8], SOUTH_EDGE[7], \BLOCK_VALUE[7] , NORTH_EDGE[7], 
        NORTH_EDGE[8]}) );
    CELL_DUMMY0 cell_11 ( .DATA_IN(ScanIn[11]), .cell_value(\BLOCK_VALUE[11] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[12], \BLOCK_VALUE[12] , SOUTH_EDGE[12], 
        SOUTH_EDGE[11], SOUTH_EDGE[10], \BLOCK_VALUE[10] , NORTH_EDGE[10], 
        NORTH_EDGE[11]}) );
    CELL_DUMMY0 cell_19 ( .DATA_IN(ScanIn[19]), .cell_value(\BLOCK_VALUE[19] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[20], \BLOCK_VALUE[20] , SOUTH_EDGE[20], 
        SOUTH_EDGE[19], SOUTH_EDGE[18], \BLOCK_VALUE[18] , NORTH_EDGE[18], 
        NORTH_EDGE[19]}) );
    CELL_DUMMY0 cell_25 ( .DATA_IN(ScanIn[25]), .cell_value(\BLOCK_VALUE[25] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[26], \BLOCK_VALUE[26] , SOUTH_EDGE[26], 
        SOUTH_EDGE[25], SOUTH_EDGE[24], \BLOCK_VALUE[24] , NORTH_EDGE[24], 
        NORTH_EDGE[25]}) );
    CELL_DUMMY0 cell_6 ( .DATA_IN(ScanIn[6]), .cell_value(\BLOCK_VALUE[6] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[7], \BLOCK_VALUE[7] , SOUTH_EDGE[7], 
        SOUTH_EDGE[6], SOUTH_EDGE[5], \BLOCK_VALUE[5] , NORTH_EDGE[5], 
        NORTH_EDGE[6]}) );
    CELL_DUMMY0 cell_10 ( .DATA_IN(ScanIn[10]), .cell_value(\BLOCK_VALUE[10] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[11], \BLOCK_VALUE[11] , SOUTH_EDGE[11], 
        SOUTH_EDGE[10], SOUTH_EDGE[9], \BLOCK_VALUE[9] , NORTH_EDGE[9], 
        NORTH_EDGE[10]}) );
    CELL_DUMMY0 cell_17 ( .DATA_IN(ScanIn[17]), .cell_value(\BLOCK_VALUE[17] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[18], \BLOCK_VALUE[18] , SOUTH_EDGE[18], 
        SOUTH_EDGE[17], SOUTH_EDGE[16], \BLOCK_VALUE[16] , NORTH_EDGE[16], 
        NORTH_EDGE[17]}) );
    CELL_DUMMY0 cell_30 ( .DATA_IN(ScanIn[30]), .cell_value(\BLOCK_VALUE[30] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[31], \BLOCK_VALUE[31] , SOUTH_EDGE[31], 
        SOUTH_EDGE[30], SOUTH_EDGE[29], \BLOCK_VALUE[29] , NORTH_EDGE[29], 
        NORTH_EDGE[30]}) );
    CELL_DUMMY0 cell_22 ( .DATA_IN(ScanIn[22]), .cell_value(\BLOCK_VALUE[22] ), 
        .Reset(Reset), .WR(ScanEnable), .Enable(Enable), .Clk(Clk), 
        .NEIGHBORS({NORTH_EDGE[23], \BLOCK_VALUE[23] , SOUTH_EDGE[23], 
        SOUTH_EDGE[22], SOUTH_EDGE[21], \BLOCK_VALUE[21] , NORTH_EDGE[21], 
        NORTH_EDGE[22]}) );
endmodule


module Life_Control_WIDTH32_CWIDTH7_IDWIDTH1_SCAN1_DW01_dec_7_0 ( A, SUM );
input  [6:0] A;
output [6:0] SUM;
    wire n5, n9, n7, n12, n6, n13, n8, n10, n11;
    VMW_AO21 U3 ( .A(n5), .B(A[2]), .C(n6), .Z(SUM[2]) );
    VMW_AO21 U5 ( .A(A[0]), .B(A[1]), .C(n9), .Z(SUM[1]) );
    VMW_INV U6 ( .A(A[0]), .Z(SUM[0]) );
    VMW_AO22 U14 ( .A(A[5]), .B(n13), .C(n12), .D(n10), .Z(SUM[5]) );
    VMW_AO21 U7 ( .A(n8), .B(A[4]), .C(n10), .Z(SUM[4]) );
    VMW_AND2 U8 ( .A(n10), .B(n12), .Z(n11) );
    VMW_XOR2 U13 ( .A(A[6]), .B(n11), .Z(SUM[6]) );
    VMW_OR2 U9 ( .A(A[0]), .B(A[1]), .Z(n5) );
    VMW_NOR2 U12 ( .A(n8), .B(A[4]), .Z(n10) );
    VMW_INV U15 ( .A(A[5]), .Z(n12) );
    VMW_INV U17 ( .A(A[3]), .Z(n7) );
    VMW_NOR2 U10 ( .A(n5), .B(A[2]), .Z(n6) );
    VMW_NAND2 U11 ( .A(n6), .B(n7), .Z(n8) );
    VMW_OAI21 U4 ( .A(n6), .B(n7), .C(n8), .Z(SUM[3]) );
    VMW_INV U18 ( .A(n5), .Z(n9) );
    VMW_INV U16 ( .A(n10), .Z(n13) );
endmodule


module Life_Control_WIDTH32_CWIDTH7_IDWIDTH1_SCAN1 ( Clk, Reset, RD, WR, Addr, 
    DataIn, DataOut, ScanIn, ScanOut, ScanEnable, Id, ScanId, Enable );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Id;
input  [31:0] ScanIn;
output [31:0] ScanOut;
input  [0:0] ScanId;
input  Clk, Reset, RD, WR;
output ScanEnable, Enable;
    wire n330, n317, \count[2] , n362, n345, \count[6] , n339, n357, n322, 
        n325, n350, n319, \count[4] , n342, \count[0] , n359, n356, n337, n318, 
        n351, \ScanReg[15] , \ScanReg[26] , \ScanReg[2] , \count260[3] , n324, 
        \ScanReg[18] , n336, n358, n343, \ScanReg[22] , \ScanReg[11] , 
        \ScanReg[6] , \count260[5] , \ScanReg[20] , \ScanReg[13] , 
        \ScanReg[4] , n344, \count260[1] , n316, \ScanReg[29] , \ScanReg[30] , 
        n331, n323, \ScanReg[17] , \ScanReg[24] , \ScanReg[0] , \ScanReg[9] , 
        n338, n314, \count260[0] , n333, \ScanReg[16] , \ScanReg[25] , n361, 
        n346, \ScanReg[1] , \ScanReg[8] , \ScanReg[7] , n328, \ScanReg[5] , 
        \count260[4] , \ScanReg[21] , \ScanReg[12] , n354, \ScanReg[28] , 
        \ScanReg[31] , n321, n326, \ScanReg[19] , n348, \count260[6] , n353, 
        \ScanReg[10] , \ScanReg[23] , n341, \ScanReg[14] , \ScanReg[27] , n313, 
        \ScanReg[3] , \count260[2] , n334, \count[1] , n352, n349, n327, n335, 
        n360, n340, \count[5] , n347, n329, n332, n315, n320, \count[3] , n355;
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
    VMW_AND2 U54 ( .A(DataIn[29]), .B(WR), .Z(ScanOut[29]) );
    VMW_AND2 U73 ( .A(DataIn[10]), .B(WR), .Z(ScanOut[10]) );
    VMW_NOR2 U113 ( .A(n318), .B(n316), .Z(n314) );
    VMW_INV U134 ( .A(n321), .Z(ScanEnable) );
    VMW_AND2 U68 ( .A(DataIn[15]), .B(WR), .Z(ScanOut[15]) );
    VMW_AND2 U96 ( .A(\ScanReg[13] ), .B(n316), .Z(n340) );
    VMW_AO21 U108 ( .A(RD), .B(ScanEnable), .C(n317), .Z(n328) );
    VMW_BUFIZ U141 ( .A(n330), .E(n328), .Z(\arr[27] ) );
    VMW_BUFIZ U166 ( .A(n355), .E(n328), .Z(\arr[8] ) );
    VMW_FD \ScanReg_reg[5]  ( .D(ScanIn[5]), .CP(Clk), .Q(\ScanReg[5] ) );
    VMW_FD \count_reg[6]  ( .D(n356), .CP(Clk), .Q(\count[6] ) );
    VMW_AND2 U53 ( .A(DataIn[30]), .B(WR), .Z(ScanOut[30]) );
    VMW_AND2 U61 ( .A(DataIn[22]), .B(WR), .Z(ScanOut[22]) );
    VMW_AND2 U84 ( .A(\ScanReg[8] ), .B(n316), .Z(n355) );
    VMW_BUFIZ U148 ( .A(n337), .E(n328), .Z(\arr[21] ) );
    VMW_BUFIZ U153 ( .A(n342), .E(n328), .Z(\arr[29] ) );
    VMW_FD \ScanReg_reg[8]  ( .D(ScanIn[8]), .CP(Clk), .Q(\ScanReg[8] ) );
    Life_Control_WIDTH32_CWIDTH7_IDWIDTH1_SCAN1_DW01_dec_7_0 sub_281 ( .A({
        \count[6] , \count[5] , \count[4] , \count[3] , \count[2] , \count[1] , 
        \count[0] }), .SUM({\count260[6] , \count260[5] , \count260[4] , 
        \count260[3] , \count260[2] , \count260[1] , \count260[0] }) );
    VMW_FD \count_reg[2]  ( .D(n360), .CP(Clk), .Q(\count[2] ) );
    VMW_FD \ScanReg_reg[1]  ( .D(ScanIn[1]), .CP(Clk), .Q(\ScanReg[1] ) );
    VMW_AND2 U66 ( .A(DataIn[17]), .B(WR), .Z(ScanOut[17]) );
    VMW_AND2 U101 ( .A(\ScanReg[16] ), .B(n316), .Z(n333) );
    VMW_AND2 U106 ( .A(\ScanReg[10] ), .B(n316), .Z(n326) );
    VMW_OAI21 U121 ( .A(RD), .B(WR), .C(n322), .Z(n321) );
    VMW_AO22 U126 ( .A(\count[2] ), .B(n317), .C(\ScanReg[2] ), .D(n316), .Z(
        n339) );
    VMW_AO22 U83 ( .A(ScanOut[6]), .B(n314), .C(\count260[6] ), .D(n315), .Z(
        n356) );
    VMW_FD \count_reg[0]  ( .D(n362), .CP(Clk), .Q(\count[0] ) );
    VMW_AND2 U91 ( .A(\ScanReg[17] ), .B(n316), .Z(n346) );
    VMW_AND2 U98 ( .A(\ScanReg[21] ), .B(n316), .Z(n337) );
    VMW_FD \ScanReg_reg[3]  ( .D(ScanIn[3]), .CP(Clk), .Q(\ScanReg[3] ) );
    VMW_AO22 U128 ( .A(\count[0] ), .B(n317), .C(\ScanReg[0] ), .D(n316), .Z(
        n324) );
    VMW_BUFIZ U154 ( .A(n343), .E(n328), .Z(\arr[20] ) );
    VMW_FD \count_reg[4]  ( .D(n358), .CP(Clk), .Q(\count[4] ) );
    VMW_FD \ScanReg_reg[7]  ( .D(ScanIn[7]), .CP(Clk), .Q(\ScanReg[7] ) );
    VMW_BUFIZ U146 ( .A(n335), .E(n328), .Z(\arr[6] ) );
    VMW_BUFIZ U161 ( .A(n350), .E(n328), .Z(\arr[15] ) );
    VMW_AND2 U74 ( .A(DataIn[9]), .B(WR), .Z(ScanOut[9]) );
    VMW_AND2 U114 ( .A(DataIn[6]), .B(WR), .Z(ScanOut[6]) );
    VMW_INV U133 ( .A(Reset), .Z(n320) );
    VMW_AND2 U99 ( .A(\ScanReg[31] ), .B(n316), .Z(n336) );
    VMW_BUFIZ U155 ( .A(n344), .E(n328), .Z(\arr[3] ) );
    VMW_AND2 U52 ( .A(DataIn[31]), .B(WR), .Z(ScanOut[31]) );
    VMW_AND2 U67 ( .A(DataIn[16]), .B(WR), .Z(ScanOut[16]) );
    VMW_AO22 U82 ( .A(ScanOut[5]), .B(n314), .C(\count260[5] ), .D(n315), .Z(
        n357) );
    VMW_AND2 U107 ( .A(\ScanReg[23] ), .B(n316), .Z(n325) );
    VMW_AND2 U120 ( .A(DataIn[0]), .B(WR), .Z(ScanOut[0]) );
    VMW_FD \ScanReg_reg[27]  ( .D(ScanIn[27]), .CP(Clk), .Q(\ScanReg[27] ) );
    VMW_FD \ScanReg_reg[14]  ( .D(ScanIn[14]), .CP(Clk), .Q(\ScanReg[14] ) );
    VMW_AND2 U55 ( .A(DataIn[28]), .B(WR), .Z(ScanOut[28]) );
    VMW_AND2 U69 ( .A(DataIn[14]), .B(WR), .Z(ScanOut[14]) );
    VMW_AND2 U75 ( .A(DataIn[8]), .B(WR), .Z(ScanOut[8]) );
    VMW_AND2 U115 ( .A(DataIn[5]), .B(WR), .Z(ScanOut[5]) );
    VMW_XNOR2 U132 ( .A(Addr[0]), .B(ScanId), .Z(n322) );
    VMW_AND2 U90 ( .A(\ScanReg[7] ), .B(n316), .Z(n347) );
    VMW_AND2 U109 ( .A(\ScanReg[19] ), .B(n316), .Z(n323) );
    VMW_OR4 U129 ( .A(\count[3] ), .B(\count[4] ), .C(\count[5] ), .D(
        \count[6] ), .Z(n313) );
    VMW_BUFIZ U147 ( .A(n336), .E(n328), .Z(\arr[31] ) );
    VMW_FD \ScanReg_reg[19]  ( .D(ScanIn[19]), .CP(Clk), .Q(\ScanReg[19] ) );
    VMW_BUFIZ U160 ( .A(n349), .E(n328), .Z(\arr[26] ) );
    VMW_FD \ScanReg_reg[23]  ( .D(ScanIn[23]), .CP(Clk), .Q(\ScanReg[23] ) );
    VMW_FD \ScanReg_reg[10]  ( .D(ScanIn[10]), .CP(Clk), .Q(\ScanReg[10] ) );
    VMW_AND2 U72 ( .A(DataIn[11]), .B(WR), .Z(ScanOut[11]) );
    VMW_AND2 U97 ( .A(\ScanReg[28] ), .B(n316), .Z(n338) );
    VMW_BUFIZ U140 ( .A(n329), .E(n328), .Z(\arr[4] ) );
    VMW_FD \ScanReg_reg[21]  ( .D(ScanIn[21]), .CP(Clk), .Q(\ScanReg[21] ) );
    VMW_FD \ScanReg_reg[12]  ( .D(ScanIn[12]), .CP(Clk), .Q(\ScanReg[12] ) );
    VMW_FD \ScanReg_reg[31]  ( .D(ScanIn[31]), .CP(Clk), .Q(\ScanReg[31] ) );
    VMW_FD \ScanReg_reg[28]  ( .D(ScanIn[28]), .CP(Clk), .Q(\ScanReg[28] ) );
    VMW_NOR2 U112 ( .A(n318), .B(n319), .Z(n315) );
    VMW_BUFIZ U135 ( .A(n323), .E(n328), .Z(\arr[19] ) );
    VMW_AND2 U60 ( .A(DataIn[23]), .B(WR), .Z(ScanOut[23]) );
    VMW_AND2 U85 ( .A(\ScanReg[11] ), .B(n316), .Z(n353) );
    VMW_AND2 U100 ( .A(\ScanReg[12] ), .B(n316), .Z(n334) );
    VMW_AO22 U127 ( .A(\count[1] ), .B(n317), .C(\ScanReg[1] ), .D(n316), .Z(
        n354) );
    VMW_FD \ScanReg_reg[25]  ( .D(ScanIn[25]), .CP(Clk), .Q(\ScanReg[25] ) );
    VMW_BUFIZ U149 ( .A(n338), .E(n328), .Z(\arr[28] ) );
    VMW_FD \ScanReg_reg[16]  ( .D(ScanIn[16]), .CP(Clk), .Q(\ScanReg[16] ) );
    VMW_BUFIZ U152 ( .A(n341), .E(n328), .Z(\arr[30] ) );
    VMW_OR4 U51 ( .A(\count[1] ), .B(\count[2] ), .C(\count[0] ), .D(n313), 
        .Z(Enable) );
    VMW_AND2 U57 ( .A(DataIn[26]), .B(WR), .Z(ScanOut[26]) );
    VMW_BUFIZ U137 ( .A(n325), .E(n328), .Z(\arr[23] ) );
    VMW_FD \ScanReg_reg[24]  ( .D(ScanIn[24]), .CP(Clk), .Q(\ScanReg[24] ) );
    VMW_AND2 U58 ( .A(DataIn[25]), .B(WR), .Z(ScanOut[25]) );
    VMW_AND2 U59 ( .A(DataIn[24]), .B(WR), .Z(ScanOut[24]) );
    VMW_AND2 U62 ( .A(DataIn[21]), .B(WR), .Z(ScanOut[21]) );
    VMW_AND2 U70 ( .A(DataIn[13]), .B(WR), .Z(ScanOut[13]) );
    VMW_FD \ScanReg_reg[17]  ( .D(ScanIn[17]), .CP(Clk), .Q(\ScanReg[17] ) );
    VMW_AO22 U79 ( .A(ScanOut[2]), .B(n314), .C(\count260[2] ), .D(n315), .Z(
        n360) );
    VMW_AND2 U95 ( .A(\ScanReg[30] ), .B(n316), .Z(n341) );
    VMW_XOR2 U110 ( .A(Addr[0]), .B(Id), .Z(n316) );
    VMW_BUFIZ U159 ( .A(n348), .E(n328), .Z(\arr[5] ) );
    VMW_AND2 U119 ( .A(DataIn[1]), .B(WR), .Z(ScanOut[1]) );
    VMW_BUFIZ U142 ( .A(n331), .E(n328), .Z(\arr[14] ) );
    VMW_BUFIZ U165 ( .A(n354), .E(n328), .Z(\arr[1] ) );
    VMW_AND2 U87 ( .A(\ScanReg[18] ), .B(n316), .Z(n351) );
    VMW_BUFIZ U150 ( .A(n339), .E(n328), .Z(\arr[2] ) );
    VMW_FD \ScanReg_reg[20]  ( .D(ScanIn[20]), .CP(Clk), .Q(\ScanReg[20] ) );
    VMW_FD \ScanReg_reg[13]  ( .D(ScanIn[13]), .CP(Clk), .Q(\ScanReg[13] ) );
    VMW_AO22 U125 ( .A(\count[3] ), .B(n317), .C(\ScanReg[3] ), .D(n316), .Z(
        n344) );
    VMW_FD \ScanReg_reg[30]  ( .D(ScanIn[30]), .CP(Clk), .Q(\ScanReg[30] ) );
    VMW_FD \ScanReg_reg[29]  ( .D(ScanIn[29]), .CP(Clk), .Q(\ScanReg[29] ) );
    VMW_AND2 U65 ( .A(DataIn[18]), .B(WR), .Z(ScanOut[18]) );
    VMW_AND2 U102 ( .A(\ScanReg[25] ), .B(n316), .Z(n332) );
    VMW_AND2 U105 ( .A(\ScanReg[9] ), .B(n316), .Z(n327) );
    VMW_AO22 U80 ( .A(ScanOut[3]), .B(n314), .C(\count260[3] ), .D(n315), .Z(
        n359) );
    VMW_AO22 U122 ( .A(\count[6] ), .B(n317), .C(\ScanReg[6] ), .D(n316), .Z(
        n335) );
    VMW_FD \ScanReg_reg[18]  ( .D(ScanIn[18]), .CP(Clk), .Q(\ScanReg[18] ) );
    VMW_BUFIZ U139 ( .A(n327), .E(n328), .Z(\arr[9] ) );
    VMW_BUFIZ U157 ( .A(n346), .E(n328), .Z(\arr[17] ) );
    VMW_FD \ScanReg_reg[22]  ( .D(ScanIn[22]), .CP(Clk), .Q(\ScanReg[22] ) );
    VMW_FD \ScanReg_reg[11]  ( .D(ScanIn[11]), .CP(Clk), .Q(\ScanReg[11] ) );
    VMW_AO22 U77 ( .A(ScanOut[0]), .B(n314), .C(\count260[0] ), .D(n315), .Z(
        n362) );
    VMW_AND2 U89 ( .A(\ScanReg[26] ), .B(n316), .Z(n349) );
    VMW_AND2 U92 ( .A(\ScanReg[24] ), .B(n316), .Z(n345) );
    VMW_BUFIZ U145 ( .A(n334), .E(n328), .Z(\arr[12] ) );
    VMW_BUFIZ U162 ( .A(n351), .E(n328), .Z(\arr[18] ) );
    VMW_AND2 U117 ( .A(DataIn[3]), .B(WR), .Z(ScanOut[3]) );
    VMW_FD \ScanReg_reg[26]  ( .D(ScanIn[26]), .CP(Clk), .Q(\ScanReg[26] ) );
    VMW_FD \ScanReg_reg[15]  ( .D(ScanIn[15]), .CP(Clk), .Q(\ScanReg[15] ) );
    VMW_AND2 U130 ( .A(n317), .B(WR), .Z(n319) );
    VMW_BUFIZ U138 ( .A(n326), .E(n328), .Z(\arr[10] ) );
    VMW_FD \ScanReg_reg[6]  ( .D(ScanIn[6]), .CP(Clk), .Q(\ScanReg[6] ) );
    VMW_FD \count_reg[5]  ( .D(n357), .CP(Clk), .Q(\count[5] ) );
    VMW_AND2 U64 ( .A(DataIn[19]), .B(WR), .Z(ScanOut[19]) );
    VMW_AO22 U81 ( .A(ScanOut[4]), .B(n314), .C(\count260[4] ), .D(n315), .Z(
        n358) );
    VMW_BUFIZ U156 ( .A(n345), .E(n328), .Z(\arr[24] ) );
    VMW_AND2 U104 ( .A(\ScanReg[27] ), .B(n316), .Z(n330) );
    VMW_AND2 U76 ( .A(DataIn[7]), .B(WR), .Z(ScanOut[7]) );
    VMW_AND2 U116 ( .A(DataIn[4]), .B(WR), .Z(ScanOut[4]) );
    VMW_AO22 U123 ( .A(\count[5] ), .B(n317), .C(\ScanReg[5] ), .D(n316), .Z(
        n348) );
    VMW_AND2 U56 ( .A(DataIn[27]), .B(WR), .Z(ScanOut[27]) );
    VMW_AND2 U88 ( .A(\ScanReg[15] ), .B(n316), .Z(n350) );
    VMW_AND2 U93 ( .A(\ScanReg[20] ), .B(n316), .Z(n343) );
    VMW_INV U131 ( .A(n316), .Z(n317) );
    VMW_FD \count_reg[1]  ( .D(n361), .CP(Clk), .Q(\count[1] ) );
    VMW_FD \ScanReg_reg[2]  ( .D(ScanIn[2]), .CP(Clk), .Q(\ScanReg[2] ) );
    VMW_AND2 U94 ( .A(\ScanReg[29] ), .B(n316), .Z(n342) );
    VMW_BUFIZ U143 ( .A(n332), .E(n328), .Z(\arr[25] ) );
    VMW_BUFIZ U144 ( .A(n333), .E(n328), .Z(\arr[16] ) );
    VMW_BUFIZ U163 ( .A(n352), .E(n328), .Z(\arr[22] ) );
    VMW_BUFIZ U158 ( .A(n347), .E(n328), .Z(\arr[7] ) );
    VMW_BUFIZ U164 ( .A(n353), .E(n328), .Z(\arr[11] ) );
    VMW_FD \ScanReg_reg[9]  ( .D(ScanIn[9]), .CP(Clk), .Q(\ScanReg[9] ) );
    VMW_FD \count_reg[3]  ( .D(n359), .CP(Clk), .Q(\count[3] ) );
    VMW_BUFIZ U136 ( .A(n324), .E(n328), .Z(\arr[0] ) );
    VMW_FD \ScanReg_reg[0]  ( .D(ScanIn[0]), .CP(Clk), .Q(\ScanReg[0] ) );
    VMW_AND2 U63 ( .A(DataIn[20]), .B(WR), .Z(ScanOut[20]) );
    VMW_AND2 U71 ( .A(DataIn[12]), .B(WR), .Z(ScanOut[12]) );
    VMW_OAI21 U111 ( .A(n319), .B(Enable), .C(n320), .Z(n318) );
    VMW_AO22 U124 ( .A(\count[4] ), .B(n317), .C(\ScanReg[4] ), .D(n316), .Z(
        n329) );
    VMW_AO22 U78 ( .A(ScanOut[1]), .B(n314), .C(\count260[1] ), .D(n315), .Z(
        n361) );
    VMW_AND2 U86 ( .A(\ScanReg[22] ), .B(n316), .Z(n352) );
    VMW_AND2 U103 ( .A(\ScanReg[14] ), .B(n316), .Z(n331) );
    VMW_AND2 U118 ( .A(DataIn[2]), .B(WR), .Z(ScanOut[2]) );
    VMW_BUFIZ U151 ( .A(n340), .E(n328), .Z(\arr[13] ) );
    VMW_FD \ScanReg_reg[4]  ( .D(ScanIn[4]), .CP(Clk), .Q(\ScanReg[4] ) );
endmodule


module main ( Clk, Reset, RD, WR, Addr, DataIn, DataOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  Clk, Reset, RD, WR;
    wire \nScanOut1[5] , \nScanOut1[8] , \nScanOut1[1] , \nScanOut1[3] , 
        \nScanEnable[0] , \nScanOut1[7] , \nScanOut0[24] , \nScanOut0[17] , 
        \nScanOut0[3] , \nScanOut1[14] , \nScanOut1[27] , \nScanOut1[19] , 
        \nScanOut0[30] , \nScanOut0[20] , \nScanOut0[13] , \nScanOut0[7] , 
        \nScanOut0[29] , \nScanOut1[10] , \nScanOut1[23] , \nScanOut1[21] , 
        \nScanOut1[12] , \nScanOut0[18] , \nScanOut0[5] , \nScanOut0[22] , 
        \nScanOut0[11] , \nScanOut1[31] , \nScanOut1[28] , \nScanOut0[8] , 
        \nScanOut1[16] , \nScanOut1[25] , \nScanOut0[26] , \nScanOut0[15] , 
        \nScanOut0[1] , \nScanOut1[24] , \nScanOut1[17] , \nScanOut0[9] , 
        \nScanOut0[27] , \nScanOut0[14] , \nScanOut0[0] , \nScanOut1[13] , 
        \nScanOut1[20] , \nScanOut0[19] , \nScanOut0[23] , \nScanOut0[10] , 
        \nScanOut0[4] , \nScanOut1[30] , \nScanOut1[29] , \nScanOut1[18] , 
        \nScanOut0[21] , \nScanOut0[12] , \nScanOut0[6] , \nScanOut0[31] , 
        \nScanOut0[28] , \nScanOut1[22] , \nScanOut1[11] , \nScanOut0[25] , 
        \nScanOut0[16] , \nScanOut0[2] , \nScanOut1[15] , \nScanOut1[26] , 
        \nScanOut1[6] , \nScanOut1[2] , \nScanOut1[9] , \nScanOut1[0] , 
        \nEnable[0] , \nScanOut1[4] ;
    Life_Block_IDWIDTH1_SCAN1 U_Life_Block_0 ( .Clk(Clk), .Reset(Reset), .RD(
        RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
        .ScanIn({\nScanOut1[31] , \nScanOut1[30] , \nScanOut1[29] , 
        \nScanOut1[28] , \nScanOut1[27] , \nScanOut1[26] , \nScanOut1[25] , 
        \nScanOut1[24] , \nScanOut1[23] , \nScanOut1[22] , \nScanOut1[21] , 
        \nScanOut1[20] , \nScanOut1[19] , \nScanOut1[18] , \nScanOut1[17] , 
        \nScanOut1[16] , \nScanOut1[15] , \nScanOut1[14] , \nScanOut1[13] , 
        \nScanOut1[12] , \nScanOut1[11] , \nScanOut1[10] , \nScanOut1[9] , 
        \nScanOut1[8] , \nScanOut1[7] , \nScanOut1[6] , \nScanOut1[5] , 
        \nScanOut1[4] , \nScanOut1[3] , \nScanOut1[2] , \nScanOut1[1] , 
        \nScanOut1[0] }), .ScanOut({\nScanOut0[31] , \nScanOut0[30] , 
        \nScanOut0[29] , \nScanOut0[28] , \nScanOut0[27] , \nScanOut0[26] , 
        \nScanOut0[25] , \nScanOut0[24] , \nScanOut0[23] , \nScanOut0[22] , 
        \nScanOut0[21] , \nScanOut0[20] , \nScanOut0[19] , \nScanOut0[18] , 
        \nScanOut0[17] , \nScanOut0[16] , \nScanOut0[15] , \nScanOut0[14] , 
        \nScanOut0[13] , \nScanOut0[12] , \nScanOut0[11] , \nScanOut0[10] , 
        \nScanOut0[9] , \nScanOut0[8] , \nScanOut0[7] , \nScanOut0[6] , 
        \nScanOut0[5] , \nScanOut0[4] , \nScanOut0[3] , \nScanOut0[2] , 
        \nScanOut0[1] , \nScanOut0[0] }), .ScanEnable(\nScanEnable[0] ), .Id(
        1'b0), .Enable(\nEnable[0] ), .NORTH_EDGE({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .SOUTH_EDGE({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .EAST_EDGE(1'b0), .WEST_EDGE(1'b0), .NW_EDGE(1'b0), 
        .SW_EDGE(1'b0), .NE_EDGE(1'b0), .SE_EDGE(1'b0) );
    Life_Control_WIDTH32_CWIDTH7_IDWIDTH1_SCAN1 U_Life_Control ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .ScanIn({\nScanOut0[31] , \nScanOut0[30] , 
        \nScanOut0[29] , \nScanOut0[28] , \nScanOut0[27] , \nScanOut0[26] , 
        \nScanOut0[25] , \nScanOut0[24] , \nScanOut0[23] , \nScanOut0[22] , 
        \nScanOut0[21] , \nScanOut0[20] , \nScanOut0[19] , \nScanOut0[18] , 
        \nScanOut0[17] , \nScanOut0[16] , \nScanOut0[15] , \nScanOut0[14] , 
        \nScanOut0[13] , \nScanOut0[12] , \nScanOut0[11] , \nScanOut0[10] , 
        \nScanOut0[9] , \nScanOut0[8] , \nScanOut0[7] , \nScanOut0[6] , 
        \nScanOut0[5] , \nScanOut0[4] , \nScanOut0[3] , \nScanOut0[2] , 
        \nScanOut0[1] , \nScanOut0[0] }), .ScanOut({\nScanOut1[31] , 
        \nScanOut1[30] , \nScanOut1[29] , \nScanOut1[28] , \nScanOut1[27] , 
        \nScanOut1[26] , \nScanOut1[25] , \nScanOut1[24] , \nScanOut1[23] , 
        \nScanOut1[22] , \nScanOut1[21] , \nScanOut1[20] , \nScanOut1[19] , 
        \nScanOut1[18] , \nScanOut1[17] , \nScanOut1[16] , \nScanOut1[15] , 
        \nScanOut1[14] , \nScanOut1[13] , \nScanOut1[12] , \nScanOut1[11] , 
        \nScanOut1[10] , \nScanOut1[9] , \nScanOut1[8] , \nScanOut1[7] , 
        \nScanOut1[6] , \nScanOut1[5] , \nScanOut1[4] , \nScanOut1[3] , 
        \nScanOut1[2] , \nScanOut1[1] , \nScanOut1[0] }), .ScanEnable(
        \nScanEnable[0] ), .Id(1'b1), .ScanId(1'b0), .Enable(\nEnable[0] ) );
endmodule

