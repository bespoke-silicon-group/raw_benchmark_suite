`include "main_header.v"
wire [127:0] vectorInput;
wire [2047:0] matrixInput;
wire [127:0] cOutput;
IntMatMul_Control #( 16, 8, 1 ) U_IntMatMul_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorInput(vectorInput), .matrixInput(matrixInput), .cOutput(cOutput) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[127:0]), .cOutput(cOutput[7:0]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[255:128]), .cOutput(cOutput[15:8]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[383:256]), .cOutput(cOutput[23:16]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[511:384]), .cOutput(cOutput[31:24]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[639:512]), .cOutput(cOutput[39:32]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[767:640]), .cOutput(cOutput[47:40]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[895:768]), .cOutput(cOutput[55:48]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1023:896]), .cOutput(cOutput[63:56]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1151:1024]), .cOutput(cOutput[71:64]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1279:1152]), .cOutput(cOutput[79:72]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1407:1280]), .cOutput(cOutput[87:80]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1535:1408]), .cOutput(cOutput[95:88]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1663:1536]), .cOutput(cOutput[103:96]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1791:1664]), .cOutput(cOutput[111:104]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[1919:1792]), .cOutput(cOutput[119:112]) );
VectorDotProduct #( 16, 8 ) VectorDotProduct_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[2047:1920]), .cOutput(cOutput[127:120]) );
`include "main_trailer.v"
