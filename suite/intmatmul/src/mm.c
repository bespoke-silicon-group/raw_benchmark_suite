/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/mm.c,v 1.5 1997/08/10 01:23:11 jbabb Exp $
 *
 * Matrix Multiply Utilities
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <stdio.h>
#include <stdlib.h>
#include "Error.h"
#include "mm.h"


#define VERIFY_RESULTS 0

#ifdef HARDWARE
extern void HardwareMultiply(MultiplyType *srcA,
			     MultiplyType *srcB,
			     MultiplyType *dest,
			     int n,
			     int m,
			     int p);
#define MatrixMultiplyPrimitive HardwareMultiply
#else
#ifdef SIMULATION
extern void HardwareMultiply(MultiplyType *srcA,
			     MultiplyType *srcB,
			     MultiplyType *dest,
			     int n,
			     int m,
			     int p);
#define MatrixMultiplyPrimitive HardwareMultiply
#else
#ifdef SOFTWARE
#define MatrixMultiplyPrimitive MatrixMultiplyTwo
#else
#error One of HARDWARE, SIMULATION, or SOFTWARE must be defined.
#endif /* software */
#endif /* simulation */
#endif /* hardware */

int gThreshHold = 16;


/*************************************************
 * MatrixMultiplyTwo
 * 
 * Matrix Multiply Algorithm
 *
 * Simpleton method, cache smart. 
 *
 ************************************************/

void MatrixMultiplyTwo(MultiplyType *srcA,
		       MultiplyType *srcB,
		       MultiplyType *dest,
		       int n,
		       int m,
		       int p)
{
  int i,j,k;

  /* for every row in the first matrix */
  for (i = 0; i < n; i++)
    {
      int destIndex;

      destIndex = i*p;
	 
      for (j = 0; j < p; j++)
	   dest[destIndex+j] = 0;
	 
      /* for every column in the first matrix */
      for (j = 0; j < m; j++)
	   {		
		int srcVal;
		int srcBIndex;
		
		srcVal = srcA[i*m+j];

		destIndex = i*p;
		srcBIndex = j*p;
		
		for (k = 0; k < p; k++)
		    dest[destIndex++] += srcVal*srcB[srcBIndex++];
	   }
    }
}

/*************************************************
 * MatrixAdd
 * 
 * Adds two matrices.
 *
 ************************************************/

void MatrixAdd(MultiplyType *srcA,
			MultiplyType *srcB,
			MultiplyType *dest,
			int width,
			int height)
{
  int i, numEls;
  
  numEls = width * height;
  for (i = 0; i < numEls; i++)
    dest[i] = srcA[i] + srcB[i];
}


/*************************************************
 * MatrixSub
 * 
 * dest = srcA - srcB
 *
 ************************************************/

void MatrixSub(MultiplyType *srcA,
			MultiplyType *srcB,
			MultiplyType *dest,
			int width,
			int height)
{
  int i, numEls;

  numEls = width * height; 
  for (i = 0; i < numEls; i++)
    dest[i] = srcA[i] - srcB[i];
}


/*************************************************
 * ExtractMatrix
 *
 ************************************************/

void ExtractMatrix(MultiplyType *srcA,
			    MultiplyType *dest,
			    int srcWidth,
			    int srcHeight,
			    int dstWidth,
			    int dstHeight,
			    int dstStartX,
			    int dstStartY)
{
  int curEl, diffEl, endEl;
  int i;
  /*
  printf("n = %d, m = %ld, n2 = %d m2 = %d %d %d\n",srcWidth,srcHeight,
	    dstWidth,dstHeight,dstStartX, dstStartY);
	    */
  endEl = (dstStartY + dstHeight - 1)*srcWidth + dstStartX + dstWidth; 
  diffEl = srcWidth - dstWidth;
  
  for (curEl = dstStartY*srcWidth + dstStartX; curEl < endEl; curEl += diffEl)
    for (i = 0; i < dstWidth; i++)
	 *dest++ = srcA[curEl++];
}


/*************************************************
 * InsertMatrix
 *
 ************************************************/

