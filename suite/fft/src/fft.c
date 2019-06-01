/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/fft/src/fft.c,v 1.2 1997/08/09 05:57:18 jbabb Exp $
 *
 * Software Subroutines for Integer FFT Benchmark
 *
 * Authors: Devabhaktuni Srikrishna (chinnama@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include "fft.h"


void ADD_MINUS_1(number *a, number *b, unsigned SIZE) {

	b -> sign = (!(a -> sign) && ((a -> num)&(ALL_ONES >> (WORD-SIZE))) == 0) ? 1 : 0;
	b -> num = (a -> sign) ? (ALL_ONES >> (WORD-SIZE)) : a -> num - 1;

	return;

}/*ADD_MINUS_1*/


void NORMALIZE(number *a, number *b, unsigned carry, unsigned SIZE) {

	b -> sign = (carry && ((a -> num)&(ALL_ONES >> (WORD-SIZE))) == 0) ? 1: 0;
	b -> num = (carry && ((a -> num)&(ALL_ONES >> (WORD-SIZE))) != 0) ? ((a -> num)&(ALL_ONES >> (WORD-SIZE)))-1 : ((a -> num)&(ALL_ONES >> (WORD-SIZE)));
	
	return;

}/*NORMALIZE*/


void ADD_NN(number *a, number *b, number *c, unsigned SIZE) {

	number sum;
	unsigned carry;

	sum.sign = 0;
	sum.num = a -> num + b -> num;

	carry = ((a -> num)&(b -> num) | ((~sum.num)&((a -> num)|(b -> num))))&(ONE << (SIZE-1));

	NORMALIZE(&sum,c,carry, SIZE);

	return;

}/*ADD_NN*/


void ADD(number *a, number *b, number *c, unsigned SIZE) {

	if(a -> sign) {
		
		ADD_MINUS_1(b,c,SIZE);

		return;

	}/*if*/

	if(b -> sign) {

		ADD_MINUS_1(a,c,SIZE);

		return;

	}/*if*/

	ADD_NN(a,b,c,SIZE);

	return;

}/*ADD*/


void NEGATE(number *a, number *b, unsigned SIZE) {

	if(a -> sign) { /*a == -1*/

		b -> sign = 0;
		b -> num = 1;

		return;

	} /*if*/

	if(a -> num == 0) { /*a == 0*/

		b -> sign = 0;
		b -> num = 0;
	
		return;
	
	} /*if*/

	if(a -> num == 1) {

		b -> sign = 1;
		b -> num = 0;

		return;

	} /*if*/
	

	/* if it got this far, a > 2*/

	b -> sign = 0;
	b -> num = (ALL_ONES - (a -> num))&(ALL_ONES >> (WORD-SIZE));
	b -> num += 2;

	return;

}/*NEGATE*/


void SHIFT_UP(number *a, number *c, unsigned s, unsigned SIZE) { /* 0 <= s <= N*/

	number a_norm, b1, b2, b3, nb2, sum1, sum2;

	if(s == 0 || s == 2*SIZE) {

			c -> sign = a -> sign;
			c -> num = a -> num;
			
			return;
	}/*if*/

	a_norm.sign = a -> sign;
	a_norm.num = (a -> sign) ? 0 : a -> num;

	b1.sign = 0;
	b1.num = 0;
	b2.sign = 0;
	b2.num = 0;
	b3.sign = 0;
	b3.num = 0;

	if(!(a -> sign)) {

		b1.num = ((a_norm.num) << s)&(ALL_ONES >> (WORD-SIZE));
		b2.num = ((s <= SIZE) ? (a_norm.num >> (SIZE-s)) : (a_norm.num << (s-SIZE)))&(ALL_ONES >> (WORD-SIZE));
		b3.num = ((s <= SIZE) ? 0 : (a_norm.num >> (2*SIZE-s)))&(ALL_ONES >> (WORD-SIZE));

		NEGATE(&b2,&nb2, SIZE);
		ADD(&b1,&nb2,&sum1, SIZE);
		ADD(&sum1,&b3,c, SIZE);

		return;

	}/*if*/


	/*If it got this far a is -1*/

	if(s<SIZE) {

		b2.num = 1 << s;
	
		NEGATE(&b2,c, SIZE);
	
		return;

	}/*if*/

	c -> sign = 0;
	c -> num = 1 << (s-SIZE);

	return;

}/*SHIFT_UP*/


void COMBINATIONAL(number *il, number *ir, number *ol, number *or, unsigned s, unsigned SIZE) {

	number t1, t2;

	SHIFT_UP(ir,&t1,s, SIZE);
	NEGATE(&t1,&t2, SIZE);

	ADD(il,&t1,ol, SIZE);	
	ADD(il,&t2,or, SIZE);

	if(ol -> sign) ol -> num = 0;
	if(or -> sign) or -> num = 0;

	return;

}/*COMBINATIONAL*/


void COPY(number *a, number *b, unsigned SIZE) {

        a -> sign = b -> sign;
        a -> num = b -> num;
        
        return;


}/*COPY*/


void PRINT(number x, char *s) {

        printf("\n%s\n", s);
        printf("num == %u, sign == %u\n", x.num, x.sign);

        return;

}/*PRINT*/

