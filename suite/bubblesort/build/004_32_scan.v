`include "main_header.v"
wire [31:0] wRegInA0;
wire [31:0] wRegInB0;
wire [31:0] wAIn0;
wire [31:0] wBIn0;
wire [31:0] wRegInA1;
wire [31:0] wRegInB1;
wire [31:0] wAIn1;
wire [31:0] wBIn1;
wire [31:0] wAMid0;
wire [31:0] wBMid0;
wire [0:0] wEnable;
wire [0:0] ScanEnable;
wire [31:0] ScanLink0;
wire [31:0] ScanLink1;
wire [31:0] ScanLink2;
wire [31:0] ScanLink3;
wire [31:0] ScanLink4;
BubbleSort_Node #( 32 ) BSN1_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn0), .BIn(wBIn0), .HiOut(wRegInA0), .LoOut(wAMid0) );
BubbleSort_Node #( 32 ) BSN1_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn1), .BIn(wBIn1), .HiOut(wBMid0), .LoOut(wRegInB1) );
BubbleSort_Node #( 32 ) BSN2_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid0), .BIn(wBMid0), .HiOut(wRegInB0), .LoOut(wRegInA1) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA0), .Out(wAIn0), .ScanIn(ScanLink4), .ScanOut(ScanLink3), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB0), .Out(wBIn0), .ScanIn(ScanLink3), .ScanOut(ScanLink2), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA1), .Out(wAIn1), .ScanIn(ScanLink2), .ScanOut(ScanLink1), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB1), .Out(wBIn1), .ScanIn(ScanLink1), .ScanOut(ScanLink0), .ScanEnable(ScanEnable) );
BubbleSort_Control #( 2, 1, 32, 1 ) U_BSC ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(wEnable), .ScanIn(ScanLink0), .ScanOut(ScanLink4), .ScanEnable(ScanEnable), .ScanId(1'd0) );
`include "main_trailer.v"
