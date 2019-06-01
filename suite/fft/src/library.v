/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/fft/src/library.v,v 1.4 1997/08/09 05:57:22 jbabb Exp $
 *
 * Library for Integer FFT benchmark
 *
 * Authors: Devabhaktuni Srikrishna (chinnama@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

`include "main_define.v"


/*
 The numbers will be represented by N/2 + 1 bits. 
 The first bit is the sign bit. The remainin bits represent
 the numerical value. The highest bit is one if the number 
 represents minus one and zero otherwise.
 */

module FFT_Node(Clk, Reset, RD, WR, Addr, DataIn, DataOut, 
                ScanIn, ScanOut, ScanEnable, 
                Idl, Idr, Ids, Enable, 
                inleft, inright, outleft, outright);

   /*
    * We use three Id's:
    * one each for specifying left, right, and sign bits
    * The two least significant bits differentiate
    * between l,r,s (3=11=s, 1=01=l, 2=10=r)
    * When the left is being written, the first SIZE bits of
    * DataIn are the data bits, and similarly for right
    * When the sign is beig written, the first and second least
    * significant bits are the left and right sgn bits, resp.
    */

   parameter SIZE    = 4,
             IDWIDTH = 8,
             s       = 0,
             SCAN    = 1;
   
   
   /* global connections */
   
   input			 Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]	 Addr;
   input [`GlobalDataWidth-1:0]	 DataIn;
   output [`GlobalDataWidth-1:0] DataOut;
   
   
   /* global scan connection */

   input [SIZE-1:0]                 ScanIn;
   output [SIZE-1:0]                ScanOut;
   input                            ScanEnable;
   reg [SIZE-1:2]                   ScanReg;
   

   /* local connections*/

   input [IDWIDTH-1:0]              Idl;
   input [IDWIDTH-1:0]              Idr;
   input [IDWIDTH-1:0]              Ids;
   input                            Enable;

   input [SIZE:0]                   inleft;
   input [SIZE:0]                   inright;
   output [SIZE:0]                  outleft;
   output [SIZE:0]                  outright;

   reg [SIZE:0]                     outleft;
   reg [SIZE:0]                     outright;

   wire [SIZE:0]                    comleft;
   wire [SIZE:0]                    comright;

   
   /* instantiate FFT butterfly node */
   
   COMBINATIONAL #(SIZE, s) com(inleft,inright,comleft,comright);
   
   
   /* assigns the outputs - left, right, or sign bits */
   
   assign DataOut[`GlobalDataWidth-1:0] = 
      (!SCAN && (Addr[IDWIDTH-1:0] == Idl) ? outleft[SIZE-1:0] :
       !SCAN && (Addr[IDWIDTH-1:0] == Idr) ? outright[SIZE-1:0] : 
       !SCAN && (Addr[IDWIDTH-1:0] == Ids) ? {outright[SIZE],outleft[SIZE]} :
       `GlobalDataHighZ);
   
   assign ScanOut[SIZE-1:0] = outleft[SIZE-1:0];
   
   
   always @(posedge Clk)
      begin

 	 if(Reset)
	    begin
	       outleft = 0;
	       outright = 0;
	       ScanReg = 0;
	    end

         else if (SCAN && ScanEnable)
            begin
	       outleft[SIZE-1:0] = outright[SIZE-1:0];

               outright[SIZE-1:0] = 
                  {ScanReg[SIZE-1:2], outright[SIZE], outleft[SIZE]};

               {ScanReg[SIZE-1:2], outright[SIZE], outleft[SIZE]} = 
               ScanIn[SIZE-1:0];
            end 
         
         else if (!SCAN && WR && (Addr[IDWIDTH-1:0]==Idl))
               outleft[SIZE-1:0] = DataIn[SIZE-1:0];
	 
         else if (!SCAN && WR && (Addr[IDWIDTH-1:0]==Idr))
               outright[SIZE-1:0] = DataIn[SIZE-1:0];
         
	 else if (!SCAN && WR && (Addr[IDWIDTH-1:0]==Ids))
	    {outright[SIZE],outleft[SIZE]} = DataIn[1:0];

         else if(Enable)
            begin
               outleft[SIZE:0]  = comleft[SIZE:0];
               outright[SIZE:0] = comright[SIZE:0];
	    end
      end
   
endmodule /*FFT_Node*/


module FFT_Control(Clk, Reset, RD, WR, Addr, DataIn, DataOut,   
                   ScanIn, ScanOut, ScanEnable, ScanId,
                   Id,Enable);

   parameter SIZE    = 4,
             IDWIDTH = 8,
             SCAN    = 1;

   input                         Clk,Reset,RD,WR;
   input [`GlobalAddrWidth-1:0]  Addr;
   input [`GlobalDataWidth-1:0]  DataIn;
   output [`GlobalDataWidth-1:0] DataOut;
   
   input [IDWIDTH-1:0]           Id;
   output                        Enable;
   
   
   /* global connections for scan path (scan = 1) */
   
   input [IDWIDTH-1:0]           ScanId;
   input [SIZE-1:0]              ScanIn;
   output [SIZE-1:0]             ScanOut;
   output                        ScanEnable;   

   reg [`GlobalDataWidth-1:0]    count;
   reg [SIZE-1:0]                ScanReg;
   

   /* support for the scan interface */

   assign ScanEnable = (SCAN && (RD || WR) && (Addr[IDWIDTH-1:0]==ScanId));
   assign ScanOut[SIZE-1:0] = DataIn[SIZE-1:0];
   
   assign DataOut[`GlobalDataWidth-1:0] = 
      (Addr[IDWIDTH-1:0] == Id) ? count: 
      ((ScanEnable && RD) ? ScanReg : `GlobalDataHighZ);

   assign Enable = !(count==0);

   always @(posedge Clk)
      begin
         ScanReg = ScanIn;
         
         if (Reset)
            count=0;
         else if (WR && (Addr[IDWIDTH-1:0]==Id))
            count=DataIn;
         else if(count)
            count = count-1;
      end

endmodule /*FFT_Control*/


module ADD_MINUS_1(a, b);

   parameter SIZE = 4;

   input [SIZE:0]  a;
   output [SIZE:0] b;
   
   wire [SIZE-1:0] ALL_ONES = ~0;

   assign b[SIZE]     = (!a[SIZE] && a[SIZE-1:0] == 0) ? 1 : 0;
   assign b[SIZE-1:0] = (a[SIZE]) ? ALL_ONES : a[SIZE-1:0] - 1;

endmodule /*ADD_MINUS_1*/


/*subtracts one from a if sgn_bit is one does nothing otherwise*/

module NORMALIZE(a,b);
   
   parameter SIZE = 4;

   input [SIZE:0]  a;
   output [SIZE:0] b;

   assign b[SIZE] = 
      (a[SIZE] && a[SIZE-1:0] == 0) ? 1 : 0;    

   assign b[SIZE-1:0] =
      (a[SIZE] && a[SIZE-1:0] != 0) ? a[SIZE-1:0]-1 : a[SIZE-1:0];

endmodule /*NORMALIZE*/


/* a and b have to have their sign bits zero */

module ADD_NN(a, b, c);

   parameter SIZE = 4;

   input [SIZE:0]  a;
   input [SIZE:0]  b;
   output [SIZE:0] c;

   wire [SIZE:0]   sum;

   assign sum[SIZE-1:0] = a[SIZE-1:0]+b[SIZE-1:0];
   assign sum[SIZE] = (a[SIZE-1] & b[SIZE-1]) | ((~sum[SIZE-1]) & (a[SIZE-1] | b[SIZE-1]));

   NORMALIZE    #(SIZE) norm(sum, c);

endmodule /*ADD_NN*/


module ADD(a, b, c);

   parameter SIZE = 4;

   input [SIZE:0]  a;
   input [SIZE:0]  b;

   output [SIZE:0] c;

   wire [SIZE:0]   sum1, sum2, sum3;

   ADD_NN        #(SIZE) add_nn(a,b,sum1);

   ADD_MINUS_1 #(SIZE) am1(a,sum2);
   ADD_MINUS_1 #(SIZE) am2(b,sum3);
   
   assign c[SIZE:0] = (a[SIZE] || b[SIZE]) ? (a[SIZE] ? sum3 : sum2) : sum1;

endmodule /*ADD*/


/*negates the number a */

module NEGATE(a, b);

   parameter SIZE = 4;

   input [SIZE:0]  a;
   output [SIZE:0] b;

   wire [SIZE:0]   minus1 = (1 << SIZE), ozzo = (1 << SIZE) + 1;

   assign b[SIZE:0] = 
      a[SIZE] ? 1 : ((a[SIZE-1:0] == 0) ? 0 : ((a[SIZE-1:0] == 1) ? 
					       minus1 : ozzo-a));

endmodule /*NEGATE*/


/* shifts up a by s bits 0 <= s <= N */

module SHIFT_UP(a, c);

   parameter SIZE = 4,
	     s    = 0;
   
   input [SIZE:0]  a;
   output [SIZE:0] c;

   wire [SIZE:0]   a_norm, b1, b2, b3, nb2, sum1, sum2; 
   

   assign       a_norm[SIZE] = a[SIZE];



   assign       a_norm[SIZE-1:0] = a[SIZE] ? 0 : a[SIZE-1:0];

   /* if a is -1, then makes all other bits zero */

   
   assign       b1[SIZE:0] = (a_norm[SIZE:0] << s) & (~(1 << SIZE));
   assign       b2[SIZE:0] = 0;

   /* ((s <= SIZE) ? (a_norm[SIZE:0] >> ((s <= SIZE) ? SIZE-s: 0)) :
    (a_norm[SIZE:0] << ((s > SIZE) ? s-SIZE : 0))) & (~(1 << SIZE)); */

   
   assign       b3[SIZE:0] = 0;
   
   /* ((s <= SIZE) ? 0 : (a_norm[SIZE:0] >> ((s <= 2*SIZE) ? 2*SIZE-s : 0)))
    & (~(1 << SIZE));*/

   
   NEGATE #(SIZE) negate(b2,nb2);
   ADD    #(SIZE) add1(b1,nb2,sum1);
   ADD    #(SIZE) add2(sum1,b3,sum2);

   /*SIZE << 1 == N*/
   assign c[SIZE:0] = (s == 0 || s == (SIZE << 1)) ? a[SIZE:0] : sum2[SIZE:0]; 

endmodule /*SHIFT_UP*/


module COMBINATIONAL(a,b,x,y); /*The node in the butterfly network*/ 

   parameter SIZE = 4,
	     s    = 0;
   
   /*s is usually between 0 and N, but is eq. to N+1 when we require 
    * it to equate input and outputs */

   input [SIZE:0]  a;
   input [SIZE:0]  b;
   output [SIZE:0] x;
   output [SIZE:0] y;

   wire [SIZE:0]   t1, t2, t3, t4;

   assign x = 
      (s == (SIZE << 1) +1) ? a : ((t3[SIZE]) ? t3 & (1 << SIZE) : t3); 

   assign y = 
      (s == (SIZE << 1) +1) ? b : ((t4[SIZE]) ? t4 & (1 << SIZE) : t4); 

   SHIFT_UP  #(SIZE, s) shift(b,t1);
   NEGATE    #(SIZE)    neg(t1,t2);
   
   ADD       #(SIZE)    add1(a,t1,t3);
   ADD       #(SIZE)    add2(a,t2,t4);

endmodule /*COMBINATIONAL*/
