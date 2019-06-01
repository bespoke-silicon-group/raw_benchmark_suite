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
wire [0:0] nEnable;
wire [0:0] nScanEnable;
wire [31:0] nScanOut6;
Life_Block #( 1, 1 ) U_Life_Block_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_0), .NORTH_EDGE(32'd0), .SOUTH_EDGE(nOut0_1), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut1), .ScanOut(nScanOut0), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_1), .NORTH_EDGE(nOut0_0), .SOUTH_EDGE(nOut0_2), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut2), .ScanOut(nScanOut1), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_2), .NORTH_EDGE(nOut0_1), .SOUTH_EDGE(nOut0_3), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut3), .ScanOut(nScanOut2), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_3), .NORTH_EDGE(nOut0_2), .SOUTH_EDGE(nOut0_4), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut4), .ScanOut(nScanOut3), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_4), .NORTH_EDGE(nOut0_3), .SOUTH_EDGE(nOut0_5), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut5), .ScanOut(nScanOut4), .ScanEnable(nScanEnable) );
Life_Block #( 1, 1 ) U_Life_Block_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_5), .NORTH_EDGE(nOut0_4), .SOUTH_EDGE(32'd0), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut6), .ScanOut(nScanOut5), .ScanEnable(nScanEnable) );
Life_Control #( 32, 7, 1, 1 ) U_Life_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(nEnable), .ScanId(1'd0), .ScanEnable(nScanEnable), .ScanIn(nScanOut0), .ScanOut(nScanOut6) );
`include "main_trailer.v"
