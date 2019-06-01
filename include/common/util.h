/*
 * $Header: /projects/raw/cvsroot/benchmark/include/common/util.h,v 1.2 1997/08/09 05:56:18 jbabb Exp $
 *
 * RAW Benchmark Suite common library header for misc utils
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */


#ifndef UTIL_H
#define UTIL_H

#include <math.h>
#include <sys/types.h>


/* Should be same parameters as in main_define.v */

#define GlobalDataWidth 32
#define GlobalAddrWidth 15


/* log function */

int int_log(int val) { return (int)(ceil(log((double)val)/log((double)2))); }


/* power function */

int int_pow(int x, int y)
{
  int i;
  int ret_val = 1;
  for (i=1; i<=y; i++) {
    ret_val *= x;
  }
  return(ret_val);
}


/* 2-d array referencing */

#define ref(i, j) ((j)+(i)*sizey)

int seed;


Initrand()
{
  seed = 74755;
}

int Rand()
{
  seed = (seed * 1309 + 13849);
  return (seed);
}


print_array(u_int a[], int size)
{
  int i;
  for (i=0;i<size-1;i++)
    printf("%x, ", a[i]);
  printf("%x\n", a[size-1]);
}

compare_array(u_int hardware[], u_int software[], int size)
{
  int i, fail=0;
  printf("hardware,     software\n");
  for (i=0;i<size;i++)
    {
      printf("%x, %x\n",hardware[i], software[i]);
    if(hardware[i] != software[i]) fail=1;
    }

  compare_status(fail);
}


compare_status(int fail)
{
  if (fail)
    printf("Result: Failure - hardware output does not match software.\n");
  else
    printf("Result: Succcess - hardware output matches software.\n");
}


report_results(int size, int width, int cycles, float soft_time)
{
  printf("Result: Hardware-elements %d elements\n",size);
  printf("Result: Hardware-bitwidth %d bits\n",width);
  printf("Result: Hardware-cycles %d cycles\n",cycles);
/*printf("Result: Software-time %g seconds\n",soft_time);*/
  printf("Result: Software-speed %g Hertz\n",1./soft_time);
}

#define MAXLEN 1024
#define MAXSIZE 32767
#define MAXPOLL 100000

#endif UTIL_H
