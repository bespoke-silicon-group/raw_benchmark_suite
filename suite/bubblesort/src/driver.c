/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bubblesort/src/driver.c,v 1.6 1997/08/09 05:56:56 jbabb Exp $
 *
 * Driver for Bubble Sort Benchmark
 *
 * Authors: Elliot Waingold         (elliotw@lcs.mit.edu)
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

driver(int size, int width, int scan)
{
  u_int i, j, addr, maxpoll, cycles, top;
  u_int sortlist[MAXSIZE], sortlist_hw[MAXSIZE];
  u_int temp, data;
  u_long* base;
  int rpts=0, idwidth, controlid, scanid=0;
  float soft_time;
  tval_t begin_time, end_time;
  
  idwidth = scan ? 1 : int_log(size+1);
  controlid = 1 << (idwidth-1);
  cycles = size/2;

#ifdef HARDWARE
  interfaceOpen(&base);
#endif

#ifdef SOFTWARE
  get_time(begin_time);

  do {
    rpts++;
#endif

  if(size > MAXSIZE) {
    printf("Array to large (MAXSIZE exceeded).\n");
    exit(0);
  }


  /* Initialize data array */
  
  Initrand();

  for (i=0; i<size; i++)
  {
    temp = Rand();
    if (width < (sizeof(u_int)*8))
      temp = temp%(1 << width);

#ifndef HARDWARE_ONLY
    sortlist[i] = temp;
#endif

#ifdef SIMULATION
    addr = scan ? scanid : i;
    vectorWrite(addr, temp);
#endif

#ifdef HARDWARE
    addr = scan ? scanid : i;
    interfaceWrite(base+addr, temp);
#endif
  }

#ifndef HARDWARE_ONLY
  top = size-1;
  
  while (top > 0)
    {
      i = 0;
      while (i < top)
	{
	  if (sortlist[i] > sortlist[i+1])
	    {
	      j = sortlist[i];
	      sortlist[i] = sortlist[i+1];
	      sortlist[i+1] = j;
	    }
	  i = i + 1;
	}
      top = top - 1;
    }
#endif
  
#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif

#ifdef SIMULATION


  /* write iteration count (also starts iterating) */

  addr = controlid;
  data = cycles;
  vectorWrite(addr, data);


  /* wait appropriate number of cycles */

  vectorNop(cycles);

  /* now expect a zero at the polling address */

  addr = controlid;
  data = 0;
  vectorRead(addr, data);

#endif

#ifdef HARDWARE


  /* write iteration count (also starts iterating) */

  addr = controlid;
  data = size/2;
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

  for (i=0; i<size; i++)
    {

#ifdef SIMULATION
      addr = scan ? scanid : i;
      data = sortlist[i];
      vectorRead(addr,data);
#endif

#ifdef HARDWARE
      addr = scan ? scanid : i;
      interfaceRead(base+addr,data);
      sortlist_hw[i] = data;
#endif

    }

#ifdef SOFTWARE
  print_array(sortlist, size);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts);
  report_results(size/2,width,cycles,soft_time);
#endif

#ifdef HARDWARE

#ifndef HARDWARE_ONLY
  compare_array(sortlist_hw, sortlist, size);
#else
  print_array(sortlist_hw, size);
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
  int size, width, scan;

#ifdef SOFTWARE

  char* mode="software";

#endif

#ifdef SIMULATION

  char* mode="simulation";

#endif

#ifdef HARDWARE

  char* mode="hardware";

#endif

  if (argc != 4) {
    printf("Driver for BubbleSort benchmark.\n");
    printf("\n");
    printf("usage: driver-%s <size> <width>\n", mode);
    printf("\n");
    printf("size is the number of elements to sort (must be even)\n");
    printf("width is data width of array elements (4 to 32)\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    exit(-1);
  };

  /* parameters */

  size = atoi(argv[1]);
  width = atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */

  /* check parameters */

  if (width < 4 || width > 32 ) {
    printf("Width must be between 4 and 32.\n");
    exit(-1);
  }

  if (size % 2 ) {
    printf("Size must be even.\n");
    exit(-1);
  }

  /* drive the defined software/simulation/hardware */

  driver(size, width, scan);

  exit(0);
}
