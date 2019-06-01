/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/fft/src/fft.h,v 1.2 1997/08/09 05:57:19 jbabb Exp $
 *
 * Software Subroutines Header for Integer FFT Benchmark
 *
 * Authors: Devabhaktuni Srikrishna (chinnama@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#define WORD 32 /*length of unsigned*/
#define ALL_ONES ((unsigned) (~0))
#define ONE ((unsigned) 1)
#define DEBUG 0

struct number {

        unsigned num;   
        unsigned sign; /*==1 if -1, 0 otherwise*/


};

typedef   struct number   number;

void ADD_MINUS_1(number *, number *, unsigned);
void NORMALIZE(number *, number *, unsigned , unsigned);
void ADD_NN(number *, number *, number *, unsigned);
void ADD(number *, number *, number *, unsigned);
void NEGATE(number *, number *, unsigned);
void SHIFT_UP(number *, number *, unsigned, unsigned);
void COMBINATIONAL(number *,  number *, number *, number *, unsigned, unsigned);
void COPY(number *, number *, unsigned);

void PRINT(number,char *);
