/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/mm.h,v 1.2 1997/08/09 05:57:33 jbabb Exp $
 *
 * Matrix Multiply Utilities Header
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#ifndef MM_H
#define MM_H

typedef int MultiplyType;

void MatrixMultiplyTwo(MultiplyType *srcA,
		       MultiplyType *srcB,
		       MultiplyType *dest,
		       int n,
		       int m,
		       int p);

#endif MM_H