void InsertMatrix(MultiplyType *srcA,
			   MultiplyType *dest,
			   int srcWidth,
			   int srcHeight,
			   int dstWidth,
			   int dstHeight,
			   int dstStartX,
			   int dstStartY)
{
  int curEl, diffEl, endEl;
  int i;

  endEl = (dstStartY + dstHeight - 1)*srcWidth + dstStartX + dstWidth; 
  diffEl = srcWidth - dstWidth;
  
  for (curEl = dstStartY*srcWidth + dstStartX; curEl < endEl; curEl += diffEl)
    for (i = 0; i < dstWidth; i++)
	 dest[curEl++] = *srcA++;
}


/*************************************************
 * StrassenMultiply
 *
 * space should be of at least size
 * 
 * 1 3/8 [ (5/4)NM + (5/4)MP + 2NP  ]
 *
 *
 ************************************************/

void StrassenMultiply(MultiplyType *srcA,
				  MultiplyType *srcB,
				  MultiplyType *dest,
				  MultiplyType *space,
				  int n,
				  int m,
				  int p)
{
  int newN;
  int newM;
  int newP;
  MultiplyType *a11,*a12,*a21,*a22,*b11,*b12,*b21,*b22;
  MultiplyType *p1,*p2,*p3,*p4,*p5,*p6,*p7;
  MultiplyType *aTemp,*bTemp, *cTemp;
  int blockSizeA;
  int blockSizeB;
  int blockSizeC;

  newN = n >> 1;
  newM = m >> 1;
  newP = p >> 1;

  /* if we've reached the threshold, we'll just multiply it */
  /* the regular way */

  if ((newN < gThreshHold) || (newM < gThreshHold) || (newP < gThreshHold))
  {
    MatrixMultiplyPrimitive(srcA, srcB, dest, n, m, p);
    return;
  }

  blockSizeA = newN*newM;
  blockSizeB = newM*newP;
  blockSizeC = newN*newP;

  a11 = space; a12 = a11+blockSizeA;
  a21 = a12+blockSizeA; a22 = a21 + blockSizeA;
  /*  printf("n = %d, m = %ld\n",n,m); */
  ExtractMatrix(srcA,a11,m,n,newM,newN,0,0);
  ExtractMatrix(srcA,a12,m,n,newM,newN,newM,0);
  ExtractMatrix(srcA,a21,m,n,newM,newN,0,newN);
  ExtractMatrix(srcA,a22,m,n,newM,newN,newM,newN);

  b11 = a22 + blockSizeA; b12 = b11 + blockSizeB;
  b21 = b12 + blockSizeB; b22 = b21 + blockSizeB;

  ExtractMatrix(srcB,b11,p,m,newP,newM,0,0);
  ExtractMatrix(srcB,b12,p,m,newP,newM,newP,0);
  ExtractMatrix(srcB,b21,p,m,newP,newM,0,newM);
  ExtractMatrix(srcB,b22,p,m,newP,newM,newP,newM);

  p1 = b22 + blockSizeB;
  p2 = p1 + blockSizeC;
  p3 = p2 + blockSizeC;
  p4 = p3 + blockSizeC;
  p5 = p4 + blockSizeC;
  p6 = p5 + blockSizeC;
  p7 = p6 + blockSizeC;
  cTemp = p7 + blockSizeC;

  aTemp = cTemp + blockSizeC;
  bTemp = aTemp + blockSizeA;
 
  MatrixAdd(a11,a22,aTemp,newM,newN);
  MatrixAdd(b11,b22,bTemp,newP,newM);
  StrassenMultiply(aTemp,bTemp,p1,bTemp+blockSizeB,newN,newM,newP);

  MatrixAdd(a21,a22,aTemp,newM,newN);
  StrassenMultiply(aTemp,b11,p2,bTemp+blockSizeB,newN,newM,newP);

  MatrixSub(b12,b22,bTemp,newP,newM);
  StrassenMultiply(a11,bTemp,p3,bTemp+blockSizeB,newN,newM,newP);

  MatrixSub(b21,b11,bTemp,newP,newM);
  StrassenMultiply(a22,bTemp,p4,bTemp+blockSizeB,newN,newM,newP);

  MatrixAdd(a11,a12,aTemp,newM,newN);
  StrassenMultiply(aTemp,b22,p5,bTemp+blockSizeB,newN,newM,newP);

  MatrixSub(a21,a11,aTemp,newM,newN);
  MatrixAdd(b11,b12,bTemp,newP,newM);
  StrassenMultiply(aTemp,bTemp,p6,bTemp+blockSizeB,newN,newM,newP);

  MatrixSub(a12,a22,aTemp,newM,newN);
  MatrixAdd(b21,b22,bTemp,newP,newM);
  StrassenMultiply(aTemp,bTemp,p7,bTemp+blockSizeB,newN,newM,newP);

  MatrixAdd(p1,p4,cTemp,newP,newN);
  MatrixSub(cTemp,p5,cTemp,newP,newN);
  MatrixAdd(cTemp,p7,cTemp,newP,newN);
  InsertMatrix(cTemp,dest,p,n,newP,newN,0,0);

  MatrixAdd(p3,p5,cTemp,newP,newN);
  InsertMatrix(cTemp,dest,p,n,newP,newN,newP,0);  

  MatrixAdd(p2,p4,cTemp,newP,newN);
  InsertMatrix(cTemp,dest,p,n,newP,newN,0,newN);

  MatrixAdd(p1,p3,cTemp,newP,newN);
  MatrixSub(cTemp,p2,cTemp,newP,newN);
  MatrixAdd(cTemp,p6,cTemp,newP,newN);
  InsertMatrix(cTemp,dest,p,n,newP,newN,newP,newN);

  /* still need to fix up edges */

}


