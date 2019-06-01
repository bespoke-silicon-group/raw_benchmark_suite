`include "main_header.v"
wire [63:0] vectorInput;
wire [511:0] matrixInput;
wire [63:0] cOutput;
IntMatMul_Control #( 8, 8, 1 ) U_IntMatMul_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorInput(vectorInput), .matrixInput(matrixInput), .cOutput(cOutput) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[63:0]), .cOutput(cOutput[7:0]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[127:64]), .cOutput(cOutput[15:8]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[191:128]), .cOutput(cOutput[23:16]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[255:192]), .cOutput(cOutput[31:24]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[319:256]), .cOutput(cOutput[39:32]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[383:320]), .cOutput(cOutput[47:40]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[447:384]), .cOutput(cOutput[55:48]) );
VectorDotProduct #( 8, 8 ) VectorDotProduct_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[511:448]), .cOutput(cOutput[63:56]) );
`include "main_trailer.v"
