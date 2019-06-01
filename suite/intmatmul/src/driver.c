/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/driver.c,v 1.7 1997/08/10 01:23:06 jbabb Exp $
 *
 * Driver for Integer Matrix Multiply benchmark
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <stdio.h>
#include <util.h>
#include <tval.h>
#include "Error.h"
#include "mm.h"

#ifdef HARDWARE
#include <interface.h>
#endif


/* The following set of macros configures the driver
 * according to the mode we are running in:
 *
 * -DSOFTWARE    a software-only version of the benchmark.
 * -DSIMULATION  generates simulation vectors to a verilog file.
 * -DHARDWARE    runs reconfigurable hardware via a memory-mapped interface.
 *
 * The modes can be -DHARDWARE, SIMULATION, and SOFTWARE.
 *
 * The intRead, intWrite, intClose and intOpen calls
 * are defined for a generic interface for both the
 * HARDWARE and SIMULATION modules. They map to the corresponding
 * functions:
 * 
 *
 * Simulation:
 * (generate_verilog.h)
 *
 *   vectorRead  - generate a verilog read vector for the test shell
 *   vectorWrite - generate a verilog write vector for the test shell
 *   vectorNop   - generate a verilog nop vector for the test shell
 *
 * Hardware:
 * (interface.h)
 *
 *   interfaceOpen  - open the memory mapped SBus to VLE interface
 *   interfaceClose - close the memory mapped SBus to VLE interface
 *   interfaceRead  - a macro to read from the interface
 *   interfaceWrite - a macro to write to the interface
 *
 */

/* An additional flag -DHARDWARE_ONLY (currently unused) turns off execution
   and comparison of the software version whenever the hardware is driven */

#ifdef HARDWARE
#define driver DriverNotSoftware
char* gDriverMode="hardware";
#define intWrite(base, index, value) interfaceWrite(base + index, value)
#define intRead(base, index, value) interfaceRead(base + index, value)
#define intOpen(x) interfaceOpen(x)
#define intClose() interfaceClose()
#define intNoop(x) 
#else

#ifdef SIMULATION
#define driver DriverNotSoftware
char* gDriverMode="simulation";
#define intWrite(base, index, value) vectorWrite(index, value)
#define intRead(base, index, value) vectorRead(index, value)
#define intOpen(x)
#define intClose()
#define intNoop(x) vectorNop(x)
#else

#ifdef SOFTWARE
#define driver DriverSoftware
char* gDriverMode="software";
#else

#error One of HARDWARE, SIMULATION, or SOFTWARE must be defined.
#endif /* software */
#endif /* simulation */
#endif /* hardware */


int gBitWidth;
int gScan = 1;


#ifndef SOFTWARE

void HardwareMultiply(MultiplyType *srcA,
		      MultiplyType *srcB,
		      MultiplyType *dest,
		      int n,
		      int m,
		      int p)
{
  u_long* base;
  int i, j, data, pollCount, fail=0;
  unsigned int mask;

  verify((n == m) && (m == p), "We currently only handle square matrices");

  intOpen(&base);


  /* we transmit the second matrix first */
  /* so that we (could) overlap the reading */
  /* of the result matrix back */


  /* transmit the transpose of the second matrix */

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
	 intWrite(base, (gScan ? 0 : i*n+j), srcB[j*n+i]);

#ifndef HARDWARE_ONLY


  /* We use the software algorithm to check the results */

  MatrixMultiplyTwo(srcA,srcB,dest,n,m,p);
  

  /* create mask to mask off all but lower gBitWidth bits */

  mask = 1;
  for (i = 0; i < gBitWidth - 1; i++)
    mask = mask | (mask << 1);
  
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
	 dest[i*n+j] = dest[i*n+j] & mask;


#ifdef HARDWARE
      printf("hardware,     software\n");
#endif

#endif


  /* transmit the rows of the first matrix */

  for (i = 0; i < n; i++)
    {

	 /* transmit a row */

	 for (j = 0; j < n; j++)
	   intWrite(base, (gScan ? 1 : n*n+j), srcA[i*n+j]);


	 /* circuit is combinatorial, wait one clock */

	 intNoop(1);

	 	 
	 /* read back the result */

	 for (j = 0; j < n; j++) {
	   	   
#ifndef HARDWARE_ONLY
	   data=dest[i*n+j];
#endif

	   /* read twice to avoid some timing bug in library.v */

	   intRead(base, j, dest[i*n+j]);
	   intRead(base, j, dest[i*n+j]);
	   
#ifdef HARDWARE
#ifndef HARDWARE_ONLY
	   printf("%x, %x\n",dest[i*n+j],data);
	   if(data != dest[i*n+j]) fail=1;
#endif
#endif
	 }
    }

#ifdef HARDWARE
#ifndef HARDWARE_ONLY
  compare_status(fail);
#endif
#endif
 
  intClose();
}


void DriverNotSoftware(int sizen, int width)
{
  RunMatrixMultiplyTest(sizen);
}
#else /* software */

void DriverSoftware(int sizen, int width)
{
  int rpts=0;
  float soft_time;
  tval_t begin_time, end_time;

  get_time(begin_time);

  do {
    rpts++;
    
    RunMatrixMultiplyTest(sizen);

  } while (get_time(end_time) - begin_time < TIMELIMIT);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts);
  report_results(sizen*sizen,width,sizen,soft_time);
}
#endif


/*
  Main routine for driver. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
*/

main(int argc, char** argv)
{
  int sizen,width;

  if (argc != 4) {
    printf("Driver for Integer MatrixMultiply benchmark.\n"
	   "\n"
	   "usage: driver-%s <sizen> <width> <\"scan\"> |\n"
	   "\n"
	   "sizen determines the size of a side of a matrix (power of 2)\n"
	   "width is data width of the matrix elements (in bits)\n"
	   "\n",gDriverMode);
    exit(-1);
  }

  /* parameters */

  sizen=atoi(argv[1]);
  width=atoi(argv[2]);

  gScan = (strcmp(argv[3], "scan") == 0);
    

  /* check parameters */

  if (width < 1 || width > 32 ) 
    { printf("Width must be between 1 and 32.\n"); exit(-1);}

  gBitWidth = width;


  /* drive the defined software/simulation/hardware */

  driver(sizen,width);

  exit(0);
}
