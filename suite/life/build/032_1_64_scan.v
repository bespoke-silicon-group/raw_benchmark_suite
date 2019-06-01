`include "main_header.v"
wire [31:0] nOut0_0;
wire [31:0] nScanOut0;
wire [0:0] nEnable;
wire [0:0] nScanEnable;
wire [31:0] nScanOut1;
Life_Block #( 1, 1 ) U_Life_Block_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(nEnable), .BLOCK_VALUE(nOut0_0), .NORTH_EDGE(32'd0), .SOUTH_EDGE(32'd0), .EAST_EDGE(1'd0), .NE_EDGE(1'd0), .SE_EDGE(1'd0), .WEST_EDGE(1'd0), .NW_EDGE(1'd0), .SW_EDGE(1'd0), .ScanIn(nScanOut1), .ScanOut(nScanOut0), .ScanEnable(nScanEnable) );
Life_Control #( 32, 7, 1, 1 ) U_Life_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(nEnable), .ScanId(1'd0), .ScanEnable(nScanEnable), .ScanIn(nScanOut0), .ScanOut(nScanOut1) );
`include "main_trailer.v"
