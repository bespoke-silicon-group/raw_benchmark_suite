`include "main_header.v"
wire [7:0] nOut0_0;
wire [7:0] nScanOut0;
wire [7:0] nOut0_1;
wire [7:0] nScanOut1;
wire [7:0] nOut0_2;
wire [7:0] nScanOut2;
wire [7:0] nOut0_3;
wire [7:0] nScanOut3;
wire [7:0] nOut1_0;
wire [7:0] nScanOut4;
wire [7:0] nOut1_1;
wire [7:0] nScanOut5;
wire [7:0] nOut1_2;
wire [7:0] nScanOut6;
wire [7:0] nOut1_3;
wire [7:0] nScanOut7;
wire [7:0] nOut2_0;
wire [7:0] nScanOut8;
wire [7:0] nOut2_1;
wire [7:0] nScanOut9;
wire [7:0] nOut2_2;
wire [7:0] nScanOut10;
wire [7:0] nOut2_3;
wire [7:0] nScanOut11;
wire [7:0] nOut3_0;
wire [7:0] nScanOut12;
wire [7:0] nOut3_1;
wire [7:0] nScanOut13;
wire [7:0] nOut3_2;
wire [7:0] nScanOut14;
wire [7:0] nOut3_3;
wire [7:0] nScanOut15;
wire [0:0] nEnable;
wire [0:0] nScanEnable;
wire [7:0] nScanOut16;
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut0_0), .ScanIn(nScanOut1), .ScanOut(nScanOut0), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut0_1), .ScanIn(nScanOut2), .ScanOut(nScanOut1), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut0_2), .ScanIn(nScanOut3), .ScanOut(nScanOut2), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut0_3), .ScanIn(nScanOut4), .ScanOut(nScanOut3), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut1_0), .ScanIn(nScanOut5), .ScanOut(nScanOut4), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 0, 1 ) U_Jacobi_Node_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .Out(nOut1_1), .NorthIn(nOut1_0), .SouthIn(nOut1_2), .EastIn(nOut2_1), .WestIn(nOut0_1), .ScanIn(nScanOut6), .ScanOut(nScanOut5), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 0, 1 ) U_Jacobi_Node_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .Out(nOut1_2), .NorthIn(nOut1_1), .SouthIn(nOut1_3), .EastIn(nOut2_2), .WestIn(nOut0_2), .ScanIn(nScanOut7), .ScanOut(nScanOut6), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut1_3), .ScanIn(nScanOut8), .ScanOut(nScanOut7), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut2_0), .ScanIn(nScanOut9), .ScanOut(nScanOut8), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 0, 1 ) U_Jacobi_Node_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .Out(nOut2_1), .NorthIn(nOut2_0), .SouthIn(nOut2_2), .EastIn(nOut3_1), .WestIn(nOut1_1), .ScanIn(nScanOut10), .ScanOut(nScanOut9), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 0, 1 ) U_Jacobi_Node_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .Out(nOut2_2), .NorthIn(nOut2_1), .SouthIn(nOut2_3), .EastIn(nOut3_2), .WestIn(nOut1_2), .ScanIn(nScanOut11), .ScanOut(nScanOut10), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut2_3), .ScanIn(nScanOut12), .ScanOut(nScanOut11), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut3_0), .ScanIn(nScanOut13), .ScanOut(nScanOut12), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut3_1), .ScanIn(nScanOut14), .ScanOut(nScanOut13), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut3_2), .ScanIn(nScanOut15), .ScanOut(nScanOut14), .ScanEnable(nScanEnable) );
Jacobi_Node #( 8, 1, 1, 1 ) U_Jacobi_Node_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(nOut3_3), .ScanIn(nScanOut16), .ScanOut(nScanOut15), .ScanEnable(nScanEnable) );
Jacobi_Control #( 8, 7, 1, 1 ) U_Jacobi_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(nEnable), .ScanId(1'd0), .ScanEnable(nScanEnable), .ScanIn(nScanOut0), .ScanOut(nScanOut16) );
`include "main_trailer.v"
