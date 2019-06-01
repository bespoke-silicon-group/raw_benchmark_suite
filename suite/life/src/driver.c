/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/life/src/driver.c,v 1.4 1997/08/09 05:57:48 jbabb Exp $
 *
 * Driver for Life benchmark
 *
 * Authors: Rajeev Kumar Barua      (barua@lcs.mit.edu)
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

/* Caveats for Life: The software version does not take advantage of CPU
   bit twiddling to get improve software performance */

/*
  This program is the driver program for this benchmark. It is compiled
  in one of three modes:

  -DSOFTWARE    a software-only version of the benchmark.
  -DSIMULATION  generates simulation vectors to a verilog file.
  -DHARDWARE     runs reconfigurable hardware via a memory-mapped interface.
*/

/* An additional flag -DHARDWARE_ONLY (currently unused) turns off execution
   and comparison of the software version whenever the hardware is driven */


/* for software array, indices into unpacked data, and fake boundary */

#define soft_u_ref(i, j) ((j)+(i)*(sizey+2))


/* for software array, indices into packed data, k refers to bit
position beginning at msb at leftmost = 0, and fake boundary */

#define soft_p_ref(i, j, k) ((j+1)+((i<<5)+k+1)*(sizey+2))

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

driver(int sizex, int sizey, int iter, int scan)
{
  u_long* base;
  int it,i,j,addr,data,sum,cycles,maxpoll,rpts=0;
  int i_max, j_max, k, idwidth,controlid,scanid=0;
  int data1[MAXSIZE],data2[MAXSIZE],data_hw[MAXSIZE];
  float soft_time;
  tval_t begin_time, end_time;


  /* width of node identifier */
  
  idwidth = scan ? 1 : int_log(sizex*sizey)+1;
  

  /* control node address */
  
  controlid = 1 << (idwidth-1);


#ifdef HARDWARE

  interfaceOpen(&base);

#endif

  if((sizex*32+1)*(sizey+1)>MAXSIZE) {
    printf("Matrix to large (MAXSIZE exceeded).\n");
    exit(0);
  }
  

  /* width of node identifier */
  
  idwidth=int_log(sizex*sizey);
  

  /* Initialize data array */
  
  Initrand();
  
  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {

      data=Rand();
      addr=scan ? scanid: ref(i,j);
      
      
      /* Initialize software data after unpacking */

#ifndef HARDWARE_ONLY
      for (k=0;k<32;k++) {
	data1[soft_p_ref(i,j,k)]=(data & (1<<(31-k)))? 1:0;
	data2[soft_p_ref(i,j,k)]=(data & (1<<(31-k)))? 1:0;
      }
#endif

#ifdef SIMULATION
      
      vectorWrite(addr,data);
      
#endif

#ifdef HARDWARE
      
      interfaceWrite(base+addr,data);

#endif

    } 
  }


  i_max = sizex*32+1;  /* imax=last column (of fake boundary)*/
  j_max = sizey+1;     /* jmax=last row (of fake boundary)*/

#ifndef HARDWARE


  /* Fill boundaries with zeros for software version */

  for (j=0;j < (j_max + 1); j++) {
    data1[soft_u_ref(0,j)] = 0;
    data2[soft_u_ref(0,j)] = 0;
    data1[soft_u_ref(i_max,j)] = 0;
    data2[soft_u_ref(i_max,j)] = 0;
  }

  for (i=1;i < i_max; i++) {
    data1[soft_u_ref(i,0)] = 0;
    data2[soft_u_ref(i,0)] = 0;
    data1[soft_u_ref(i,j_max)] = 0;
    data2[soft_u_ref(i,j_max)] = 0;
  }

#endif

