`include "main_header.v"
wire [31:0] vectorInput;
wire [127:0] matrixInput;
wire [31:0] cOutput;
IntMatMul_Control #( 4, 8, 1 ) U_IntMatMul_Control ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorInput(vectorInput), .matrixInput(matrixInput), .cOutput(cOutput) );
VectorDotProduct #( 4, 8 ) VectorDotProduct_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[31:0]), .cOutput(cOutput[7:0]) );
VectorDotProduct #( 4, 8 ) VectorDotProduct_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[63:32]), .cOutput(cOutput[15:8]) );
VectorDotProduct #( 4, 8 ) VectorDotProduct_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[95:64]), .cOutput(cOutput[23:16]) );
VectorDotProduct #( 4, 8 ) VectorDotProduct_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .vectorAInput(vectorInput), .vectorBInput(matrixInput[127:96]), .cOutput(cOutput[31:24]) );
`include "main_trailer.v"
