/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/fft/src/driver.c,v 1.6 1997/08/09 05:57:16 jbabb Exp $
 *
 * Driver for Integer FFT benchmark
 *
 * Authors: Devabhaktuni Srikrishna (chinnama@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <tval.h>
#include <util.h>

#ifdef HARDWARE
#include <interface.h>
#endif

#include "fft.h"


/*
  This program is the driver program for this benchmark. It is compiled
  in one of three modes:

  -DSOFTWARE    a software-only version of the benchmark.
  -DSIMULATION  generates simulation vectors to a verilog file.
  -DHARDWARE     runs reconfigurable hardware via a memory-mapped interface.
*/

/* An additional flag -DHARDWARE_ONLY (currently unused) turns off execution
   and comparison of the software version whenever the hardware is driven */


void print_data(number *data, unsigned n, char *s) {

  int i;
	
  printf("\n");
  printf("%s", s);
  printf("\n");
	
  for(i=0; i<n; i++) 
    printf("data[%u].num == %u, data[%u].sign == %u\n",
	   i, data[i].num, i, data[i].sign);

  printf("\n");

}/*print_data*/ 


void compare_data(number *hardware, number *software, unsigned n) {

  int i,fail=0;
		
  for(i=0; i<n; i++)
    if((hardware[i].num != software[i].num) ||
       (hardware[i].sign != software[i].sign))
      fail=1;

  compare_status(fail);

}/*compare_data*/ 


/*
  Driver is written specifically for this benchmark.

  It calls the following generate_verilog.h routines:

    vectorRead  - generate a verilog read vector for the test shell
    vectorWrite - generate a verilog write vector for the test shell
    vectorNop   - generate a verilog nop vector for the test shell

  It calls the following interface.h routines:

    interfaceOpen  - open the memory mapped SBus to VLE interface
    interfaceClose - close the memory mapped SBus to VLE interface
    interfaceRead  - a macro to read from the interface
    interfaceWrite - a macro to write to the interface

*/

void driver(int n, int scan) {
	
  char     debug[MAXLEN];
  int      controlid=0,i,scanid=1;
  number   *data, *data_hw, temp1, temp2;
  tval_t   begin_time, end_time;
  u_long*  base;
  unsigned it, addr, data2, sum, cycles, maxpoll, rpts=0, logn, size;
  unsigned j, i2, q, p, k, m, index; 
  float soft_time;

  size = n/2;
  logn = int_log(n);
  if(DEBUG) printf("\nDEBUG: n == %u, logn == %u\n", n, logn);
  cycles = logn+2;
  
  data    = (number *) calloc(n, sizeof(number));
  data_hw = (number *) calloc(n, sizeof(number));

#ifdef HARDWARE

  interfaceOpen(&base);

#endif


    /* Initialize data array */

    for(i=0; i<n; i++) {

      if(i==0 || i== 1) data[i].sign = 0;
      else data[i].sign = 0;
	
      if(i==0 || i==1) data[i].num = 1;
      else data[i].num = 0;

    }/*for*/


    /*print_data(data, n, "before FFT");*/

    /*Reorder data array*/

    j=0;

    for(i=0; i<=n; i++) {

      if(j>i) {  /*SWAP*/
	
	COPY(&temp1,&(data[i]), size);
	COPY(&(data[i]),&(data[j]), size);
	COPY(&(data[j]),&temp1, size);

      }/*if*/

      m = n >> 1;

      while(m>=1 && j>=m) {
			
	j -= m;

	m >>= 1;

      }/*while*/

      j+=m;

    }/*for*/	

    if(DEBUG) print_data(data,n,"after reordering data,");


    /*load data values into simulation or hardware*/

    index = 0;

    for (i=size-1; i>=0; i--) {

#ifdef SIMULATION 
			
      addr=scan ? scanid : ((index + i) << 2) + 1;  /*left*/
      vectorWrite(addr,data[2*i].num);

      addr=scan ? scanid : ((index + i) << 2) + 2;  /*right*/
      vectorWrite(addr,data[2*i+1].num);


      /*pack sign bits onto data2*/

      data2 = 0;
      if(data[2*i].sign)   data2+=1;
      if(data[2*i+1].sign) data2+=2;

      addr=scan ? scanid : ((index + i) << 2) + 3;  /*sign*/
      vectorWrite(addr,data2);
#endif

#ifdef HARDWARE
			
      addr=scan ? scanid : ((index+i) << 2) + 1;    /*left*/
      interfaceWrite(base+addr,data[2*i].num);
			
      addr=scan ? scanid : ((index+i) << 2) + 2;    /*right*/
      interfaceWrite(base+addr,data[2*i+1].num);


      /*pack sign bits onto data2*/

      data2 = 0;
      if(data[2*i].sign)   data2+=1;
      if(data[2*i+1].sign) data2+=2;

      addr=scan ? scanid : ((index + i) << 2) + 3;  /*sign*/
      interfaceWrite(base+addr,data2);

#endif

    }

#ifdef SOFTWARE

  get_time(begin_time);

  do {
    rpts++;

#endif


#ifndef HARDWARE_ONLY
	
    for(i=2; i<=n; i <<= 1) {      
	  
      q = n/i;
      i2 = i >> 1;
	  
      for(j=0; j<q; j++) {
	    
	p = j*i;
	    
	for(k=p; k<p+i2; k++) {
	      
	  if(DEBUG) printf("\nCOMBINATIONAL(%u,%u,%u)\n",
			   k, k+i2, q*(k%i));

	  if(DEBUG) PRINT(data[k], "data[k]: before");
	  if(DEBUG) PRINT(data[k+i2], "data[k+i2]: before");
	      
	  COMBINATIONAL(&(data[k]), &(data[k+i2]),
			&temp1, &temp2, q*(k%i), size);

	  COPY(&(data[k]),&temp1, size);

	  COPY(&(data[k+i2]),&temp2, size);
	      
	  if(DEBUG) PRINT(data[k], "data[k]: after");
	  if(DEBUG) PRINT(data[k+i2], "data[k+i2]: after");
	      
	}/*for*/
	    
      }/*for*/
	  
      if(DEBUG) sprintf(debug, "after pass %u,", i);
      if(DEBUG) print_data(data,n,debug);
	  
    }/*for*/
#endif

#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif

#ifdef SIMULATION

  addr=controlid;
  data2=logn+2;
  vectorWrite(addr,data2);


  /* wait appropriate number of cycles */

  if(DEBUG) printf("\nDEBUG: logn+1 == %u\n", logn+1);

  vectorNop(cycles);


  /* now expect a zero at the polling address */

  addr=controlid;
  data2=0;
  vectorRead(addr,data2);

#endif

#ifdef HARDWARE


  /* write iteration count (also starts iterating) */

  addr=controlid;
  data2=cycles;
  interfaceWrite(base+addr,data2);


  /* poll */
	
  maxpoll=0;
  while(data2!=0 && maxpoll < MAXPOLL) {

    maxpoll++;
    interfaceRead(base+addr,data2);
  }

  if(maxpoll==MAXPOLL) {
    printf("Error: exceeding polling limit %d.\n",MAXPOLL);
  }

#endif


  /* read back results */

#ifdef FOO
  index=0;

  for (i=size-1; i >= 0; i--) {
    addr=scan ? scanid : ((index + i) << 2) + 1;  /*left*/

#ifdef SIMULATION
    vectorRead(addr,0);
    vectorRead(addr,0);
    vectorRead(addr,0);
#endif

#ifdef HARDWARE
    interfaceRead(base+addr,data2);
    interfaceRead(base+addr,data2);
    interfaceRead(base+addr,data2);
#endif

  }

#endif

  index = (logn+1)*size;

  for (i=size-1; i >= 0; i--) {

#ifdef SIMULATION

    addr=scan ? scanid : ((index + i) << 2) + 1;  /*left*/
    vectorRead(addr,data[2*i].num);

    addr=scan ? scanid : ((index + i) << 2) + 2;  /*right*/
    vectorRead(addr,data[2*i+1].num);


    /*pack sign bits onto data2*/

    data2 = 0;
    if(data[2*i].sign)   data2+=1;
    if(data[2*i+1].sign) data2+=2;

    addr=scan ? scanid : ((index + i) << 2) + 3;  /*sign*/
    vectorRead(addr,data2);

#endif

#ifdef HARDWARE
    
    addr=scan ? scanid : ((index + i) << 2) + 1;  /*left*/
    interfaceRead(base+addr,data2);

    data_hw[2*i].num = data2;


    addr=scan ? scanid : ((index + i) << 2) + 2;  /*right*/
    interfaceRead(base+addr,data2);

    data_hw[2*i+1].num = data2;


    addr=scan ? scanid : ((index + i) << 2) + 3;  /*sign*/
    interfaceRead(base+addr,data2);


    /*unpack sign bits from data2*/

    data_hw[2*i].sign   = (data2&1) ? 1 : 0;
    data_hw[2*i+1].sign = (data2&2) ? 1 : 0;

#endif

  }/*for*/

#ifdef SOFTWARE
  print_data(data,n,"Software answer:");

  soft_time=diff_time(end_time, begin_time) / ((float)rpts);
  report_results(size*(logn+2),size+1,(logn+2),soft_time);
#endif

#ifdef HARDWARE
	
  print_data(data_hw,n,"Hardware answer:");

#ifndef HARDWARE_ONLY
  print_data(data,n,"Software answer:");
  compare_data(data_hw,data,n);
#endif
  

  interfaceClose();

#endif

}/*driver*/

/*
  Main routine for driver. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
*/

void main(int argc, char** argv) {

  int n;
  int scan;

#ifdef SOFTWARE

  char* mode="software";

#endif

#ifdef SIMULATION

  char* mode="simulation";

#endif

#ifdef HARDWARE

  char* mode="hardware";

#endif

  if (argc != 3) {

    printf("Driver for FFT benchmark.\n");
    printf("\n");
    printf("usage: driver-%s <N> <scan>\n",mode);
    printf("\n");
    printf("n is the size of the FFT being computed\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    exit(-1);
  }

  /* parameters */

  n = atoi(argv[1]);
  scan=strcmp(argv[2], "scan") == 0; /* 0 for bus, 1 for scan */
	
  if(n < 4 || n > 64) {

    printf("n must be power 2 between 4 and 64.\n");
    exit(-1);
	
  }/*if*/

  driver(n, scan);

  exit(0);

}/*main*/
