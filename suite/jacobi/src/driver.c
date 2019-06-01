/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/jacobi/src/driver.c,v 1.4 1997/08/09 05:57:38 jbabb Exp $
 *
 * Driver for Jacobi benchmark
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
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

/*
  This program is the driver program for this benchmark. It is compiled
  in one of three modes:

  -DSOFTWARE    a software-only version of the benchmark.
  -DSIMULATION  generates simulation vectors to a verilog file.
  -DHARDWARE     runs reconfigurable hardware via a memory-mapped interface.
*/

/* An additional flag -DHARDWARE_ONLY (currently unused) turns off execution
   and comparison of the software version whenever the hardware is driven */

/*
  Drive is written specifically for this benchmark.

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

driver(int sizex, int sizey, int width, int iter, int scan)
{
  int it,i,j,addr,data,sum,cycles=1,maxpoll,rpts=0;
  int data1[MAXSIZE],data2[MAXSIZE],data_hw[MAXSIZE];
  int idwidth,controlid, scanid=0;
  u_long* base;
  float soft_time;
  tval_t begin_time, end_time;


  /* width of node identifier */
  
  idwidth = scan ? 1 : int_log(sizex*sizey)+1;
  
  
  /* control node address */
  
  controlid = 1 << (idwidth-1);

#ifdef HARDWARE

  interfaceOpen(&base);

#endif

#ifdef SOFTWARE

  get_time(begin_time);

  do {
    rpts++;

#endif


  if(sizex*sizey>MAXSIZE) {
    printf("Matrix to large (MAXSIZE exceeded).\n");
    exit(0);
  }

  /* Initialize data array */

  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {
      
      if((i==0) || (i==sizex-1) ||
	 (j==0) || (j==sizey-1)) {
	
	/* an abitrary boundary condition of the appropriate width */

	data= 1 << (width-3);
      }
      else {
	
	/* interior initial state */

	data=0;
      }
                  
#ifndef HARDWARE_ONLY

      data1[ref(i,j)]=data;
      data2[ref(i,j)]=data;

#endif

      addr=scan ? scanid: ref(i,j);

#ifdef SIMULATION

      vectorWrite(addr,data);

#endif

#ifdef HARDWARE

      interfaceWrite(base+addr,data);

#endif
      
      }
  }

#ifndef HARDWARE_ONLY

  for(it=0;it<iter;it++) {
    if( it % 2 == 0) {
      for(i=1;i<sizex-1;i++) {
	for(j=1;j<sizey-1;j++) {
	  data2[ref(i, j)] = 
	    (data1[ref(i-1,j)] + data1[ref(i+1,j)] + 
	     data1[ref(i,j-1)] + data1[ref(i,j+1)]) >> 2;
	}
      }
    }

    else {
      for(i=1;i<sizex-1;i++) {
	for(j=1;j<sizey-1;j++) {
	  data1[ref(i, j)] = 
	    (data2[ref(i-1,j)] + data2[ref(i+1,j)] + 
	     data2[ref(i,j-1)] + data2[ref(i,j+1)]) >> 2;
	}
      }
    }
  }

#endif

#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif

#ifdef SIMULATION

  /* write iteration count (also starts iterating) */

  addr=controlid;
  data=iter;
  vectorWrite(addr,data);


  /* wait appropriate number of iterations */

  vectorNop(iter*cycles);


  /* now expect a zero at the polling address */

  addr=controlid;
  data=0;
  vectorRead(addr,data);

#endif

#ifdef HARDWARE


  /* write iteration count (also starts iterating) */

  addr=controlid;
  data=iter;
  interfaceWrite(base+addr,data);


  /* poll */

  maxpoll=0;
  while(data!=0 && maxpoll < MAXPOLL) {
    maxpoll++;
    interfaceRead(base+addr,data);
  }

  if(maxpoll==MAXPOLL) {
    printf("Error: exceeding polling limit %d.\n",MAXPOLL);
  }

#endif

  /* read back results */

  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {
      
      addr=scan ? scanid: ref(i,j);

#ifdef SIMULATION

      data=data1[ref(i,j)];
      vectorRead(addr,data);

#endif

#ifdef HARDWARE
      
      interfaceRead(base+addr,data);
      data_hw[ref(i,j)]=data;
      
#endif

    }
  }
  
#ifdef SOFTWARE
  print_array(data1, sizex*sizey-1);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts*iter);
  report_results(sizex*sizey,width,cycles,soft_time);
#endif


#ifdef HARDWARE

#ifndef HARDWARE_ONLY
  compare_array(data_hw, data1, sizex*sizey-1);
#else
  print_array(data_hw, size);
#endif

  interfaceClose();
#endif
}


/*
  Main routine for driver. Usage and input parameters are
  specific to this benchmark.
*/

main(int argc, char** argv)
{
  int sizex,sizey,width,iter,scan;

#ifdef SOFTWARE

  char* mode="software";

#endif

#ifdef SIMULATION

  char* mode="simulation";

#endif

#ifdef HARDWARE

  char* mode="hardware";

#endif

  if (argc != 6) {
    printf("Driver for Jacobi SOR benchmark.\n");
    printf("\n");
    printf("usage: driver-%s <sizex> <sizey> <width> <iter>\n",mode);
    printf("\n");
    printf("sizex is X dimension (power of 2) of Jacobi grid\n");
    printf("sizey is Y dimension (power of 2) of Jacobi grid\n");
    printf("width is data width of Jacobi elements (4 to 32)\n");
    printf("iter is the number of iterations (must be even)\n");
    printf("scan is either scan or bus for respective implementations\n");
    printf("\n");
    exit(-1);
  };

  /* parameters */

  sizex=atoi(argv[1]);
  sizey=atoi(argv[2]);
  width=atoi(argv[3]);
  iter =atoi(argv[4]);
  scan =(strcmp(argv[5],"scan") == 0); /* 0 for bus, 1 for scan */


  /* check parameters */

  if (width < 4 || width > 32 ) {
    printf("Width must be between 4 and 32.\n");
    exit(-1);
  }

  if (iter % 2 ) {
    printf("Iter must be even.\n");
    exit(-1);
  }

  
  /* drive the defined software/simulation/hardware */

  driver(sizex,sizey,width,iter,scan);

  exit(0);
}
