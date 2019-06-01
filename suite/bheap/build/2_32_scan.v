`include "main_header.v"
wire [0:0] wCtrlOut_0;
wire [0:0] wEnable_0;
wire [31:0] wRegInBot_0_0;
wire [0:0] wRegEnBot_0_0;
wire [31:0] wRegOut_0_0;
wire [0:0] wCtrlOut_1;
wire [0:0] wEnable_1;
wire [31:0] wRegInTop_1_0;
wire [0:0] wRegEnTop_1_0;
wire [31:0] wRegOut_1_0;
wire [31:0] wRegInTop_1_1;
wire [0:0] wRegEnTop_1_1;
wire [31:0] wRegOut_1_1;
wire [0:0] ScanEnable;
wire [31:0] ScanLink0;
wire [31:0] ScanLink1;
wire [31:0] ScanLink2;
wire [31:0] ScanLink3;
BHeap_Reg #( 32, 1, 1 ) BHR_0_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(wRegOut_0_0), .Enable1(1'b0), .In1(32'b0), .Enable2(wRegEnBot_0_0), .In2(wRegInBot_0_0), .ScanIn(ScanLink1), .ScanOut(ScanLink0), .ScanEnable(ScanEnable) );
BHeap_Reg #( 32, 1, 1 ) BHR_1_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(wRegOut_1_0), .Enable1(wRegEnTop_1_0), .In1(wRegInTop_1_0), .Enable2(1'b0), .In2(32'b0), .ScanIn(ScanLink2), .ScanOut(ScanLink1), .ScanEnable(ScanEnable) );
BHeap_Reg #( 32, 1, 1 ) BHR_1_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Out(wRegOut_1_1), .Enable1(wRegEnTop_1_1), .In1(wRegInTop_1_1), .Enable2(1'b0), .In2(32'b0), .ScanIn(ScanLink3), .ScanOut(ScanLink2), .ScanEnable(ScanEnable) );
BHeap_Node #( 32 ) BHN_0_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Enable(wEnable_0), .P_WR(wRegEnBot_0_0), .P_In(wRegOut_0_0), .P_Out(wRegInBot_0_0), .L_WR(wRegEnTop_1_0), .L_In(wRegOut_1_0), .L_Out(wRegInTop_1_0), .R_WR(wRegEnTop_1_1), .R_In(wRegOut_1_1), .R_Out(wRegInTop_1_1) );
BHeap_CtrlReg #( 32 ) BHCR_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .In(wCtrlOut_1), .Out(wCtrlOut_0), .Enable(wEnable_0) );
BHeap_Control #( 2, 1, 32, 1 ) BHC ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Go(wCtrlOut_1), .Done(wCtrlOut_0), .ScanIn(ScanLink0), .ScanOut(ScanLink3), .ScanEnable(ScanEnable), .ScanId(1'd0) );
`include "main_trailer.v"
