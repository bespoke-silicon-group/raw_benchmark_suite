`include "main_header.v"
wire [63:0] key;
wire [0:0] start;
wire [0:0] rdy0;
wire [31:0] ScanLink0;
wire [0:0] rdy1;
wire [31:0] ScanLink1;
wire [0:0] rdy2;
wire [31:0] ScanLink2;
wire [0:0] rdy3;
wire [31:0] ScanLink3;
wire [31:0] ScanLink4;
wire [0:0] ScanEnable;
DES_Control #( 64, 2, 1, 1 ) U_DES_Control_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .key(key), .start(start), .rdy(rdy1), .ScanOut(ScanLink4), .ScanIn(ScanLink0), .ScanEnable(ScanEnable), .ScanId(1'd1) );
DES_Node #( 64, 2, 1, 1 ) U_DES_Node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .key(key), .start(start), .rdy(rdy1), .ScanIn(ScanLink1), .ScanOut(ScanLink0), .ScanEnable(ScanEnable) );
DES_Node #( 64, 2, 1, 1 ) U_DES_Node_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd2), .key(key), .start(start), .rdy(rdy2), .ScanIn(ScanLink2), .ScanOut(ScanLink1), .ScanEnable(ScanEnable) );
DES_Node #( 64, 2, 1, 1 ) U_DES_Node_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd3), .key(key), .start(start), .rdy(rdy3), .ScanIn(ScanLink3), .ScanOut(ScanLink2), .ScanEnable(ScanEnable) );
DES_Node #( 64, 2, 1, 1 ) U_DES_Node_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd4), .key(key), .start(start), .rdy(rdy4), .ScanIn(ScanLink4), .ScanOut(ScanLink3), .ScanEnable(ScanEnable) );
`include "main_trailer.v"
