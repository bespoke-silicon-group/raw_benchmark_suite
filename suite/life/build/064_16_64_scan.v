`include "main_header.v"
wire [31:0] nOut0_0;
wire [31:0] nScanOut0;
wire [31:0] nOut0_1;
wire [31:0] nScanOut1;
wire [31:0] nOut0_2;
wire [31:0] nScanOut2;
wire [31:0] nOut0_3;
wire [31:0] nScanOut3;
wire [31:0] nOut0_4;
wire [31:0] nScanOut4;
wire [31:0] nOut0_5;
wire [31:0] nScanOut5;
wire [31:0] nOut0_6;
wire [31:0] nScanOut6;
wire [31:0] nOut0_7;
wire [31:0] nScanOut7;
wire [31:0] nOut0_8;
wire [31:0] nScanOut8;
wire [31:0] nOut0_9;
wire [31:0] nScanOut9;
wire [31:0] nOut0_10;
wire [31:0] nScanOut10;
wire [31:0] nOut0_11;
wire [31:0] nScanOut11;
wire [31:0] nOut0_12;
wire [31:0] nScanOut12;
wire [31:0] nOut0_13;
wire [31:0] nScanOut13;
wire [31:0] nOut0_14;
wire [31:0] nScanOut14;
wire [31:0] nOut0_15;
wire [31:0] nScanOut15;
wire [31:0] nOut1_0;
wire [31:0] nScanOut16;
wire [31:0] nOut1_1;
wire [31:0] nScanOut17;
wire [31:0] nOut1_2;
wire [31:0] nScanOut18;
wire [31:0] nOut1_3;
wire [31:0] nScanOut19;
wire [31:0] nOut1_4;
wire [31:0] nScanOut20;
wire [31:0] nOut1_5;
wire [31:0] nScanOut21;
wire [31:0] nOut1_6;
wire [31:0] nScanOut22;
wire [31:0] nOut1_7;
wire [31:0] nScanOut23;
wire [31:0] nOut1_8;
wire [31:0] nScanOut24;
wire [31:0] nOut1_9;
wire [31:0] nScanOut25;
wire [31:0] nOut1_10;
wire [31:0] nScanOut26;
wire [31:0] nOut1_11;
wire [31:0] nScanOut27;
wire [31:0] nOut1_12;
wire [31:0] nScanOut28;
wire [31:0] nOut1_13;
wire [31:0] nScanOut29;
wire [31:0] nOut1_14;
wire [31:0] nScanOut30;
wire [31:0] nOut1_15;
wire [31:0] nScanOut31;
wire [0:0] nEnable;
wire [0:0] nScanEnable;
wire [31:0] nScanOut32;
Life_Block #( 1, 1 ) U_Life_Block_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_0), .NORTH_EDGE(32'd0), .SOUTH_EDGE(nOut0_1), .EAST_EDGE(nOut1_0[31]), .NE_EDGE(1'd0), .SE_EDGE(nOut1_1[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut1), .ScanOut(nScanOut0), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_1), .NORTH_EDGE(nOut0_0), .SOUTH_EDGE(nOut0_2), .EAST_EDGE(nOut1_1[31]), .NE_EDGE(nOut1_0[31]), .SE_EDGE(nOut1_2[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut2), .ScanOut(nScanOut1), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_2), .NORTH_EDGE(nOut0_1), .SOUTH_EDGE(nOut0_3), .EAST_EDGE(nOut1_2[31]), .NE_EDGE(nOut1_1[31]), .SE_EDGE(nOut1_3[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut3), .ScanOut(nScanOut2), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_3), .NORTH_EDGE(nOut0_2), .SOUTH_EDGE(nOut0_4), .EAST_EDGE(nOut1_3[31]), .NE_EDGE(nOut1_2[31]), .SE_EDGE(nOut1_4[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut4), .ScanOut(nScanOut3), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_4), .NORTH_EDGE(nOut0_3), .SOUTH_EDGE(nOut0_5), .EAST_EDGE(nOut1_4[31]), .NE_EDGE(nOut1_3[31]), .SE_EDGE(nOut1_5[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut5), .ScanOut(nScanOut4), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_5), .NORTH_EDGE(nOut0_4), .SOUTH_EDGE(nOut0_6), .EAST_EDGE(nOut1_5[31]), .NE_EDGE(nOut1_4[31]), .SE_EDGE(nOut1_6[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut6), .ScanOut(nScanOut5), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_6), .NORTH_EDGE(nOut0_5), .SOUTH_EDGE(nOut0_7), .EAST_EDGE(nOut1_6[31]), .NE_EDGE(nOut1_5[31]), .SE_EDGE(nOut1_7[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut7), .ScanOut(nScanOut6), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_7), .NORTH_EDGE(nOut0_6), .SOUTH_EDGE(nOut0_8), .EAST_EDGE(nOut1_7[31]), .NE_EDGE(nOut1_6[31]), .SE_EDGE(nOut1_8[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut8), .ScanOut(nScanOut7), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_8), .NORTH_EDGE(nOut0_7), .SOUTH_EDGE(nOut0_9), .EAST_EDGE(nOut1_8[31]), .NE_EDGE(nOut1_7[31]), .SE_EDGE(nOut1_9[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut9), .ScanOut(nScanOut8), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_9), .NORTH_EDGE(nOut0_8), .SOUTH_EDGE(nOut0_10), .EAST_EDGE(nOut1_9[31]), .NE_EDGE(nOut1_8[31]), .SE_EDGE(nOut1_10[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut10), .ScanOut(nScanOut9), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_10), .NORTH_EDGE(nOut0_9), .SOUTH_EDGE(nOut0_11), .EAST_EDGE(nOut1_10[31]), .NE_EDGE(nOut1_9[31]), .SE_EDGE(nOut1_11[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut11), .ScanOut(nScanOut10), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_11), .NORTH_EDGE(nOut0_10), .SOUTH_EDGE(nOut0_12), .EAST_EDGE(nOut1_11[31]), .NE_EDGE(nOut1_10[31]), .SE_EDGE(nOut1_12[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut12), .ScanOut(nScanOut11), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_12), .NORTH_EDGE(nOut0_11), .SOUTH_EDGE(nOut0_13), .EAST_EDGE(nOut1_12[31]), .NE_EDGE(nOut1_11[31]), .SE_EDGE(nOut1_13[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut13), .ScanOut(nScanOut12), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_13), .NORTH_EDGE(nOut0_12), .SOUTH_EDGE(nOut0_14), .EAST_EDGE(nOut1_13[31]), .NE_EDGE(nOut1_12[31]), .SE_EDGE(nOut1_14[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut14), .ScanOut(nScanOut13), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_14), .NORTH_EDGE(nOut0_13), .SOUTH_EDGE(nOut0_15), .EAST_EDGE(nOut1_14[31]), .NE_EDGE(nOut1_13[31]), .SE_EDGE(nOut1_15[31]), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut15), .ScanOut(nScanOut14), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_15), .NORTH_EDGE(nOut0_14), .SOUTH_EDGE(32'd0), .EAST_EDGE(nOut1_15[31]), .NE_EDGE(nOut1_14[31]), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut16), .ScanOut(nScanOut15), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_16 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_0), .NORTH_EDGE(32'd0), .SOUTH_EDGE(nOut1_1), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_0[0]), .NW_EDGE(1'd0), .SW_EDGE(nOut0_1[0]), .ScanIn(nScanOut17), .ScanOut(nScanOut16), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_17 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_1), .NORTH_EDGE(nOut1_0), .SOUTH_EDGE(nOut1_2), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_1[0]), .NW_EDGE(nOut0_0[0]), .SW_EDGE(nOut0_2[0]), .ScanIn(nScanOut18), .ScanOut(nScanOut17), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_18 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_2), .NORTH_EDGE(nOut1_1), .SOUTH_EDGE(nOut1_3), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_2[0]), .NW_EDGE(nOut0_1[0]), .SW_EDGE(nOut0_3[0]), .ScanIn(nScanOut19), .ScanOut(nScanOut18), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_19 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_3), .NORTH_EDGE(nOut1_2), .SOUTH_EDGE(nOut1_4), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_3[0]), .NW_EDGE(nOut0_2[0]), .SW_EDGE(nOut0_4[0]), .ScanIn(nScanOut20), .ScanOut(nScanOut19), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_20 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_4), .NORTH_EDGE(nOut1_3), .SOUTH_EDGE(nOut1_5), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_4[0]), .NW_EDGE(nOut0_3[0]), .SW_EDGE(nOut0_5[0]), .ScanIn(nScanOut21), .ScanOut(nScanOut20), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_21 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_5), .NORTH_EDGE(nOut1_4), .SOUTH_EDGE(nOut1_6), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_5[0]), .NW_EDGE(nOut0_4[0]), .SW_EDGE(nOut0_6[0]), .ScanIn(nScanOut22), .ScanOut(nScanOut21), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_22 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_6), .NORTH_EDGE(nOut1_5), .SOUTH_EDGE(nOut1_7), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_6[0]), .NW_EDGE(nOut0_5[0]), .SW_EDGE(nOut0_7[0]), .ScanIn(nScanOut23), .ScanOut(nScanOut22), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_23 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_7), .NORTH_EDGE(nOut1_6), .SOUTH_EDGE(nOut1_8), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_7[0]), .NW_EDGE(nOut0_6[0]), .SW_EDGE(nOut0_8[0]), .ScanIn(nScanOut24), .ScanOut(nScanOut23), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_24 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_8), .NORTH_EDGE(nOut1_7), .SOUTH_EDGE(nOut1_9), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_8[0]), .NW_EDGE(nOut0_7[0]), .SW_EDGE(nOut0_9[0]), .ScanIn(nScanOut25), .ScanOut(nScanOut24), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_25 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_9), .NORTH_EDGE(nOut1_8), .SOUTH_EDGE(nOut1_10), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_9[0]), .NW_EDGE(nOut0_8[0]), .SW_EDGE(nOut0_10[0]), .ScanIn(nScanOut26), .ScanOut(nScanOut25), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_26 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_10), .NORTH_EDGE(nOut1_9), .SOUTH_EDGE(nOut1_11), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_10[0]), .NW_EDGE(nOut0_9[0]), .SW_EDGE(nOut0_11[0]), .ScanIn(nScanOut27), .ScanOut(nScanOut26), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_27 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_11), .NORTH_EDGE(nOut1_10), .SOUTH_EDGE(nOut1_12), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_11[0]), .NW_EDGE(nOut0_10[0]), .SW_EDGE(nOut0_12[0]), .ScanIn(nScanOut28), .ScanOut(nScanOut27), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_28 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_12), .NORTH_EDGE(nOut1_11), .SOUTH_EDGE(nOut1_13), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_12[0]), .NW_EDGE(nOut0_11[0]), .SW_EDGE(nOut0_13[0]), .ScanIn(nScanOut29), .ScanOut(nScanOut28), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_29 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_13), .NORTH_EDGE(nOut1_12), .SOUTH_EDGE(nOut1_14), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_13[0]), .NW_EDGE(nOut0_12[0]), .SW_EDGE(nOut0_14[0]), .ScanIn(nScanOut30), .ScanOut(nScanOut29), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_30 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_14), .NORTH_EDGE(nOut1_13), .SOUTH_EDGE(nOut1_15), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_14[0]), .NW_EDGE(nOut0_13[0]), .SW_EDGE(nOut0_15[0]), .ScanIn(nScanOut31), .ScanOut(nScanOut30), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_31 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut1_15), .NORTH_EDGE(nOut1_14), .SOUTH_EDGE(32'd0), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(nOut0_15[0]), .NW_EDGE(nOut0_14[0]), .SW_EDGE(1'd0), .ScanIn(nScanOut32), .ScanOut(nScanOut31), .ScanEnable(nScanEnable) );
Life_Control #( 32, 7, 1, 1 ) U_Life_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(nEnable), .ScanId(1'd0), .ScanEnable(nScanEnable), .ScanIn(nScanOut0), .ScanOut(nScanOut32) );
`include "main_trailer.v"