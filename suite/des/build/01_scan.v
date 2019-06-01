`include "main_header.v"
wire [63:0] key;
wire [0:0] start;
wire [0:0] rdy0;
wire [31:0] ScanLink0;
wire [31:0] ScanLink1;
wire [0:0] ScanEnable;
DES_Control #( 64, 2, 1, 1 ) U_DES_Control_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .key(key), .start(start), .rdy(rdy1), .ScanOut(ScanLink1), .ScanIn(ScanLink0), .ScanEnable(ScanEnable), .ScanId(1'd1) );
DES_Node #( 64, 2, 1, 1 ) U_DES_Node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .key(key), .start(start), .rdy(rdy1), .ScanIn(ScanLink1), .ScanOut(ScanLink0), .ScanEnable(ScanEnable) );
`include "main_trailer.v"
