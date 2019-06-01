`include "main_header.v"
wire [0:0] wCall_0;
wire [4:0] wScan_0;
wire [0:0] wCall_1;
wire [4:0] wScan_1;
wire [0:0] wCall_2;
wire [4:0] wScan_2;
wire [0:0] wCall_3;
wire [4:0] wScan_3;
wire [0:0] wCall_4;
wire [4:0] wScan_4;
wire [0:0] wCall_5;
wire [4:0] wScan_5;
wire [0:0] wCall_6;
wire [4:0] wScan_6;
wire [0:0] wCall_7;
wire [4:0] wScan_7;
wire [0:0] wCall_8;
wire [4:0] wScan_8;
wire [0:0] wCall_9;
wire [4:0] wScan_9;
wire [0:0] wCall_10;
wire [4:0] wScan_10;
wire [0:0] wCall_11;
wire [4:0] wScan_11;
wire [0:0] wCall_12;
wire [4:0] wScan_12;
wire [0:0] wCall_13;
wire [4:0] wScan_13;
wire [0:0] wCall_14;
wire [4:0] wScan_14;
wire [0:0] wCall_15;
wire [4:0] wScan_15;
wire [0:0] wCall_16;
wire [4:0] wScan_16;
wire [0:0] wReturn_0;
wire [0:0] wReturn_1;
wire [0:0] wReturn_2;
wire [0:0] wReturn_3;
wire [0:0] wReturn_4;
wire [0:0] wReturn_5;
wire [0:0] wReturn_6;
wire [0:0] wReturn_7;
wire [0:0] wReturn_8;
wire [0:0] wReturn_9;
wire [0:0] wReturn_10;
wire [0:0] wReturn_11;
wire [0:0] wReturn_12;
wire [0:0] wReturn_13;
wire [0:0] wReturn_14;
wire [0:0] wReturn_15;
wire [15:0] wColumn_1;
wire [15:0] wPDiag_1;
wire [15:0] wNDiag_1;
wire [15:0] wColumn_2;
wire [15:0] wPDiag_2;
wire [15:0] wNDiag_2;
wire [15:0] wColumn_3;
wire [15:0] wPDiag_3;
wire [15:0] wNDiag_3;
wire [15:0] wColumn_4;
wire [15:0] wPDiag_4;
wire [15:0] wNDiag_4;
wire [15:0] wColumn_5;
wire [15:0] wPDiag_5;
wire [15:0] wNDiag_5;
wire [15:0] wColumn_6;
wire [15:0] wPDiag_6;
wire [15:0] wNDiag_6;
wire [15:0] wColumn_7;
wire [15:0] wPDiag_7;
wire [15:0] wNDiag_7;
wire [15:0] wColumn_8;
wire [15:0] wPDiag_8;
wire [15:0] wNDiag_8;
wire [15:0] wColumn_9;
wire [15:0] wPDiag_9;
wire [15:0] wNDiag_9;
wire [15:0] wColumn_10;
wire [15:0] wPDiag_10;
wire [15:0] wNDiag_10;
wire [15:0] wColumn_11;
wire [15:0] wPDiag_11;
wire [15:0] wNDiag_11;
wire [15:0] wColumn_12;
wire [15:0] wPDiag_12;
wire [15:0] wNDiag_12;
wire [15:0] wColumn_13;
wire [15:0] wPDiag_13;
wire [15:0] wNDiag_13;
wire [15:0] wColumn_14;
wire [15:0] wPDiag_14;
wire [15:0] wNDiag_14;
wire [15:0] wColumn_15;
wire [15:0] wPDiag_15;
wire [15:0] wNDiag_15;
wire [0:0] wScanEnable;
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_1), .ScanOut(wScan_0), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_0), .ReturnIn(wReturn_1),
.ColIn(16'd0), .PDiagIn(16'd0), .NDiagIn(16'd0),
.CallOut(wCall_1), .ReturnOut(wReturn_0),
.ColOut(wColumn_1), .PDiagOut(wPDiag_1), .NDiagOut(wNDiag_1)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_2), .ScanOut(wScan_1), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_1), .ReturnIn(wReturn_2),
.ColIn(wColumn_1), .PDiagIn(wPDiag_1), .NDiagIn(wNDiag_1),
.CallOut(wCall_2), .ReturnOut(wReturn_1),
.ColOut(wColumn_2), .PDiagOut(wPDiag_2), .NDiagOut(wNDiag_2)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_3), .ScanOut(wScan_2), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_2), .ReturnIn(wReturn_3),
.ColIn(wColumn_2), .PDiagIn(wPDiag_2), .NDiagIn(wNDiag_2),
.CallOut(wCall_3), .ReturnOut(wReturn_2),
.ColOut(wColumn_3), .PDiagOut(wPDiag_3), .NDiagOut(wNDiag_3)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_4), .ScanOut(wScan_3), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_3), .ReturnIn(wReturn_4),
.ColIn(wColumn_3), .PDiagIn(wPDiag_3), .NDiagIn(wNDiag_3),
.CallOut(wCall_4), .ReturnOut(wReturn_3),
.ColOut(wColumn_4), .PDiagOut(wPDiag_4), .NDiagOut(wNDiag_4)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_5), .ScanOut(wScan_4), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_4), .ReturnIn(wReturn_5),
.ColIn(wColumn_4), .PDiagIn(wPDiag_4), .NDiagIn(wNDiag_4),
.CallOut(wCall_5), .ReturnOut(wReturn_4),
.ColOut(wColumn_5), .PDiagOut(wPDiag_5), .NDiagOut(wNDiag_5)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_6), .ScanOut(wScan_5), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_5), .ReturnIn(wReturn_6),
.ColIn(wColumn_5), .PDiagIn(wPDiag_5), .NDiagIn(wNDiag_5),
.CallOut(wCall_6), .ReturnOut(wReturn_5),
.ColOut(wColumn_6), .PDiagOut(wPDiag_6), .NDiagOut(wNDiag_6)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_7), .ScanOut(wScan_6), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_6), .ReturnIn(wReturn_7),
.ColIn(wColumn_6), .PDiagIn(wPDiag_6), .NDiagIn(wNDiag_6),
.CallOut(wCall_7), .ReturnOut(wReturn_6),
.ColOut(wColumn_7), .PDiagOut(wPDiag_7), .NDiagOut(wNDiag_7)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_8), .ScanOut(wScan_7), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_7), .ReturnIn(wReturn_8),
.ColIn(wColumn_7), .PDiagIn(wPDiag_7), .NDiagIn(wNDiag_7),
.CallOut(wCall_8), .ReturnOut(wReturn_7),
.ColOut(wColumn_8), .PDiagOut(wPDiag_8), .NDiagOut(wNDiag_8)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_9), .ScanOut(wScan_8), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_8), .ReturnIn(wReturn_9),
.ColIn(wColumn_8), .PDiagIn(wPDiag_8), .NDiagIn(wNDiag_8),
.CallOut(wCall_9), .ReturnOut(wReturn_8),
.ColOut(wColumn_9), .PDiagOut(wPDiag_9), .NDiagOut(wNDiag_9)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_10), .ScanOut(wScan_9), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_9), .ReturnIn(wReturn_10),
.ColIn(wColumn_9), .PDiagIn(wPDiag_9), .NDiagIn(wNDiag_9),
.CallOut(wCall_10), .ReturnOut(wReturn_9),
.ColOut(wColumn_10), .PDiagOut(wPDiag_10), .NDiagOut(wNDiag_10)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_11), .ScanOut(wScan_10), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_10), .ReturnIn(wReturn_11),
.ColIn(wColumn_10), .PDiagIn(wPDiag_10), .NDiagIn(wNDiag_10),
.CallOut(wCall_11), .ReturnOut(wReturn_10),
.ColOut(wColumn_11), .PDiagOut(wPDiag_11), .NDiagOut(wNDiag_11)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_12), .ScanOut(wScan_11), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_11), .ReturnIn(wReturn_12),
.ColIn(wColumn_11), .PDiagIn(wPDiag_11), .NDiagIn(wNDiag_11),
.CallOut(wCall_12), .ReturnOut(wReturn_11),
.ColOut(wColumn_12), .PDiagOut(wPDiag_12), .NDiagOut(wNDiag_12)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_13), .ScanOut(wScan_12), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_12), .ReturnIn(wReturn_13),
.ColIn(wColumn_12), .PDiagIn(wPDiag_12), .NDiagIn(wNDiag_12),
.CallOut(wCall_13), .ReturnOut(wReturn_12),
.ColOut(wColumn_13), .PDiagOut(wPDiag_13), .NDiagOut(wNDiag_13)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_14), .ScanOut(wScan_13), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_13), .ReturnIn(wReturn_14),
.ColIn(wColumn_13), .PDiagIn(wPDiag_13), .NDiagIn(wNDiag_13),
.CallOut(wCall_14), .ReturnOut(wReturn_13),
.ColOut(wColumn_14), .PDiagOut(wPDiag_14), .NDiagOut(wNDiag_14)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_15), .ScanOut(wScan_14), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_14), .ReturnIn(wReturn_15),
.ColIn(wColumn_14), .PDiagIn(wPDiag_14), .NDiagIn(wNDiag_14),
.CallOut(wCall_15), .ReturnOut(wReturn_14),
.ColOut(wColumn_15), .PDiagOut(wPDiag_15), .NDiagOut(wNDiag_15)
 );
NQueens_Node #( 16, 5, 1 ) U_NQueens_Node_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_16), .ScanOut(wScan_15), .ScanEnable(wScanEnable),
.Id(5'd0), .CallIn(wCall_15), .ReturnIn(1'd0),
.ColIn(wColumn_15), .PDiagIn(wPDiag_15), .NDiagIn(wNDiag_15),
.CallOut(wCall_16), .ReturnOut(wReturn_15) );
NQueens_Control #( 5, 1 ) U_NQueens_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.Id(5'd1),.ScanId(5'd0),
.ScanIn(wScan_0), .ScanOut(wScan_16), .ScanEnable(wScanEnable),
.CallIn(wCall_16), .ReturnIn(wReturn_0), .CallOut(wCall_0) );
`include "main_trailer.v"
