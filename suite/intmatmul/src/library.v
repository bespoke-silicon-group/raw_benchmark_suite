/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/library.v,v 1.8 1997/08/10 01:23:09 jbabb Exp $
 *
 * Library for Matrix Multiply Benchmark
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 * *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


module VectorDotProduct (Clk, Reset, RD, WR, Addr, DataIn, DataOut, 
			 vectorAInput, vectorBInput, cOutput);

   parameter pVectorSize = 4,
	     pWordSize = 4;
   
   input				 Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]		 Addr;
   input [`GlobalDataWidth-1:0]		 DataIn;
   output [`GlobalDataWidth-1:0]	 DataOut;
   
   input [pVectorSize * pWordSize - 1:0] vectorAInput;
   input [pVectorSize * pWordSize - 1:0] vectorBInput;   
   output [pWordSize - 1:0]		 cOutput;
   reg [pWordSize - 1:0]		 cOutput;
   
   integer				 i,j;
   
   reg [pWordSize-1:0]			 tempA;
   reg [pWordSize-1:0]			 tempB;
   reg [pWordSize-1:0]			 result;

   always @(posedge Clk)   
   begin    
	 result = 0;
	 
	 for (i = 0; i < pVectorSize; i = i + 1)
	    begin
		  for (j = 0; j < pWordSize; j = j + 1)
			   begin
				 tempA[j] = vectorAInput[i*pWordSize + j];
				 tempB[j] = vectorBInput[i*pWordSize + j];
			   end
		  result = result + tempA * tempB;		
	    end
	 cOutput = result;
   end
endmodule


module IntMatMul_Control(Clk, Reset, RD, WR, Addr, DataIn, DataOut,
			 vectorInput, matrixInput, cOutput);

   parameter pVectorSize = 4,
	     pWordSize   = 4,
	     pScan       = 1;
   
   /* global connections */

   input						Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]				Addr;
   input [`GlobalDataWidth-1:0]				DataIn;
   output [`GlobalDataWidth-1:0]			DataOut;
   output [pVectorSize * pWordSize - 1:0]		vectorInput;  
   output [pVectorSize * pVectorSize * pWordSize - 1:0]	matrixInput;
   input [pVectorSize * pWordSize - 1:0]		cOutput;   
   

   /* local connections */

   reg [pVectorSize * pWordSize - 1:0]			vectorInput;
   reg [pVectorSize * pVectorSize * pWordSize - 1:0]	matrixInput;
   

   /* note: there is a read bus timing problem with this being a register */

   reg [pWordSize - 1:0]				holder;

   integer						i;
   
   assign DataOut = ((RD == 1) ? holder :  `GlobalDataHighZ);
   
   always @(posedge Clk)
      begin
	 if (pScan)
	    begin
	       if (WR && (Addr[1:0] == 0))
		  begin


		     /* shift the register over */

		     for (i = 0; i < pWordSize*(pVectorSize*pVectorSize - 1); 
			  i= i + 1)
			begin
			   matrixInput[i] = matrixInput[i+pWordSize];
			end 


		     /* insert the data word */

		     for (i = 0; i < pWordSize; i = i + 1)
			begin
			   matrixInput[i+(pVectorSize*pVectorSize - 1)
				       *pWordSize] = DataIn[i];
			end 
		  end 
	       else
		  if (WR && (Addr[1:0] == 1))
		     begin
			

			/* shift the register over */
		       
			for (i = 0; i < pWordSize*(pVectorSize - 1); i = i + 1)
			   begin
			      vectorInput[i] = vectorInput[i+pWordSize];
			   end
			for (i = 0; i < pWordSize; i = i + 1)
			   begin
			      vectorInput[i+pWordSize*(pVectorSize - 1)] = 
				 DataIn[i];
			   end
		     end
		  else
		     if (RD && (Addr < pVectorSize))
			begin
			   for (i = 0; i < pWordSize; i = i + 1)
			      begin
				 holder[i] = cOutput[i + Addr*pWordSize];
			      end
			end 
	    end
	 else
	    begin
	       
	       if (WR && Addr < pVectorSize*pVectorSize)
		  begin
		     for (i = 0; i < pWordSize; i = i+1)
			matrixInput[Addr * pWordSize + i] = DataIn[i];
		     $display("WriteMatrix *(%h) = %h\n",Addr,DataIn); 
		  end
	       else
		  if (WR && Addr < pVectorSize*(pVectorSize+1))
		     begin
			for (i = 0; i < pWordSize; i=i+1)
			   vectorInput[(Addr - pVectorSize*pVectorSize) 
				       * pWordSize + i] = DataIn[i];
			$display("WriteVector *(%h) = %h\n",Addr,DataIn); 
		     end
		  else
		     if (RD && Addr < pVectorSize)
			begin
			   for (i = 0; i < pWordSize; i=i+1)
			      holder[i] = cOutput[Addr * pWordSize + i];
			   $display("ReadVector *(%h) -> %h\n",Addr,holder); 
			end 
	    end

	 /* might eventually have a ready flag */

      end
endmodule
