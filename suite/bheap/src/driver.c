/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bheap/src/driver.c,v 1.7 1997/08/09 05:56:49 jbabb Exp $
 *
 * Driver for Binary Heap Benchmark
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

#ifndef HARDWARE_ONLY

void Heapify(u_int tree[], int index, int max)
{
  int l, r, largest;
  u_int temp;

  if (index > max)
    return;

  l = index*2+1;
  r = l+1;

  if (tree[l] > tree[index])
    largest = l;
  else
    largest = index;
  
  if (tree[r] > tree[largest])
    largest = r;

  if (largest != index)
    {
      temp = tree[largest];
      tree[largest] = tree[index];
      tree[index] = temp;
      Heapify(tree, largest, max);
    }
}

#endif


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

driver(int levels, int width, int scan)
{
  u_int addr, maxpoll, cycles, data;
  u_int heap[MAXSIZE], heap_hw[MAXSIZE];
  u_long* base;
  tval_t begin_time, end_time;
  int i, j, k, size, rpts=0, idwidth, controlid, scanid=0;
  float soft_time;

  idwidth = scan ? 1 : levels + 1;
  controlid = 1 << (idwidth-1);

#ifdef HARDWARE
  interfaceOpen(&base);
#endif

#ifdef SOFTWARE
  get_time(begin_time);

  do {
    rpts++;
#endif

  size = (1<<levels)-1;

  if(size > MAXSIZE) {
    printf("Heap too large (MAXSIZE=%d exceeded).\n", MAXSIZE);
    exit(0);
  }


  /* Initialize data array */
  
  Initrand();

  for (i=0; i<size; i++)
  {
    data = Rand();
    if (width < (sizeof(u_int)*8))
      data = data%(1 << width);

#ifndef HARDWARE_ONLY
    heap[i] = data;
#endif

#ifdef SIMULATION
    addr = scan ? scanid : i;
    vectorWrite(addr, data);
#endif

#ifdef HARDWARE
    addr = scan ? scanid : i;
    interfaceWrite(base+addr, data);
#endif
  }

#ifndef HARDWARE_ONLY


  /* implement heapsort here */
  
  for (i = ((1<<(levels-1))-2); i>=0; i--)
    Heapify(heap, i, (1<<levels)-1);

#endif

#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif

#ifdef SIMULATION


  /* write iteration count (also starts iterating) */

  addr = controlid;
  data = levels;
  vectorWrite(addr, data);


  /* wait appropriate number of cycles */

  cycles = levels*levels;
  vectorNop(cycles);


  /* now expect a zero at the polling address */

  addr = controlid;
  data = 0;
  vectorRead(addr, data);

#endif

#ifdef HARDWARE


  /* write iteration count (also starts iterating) */

  addr = controlid;
  data = levels;
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
      data = heap[i];
      vectorRead(addr,data);
#endif

#ifdef HARDWARE
      addr = scan ? scanid : i;
      interfaceRead(base+addr,data);
      heap_hw[i] = data;
#endif

    }

  /* check results */

#ifdef SOFTWARE
  print_array(heap, size);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts);
  report_results(size,width,levels,soft_time);
#endif

#ifdef HARDWARE

#ifndef HARDWARE_ONLY
  compare_array(heap_hw, heap, size);
#else
  print_array(heap_hw, size);
#endif

  interfaceClose();
#endif
}


/*
  Main routine for driver. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
*/

int main(int argc, char** argv)
{
  int levels, width, scan;

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
    printf("Driver for BinaryHeap benchmark.\n");
    printf("\n");
    printf("usage: driver-%s <levels> <width> <scan>\n", mode);
    printf("\n");
    printf("levels is the number of levels in the heap\n");
    printf("width is data width of data elements (4 to 32)\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    return (-1);
  };

  /* parameters */

  levels = atoi(argv[1]);
  width = atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */


  /* check parameters */

  if (width < 4 || width > 32 ) {
    printf("Width must be between 4 and 32.\n");
    exit(-1);
  }

  /* drive the defined software/simulation/hardware */

  driver(levels, width, scan);

  return (0);
}
