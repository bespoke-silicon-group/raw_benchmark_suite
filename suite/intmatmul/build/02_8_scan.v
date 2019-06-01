`include "main_header.v"
wire [15:0] vectorInput;
wire [31:0] matrixInput;
wire [15:0] cOutput;
IntMatMul_Control #( 2, 8, 1 ) U_IntMatMul_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorInput(vectorInput), .matrixInput(matrixInput), .cOutput(cOutput) );
VectorDotProduct #( 2, 8 ) VectorDotProduct_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[15:0]), .cOutput(cOutput[7:0]) );
VectorDotProduct #( 2, 8 ) VectorDotProduct_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[31:16]), .cOutput(cOutput[15:8]) );
`include "main_trailer.v"