#ifdef SOFTWARE

  get_time(begin_time);

  do {
    rpts++;

#endif

#ifndef HARDWARE_ONLY


  /* Compute result in software */

  for(it=1;it<=iter;it++) {
    if( it % 2 ) {
      for(i=1;i<i_max;i++) {
	for(j=1;j<j_max;j++) {
	    sum = data1[soft_u_ref(i-1,j)] + data1[soft_u_ref(i+1,j)] +
	      data1[soft_u_ref(i,j-1)] + data1[soft_u_ref(i,j+1)] +
	      data1[soft_u_ref(i-1,j-1)] + data1[soft_u_ref(i-1,j+1)] +
	      data1[soft_u_ref(i+1,j-1)] + data1[soft_u_ref(i+1,j+1)];
	    if (data1[soft_u_ref(i,j)]) 
	      data2[soft_u_ref(i,j)] = ((sum == 2) || (sum == 3)) ? 1:0;
	    else
	      data2[soft_u_ref(i,j)] = (sum == 3) ? 1:0;
	}
      }
    }

    else {
      for(i=1;i<i_max;i++) {
	for(j=1;j<j_max;j++) {
	    sum = data2[soft_u_ref(i-1,j)] + data2[soft_u_ref(i+1,j)] +
	      data2[soft_u_ref(i,j-1)] + data2[soft_u_ref(i,j+1)] +
	      data2[soft_u_ref(i-1,j-1)] + data2[soft_u_ref(i-1,j+1)] +
	      data2[soft_u_ref(i+1,j-1)] + data2[soft_u_ref(i+1,j+1)];
	    if (data2[soft_u_ref(i,j)]) 
	      data1[soft_u_ref(i,j)] = ((sum == 2) || (sum == 3)) ? 1:0;
	    else
	      data1[soft_u_ref(i,j)] = (sum == 3) ? 1:0;
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


  /* wait appropriate number of cycles */

  cycles=iter;
  vectorNop(cycles);


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

      data = 0;
      for (k=0;k<32;k++) {
	data |= data1[soft_p_ref(i,j,k)] << (31-k);
      }
      vectorRead(addr,data);

#endif

#ifdef HARDWARE
      
      interfaceRead(base+addr,data);
      

      /* Unpack data */
      
      for (k=0;k<32;k++) {
	data_hw[soft_p_ref(i,j,k)]=(data & (1<<(31-k)))? 1:0;
      }
      
#endif

    }
  }
  
#ifdef SOFTWARE
  print_array(data1, sizex*sizey-1);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts*iter);
  report_results(sizex*sizey,1,1,soft_time);
#endif

#ifdef HARDWARE

#ifndef HARDWARE_ONLY
  compare_array(data_hw, data1, sizex*sizey-1);
#else
  print_array(data_hw, sizex*sizey-1);
#endif

  interfaceClose();
#endif
}


/*
  Main routine for driver. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
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

  if (argc != 5) {
    printf("Driver for Life benchmark.\n");
    printf("\n");
    printf("usage: driver-%s <sizex> <sizey> <iter>\n",mode);
    printf("\n");
    printf("sizex is X dimension of Life grid\n");
    printf("sizey is Y dimension of Life grid\n");
    printf("iter is the number of iterations (must be even)\n");
    printf("scan is either scan or bus for respective implementations\n");
    printf("\n");
    exit(-1);
  };


  /* parameters */

  sizex=atoi(argv[1]);
  sizey=atoi(argv[2]);
  iter =atoi(argv[3]);
  scan =(strcmp(argv[4],"scan") == 0); /* 0 for bus, 1 for scan */


  /* check parameters */

  if (iter % 2 ) {
    printf("Iter must be even.\n");
    exit(-1);
  }

  if (sizex % GlobalDataWidth) {
    printf("sizex has to be a multiple of %d.\n Terminated.\n",
	   GlobalDataWidth);
    exit(-1);
  }

  /* Convert sizex from bits to per node */

  sizex = sizex/GlobalDataWidth;


  /* drive the defined software/simulation/hardware */

  driver(sizex,sizey,iter,scan);

  exit(0);
}