/*************************************************
 * FillMatrix
 * 
 * Fills a matrix with sequential values.
 * Row major order.
 *
 ************************************************/

void FillMatrix(MultiplyType *m, int numEls)
{
  int i;
  
  for (i = 0; i < numEls; i++)
    m[i] = i;
}


/*************************************************
 * PrintMatrix
 * 
 * Prints the contents of a matrix.
 * Assumes MultiplyType is int.
 ************************************************/

void PrintMatrix(MultiplyType *matrix, int n, int m)
{
  int i;
  int j;
  
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++)
      printf("%d%c",matrix[i*m+j], (j == m - 1) ? '\n' : ' ');

  printf("\n");
}


/*************************************************
 * main.c
 * 
 * driver
 *
 ************************************************/


#define PrintMatrix(a, b, c)
 
void RunMatrixMultiplyTest(int sizeN)
{
  int i,j;
  long time;
  long time2;

  MultiplyType *srcA;
  MultiplyType *srcB;
  MultiplyType *dest;
  MultiplyType *space;


  /* The amount of space to reserve is
   *	technically ((5*kSrcARows*kSrcACols + 5*kSrcARows*kSrcBCols
   *	+ 8*kSrcACols*kSrcBCols)*12)/32
   */

  space = malloc(((5*sizeN*sizeN + 5*sizeN*sizeN
			  + 8*sizeN*sizeN)*12)/32 * sizeof(MultiplyType));

  srcA = malloc(sizeN*sizeN*sizeof(MultiplyType));
  srcB = malloc(sizeN*sizeN*sizeof(MultiplyType));
  dest = malloc(sizeN*sizeN*sizeof(MultiplyType));

  verify((long)space*(long)srcA*(long)srcB*(long)dest != 0,"Out of memory");

  FillMatrix(srcA, sizeN*sizeN);
  FillMatrix(srcB, sizeN*sizeN);

  PrintMatrix(srcA, sizeN, sizeN);
  PrintMatrix(srcB, sizeN, sizeN);  
 
  time = clock();

  StrassenMultiply(srcA, srcB, dest, space, sizeN, sizeN, sizeN);

  time2 = clock();
  time = time2 - time;
  
  PrintMatrix(dest, kSrcARows, kSrcBCols);  
  /*  
  printf("%ld microseconds\n", time);
  */
  time2 = clock();
#if VERIFY_RESULTS
  MatrixMultiplyTwo(srcA, srcB, space, kSrcARows, kSrcACols, kSrcBCols);
  
  printf("%ld microseconds\n", clock()-time2);

  PrintMatrix(space, kSrcARows, kSrcBCols);  
  
  for (i = 0; i < kSrcARows*kSrcBCols; i++)
    {
	 if (dest[i] != space[i])
	   {
		fprintf(stderr,"Error in calculations %d\n",i);
		exit(-1);  
	   }
    }

  fprintf(stderr,"Calculation check successful.\n");
#endif

  free(srcA);
  free(srcB);
  free(dest);
  free(space);
}
 
