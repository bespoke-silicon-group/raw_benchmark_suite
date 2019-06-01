`include "main_header.v"
wire [0:0] wCall_0;
wire [3:0] wScan_0;
wire [0:0] wCall_1;
wire [3:0] wScan_1;
wire [0:0] wCall_2;
wire [3:0] wScan_2;
wire [0:0] wCall_3;
wire [3:0] wScan_3;
wire [0:0] wCall_4;
wire [3:0] wScan_4;
wire [0:0] wCall_5;
wire [3:0] wScan_5;
wire [0:0] wCall_6;
wire [3:0] wScan_6;
wire [0:0] wCall_7;
wire [3:0] wScan_7;
wire [0:0] wCall_8;
wire [3:0] wScan_8;
wire [0:0] wReturn_0;
wire [0:0] wReturn_1;
wire [0:0] wReturn_2;
wire [0:0] wReturn_3;
wire [0:0] wReturn_4;
wire [0:0] wReturn_5;
wire [0:0] wReturn_6;
wire [0:0] wReturn_7;
wire [7:0] wColumn_1;
wire [7:0] wPDiag_1;
wire [7:0] wNDiag_1;
wire [7:0] wColumn_2;
wire [7:0] wPDiag_2;
wire [7:0] wNDiag_2;
wire [7:0] wColumn_3;
wire [7:0] wPDiag_3;
wire [7:0] wNDiag_3;
wire [7:0] wColumn_4;
wire [7:0] wPDiag_4;
wire [7:0] wNDiag_4;
wire [7:0] wColumn_5;
wire [7:0] wPDiag_5;
wire [7:0] wNDiag_5;
wire [7:0] wColumn_6;
wire [7:0] wPDiag_6;
wire [7:0] wNDiag_6;
wire [7:0] wColumn_7;
wire [7:0] wPDiag_7;
wire [7:0] wNDiag_7;
wire [0:0] wScanEnable;
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_1), .ScanOut(wScan_0), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_0), .ReturnIn(wReturn_1),
.ColIn(8'd0), .PDiagIn(8'd0), .NDiagIn(8'd0),
.CallOut(wCall_1), .ReturnOut(wReturn_0),
.ColOut(wColumn_1), .PDiagOut(wPDiag_1), .NDiagOut(wNDiag_1)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_2), .ScanOut(wScan_1), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_1), .ReturnIn(wReturn_2),
.ColIn(wColumn_1), .PDiagIn(wPDiag_1), .NDiagIn(wNDiag_1),
.CallOut(wCall_2), .ReturnOut(wReturn_1),
.ColOut(wColumn_2), .PDiagOut(wPDiag_2), .NDiagOut(wNDiag_2)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_3), .ScanOut(wScan_2), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_2), .ReturnIn(wReturn_3),
.ColIn(wColumn_2), .PDiagIn(wPDiag_2), .NDiagIn(wNDiag_2),
.CallOut(wCall_3), .ReturnOut(wReturn_2),
.ColOut(wColumn_3), .PDiagOut(wPDiag_3), .NDiagOut(wNDiag_3)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_4), .ScanOut(wScan_3), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_3), .ReturnIn(wReturn_4),
.ColIn(wColumn_3), .PDiagIn(wPDiag_3), .NDiagIn(wNDiag_3),
.CallOut(wCall_4), .ReturnOut(wReturn_3),
.ColOut(wColumn_4), .PDiagOut(wPDiag_4), .NDiagOut(wNDiag_4)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_5), .ScanOut(wScan_4), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_4), .ReturnIn(wReturn_5),
.ColIn(wColumn_4), .PDiagIn(wPDiag_4), .NDiagIn(wNDiag_4),
.CallOut(wCall_5), .ReturnOut(wReturn_4),
.ColOut(wColumn_5), .PDiagOut(wPDiag_5), .NDiagOut(wNDiag_5)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_6), .ScanOut(wScan_5), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_5), .ReturnIn(wReturn_6),
.ColIn(wColumn_5), .PDiagIn(wPDiag_5), .NDiagIn(wNDiag_5),
.CallOut(wCall_6), .ReturnOut(wReturn_5),
.ColOut(wColumn_6), .PDiagOut(wPDiag_6), .NDiagOut(wNDiag_6)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_7), .ScanOut(wScan_6), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_6), .ReturnIn(wReturn_7),
.ColIn(wColumn_6), .PDiagIn(wPDiag_6), .NDiagIn(wNDiag_6),
.CallOut(wCall_7), .ReturnOut(wReturn_6),
.ColOut(wColumn_7), .PDiagOut(wPDiag_7), .NDiagOut(wNDiag_7)
 );
NQueens_Node #( 8, 4, 1 ) U_NQueens_Node_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.ScanIn(wScan_8), .ScanOut(wScan_7), .ScanEnable(wScanEnable),
.Id(4'd0), .CallIn(wCall_7), .ReturnIn(1'd0),
.ColIn(wColumn_7), .PDiagIn(wPDiag_7), .NDiagIn(wNDiag_7),
.CallOut(wCall_8), .ReturnOut(wReturn_7) );
NQueens_Control #( 4, 1 ) U_NQueens_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
.Id(4'd1),.ScanId(4'd0),
.ScanIn(wScan_0), .ScanOut(wScan_8), .ScanEnable(wScanEnable),
.CallIn(wCall_8), .ReturnIn(wReturn_0), .CallOut(wCall_0) );
`include "main_trailer.v"
