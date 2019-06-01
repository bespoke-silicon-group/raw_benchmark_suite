/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/mergesort/src/driver.c,v 1.5 1997/08/15 18:36:21 jbabb Exp $
 *
 * Driver for Merge Sort Benchmark
 *
 * Authors: Jang Kim                (jdkim@lcs.mit.edu)
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

void merge(int a[], int b[], int c[], int m, int n)
{
  int i=0, j=0, k=0;

  /* Merge the two arrays. */
  while (i < m && j < n)
    if (a[i] > b[j])
      c[k++] = a[i++];
    else
      c[k++] = b[j++];
  
  /* If array b runs out before a, then fill c with the rest of a. */
  while (i < m)
    c[k++] = a[i++];
  
  /* If array a runs out before b, then fill c with the rest of b. */
  while (j < n)
    c[k++] = b[j++];
}

void mergesort(int key[], int n)
{
  int j, k, m, *w;
  void merge(int *, int *, int *, int, int);

  /* Check to make sure that the input array is of a proper size. */
  for (m=1; m<n; m*=2)
    ;
  if (m!=n) {
    printf("ERROR: Size of the array is not a power of 2.\n");
    exit(1);
  }

  /* Allocate space for result. */
  w = (int *)calloc(n, sizeof(int));

  /* Start with single blocks in the first iteration.
   * For each iteration thereafter, increase merge size by a factor of 2.
   * So, in first interation, single elements are merged into sorted blocks
   * of 2 elements. Then, those 2 elements block are sorted into 4 element
   * blocks and so forth.
   */
  for (k=1; k<n; k*=2) {
    /* Merge subarrays partitioned according to size of k. */
    for (j=0; j<n-k; j+=2*k)
      merge(key+j, key+j+k, w+j, k, k);
    /* Copy intermediate result back into original array for next iteration. */
    for (j=0; j<n; ++j)
      key[j] = w[j];
  }
   /* Free up allocated space for intermediate array. */
  free(w);
}

#endif

driver(int size, int width, int scan)
{
  int data, addr, rpts=0, scanid=0;
  int m, i, j;
  int pre_load = -1;
  int sortlist[size-1];
  int sortlist_hw[size-1];
  u_long* base;
  float soft_time;
  tval_t begin_time, end_time;

  /* Open the hardware interface. */
  #ifdef HARDWARE
  interfaceOpen(&base);
  #endif

#ifdef SOFTWARE
  get_time(begin_time);

  do {
    rpts++;
#endif

  /* Check data size. */
  for (m=1; m<size; m*=2)
    pre_load += 1;
  if (m!=size) {
    printf("ERROR: Size of array is not a power of 2.\n");
    exit(2);
  }
  
  /* Initialize data array, */

  for (i=0; i<size; i++) {

#ifndef HARDWARE_ONLY
    sortlist[i] = i;
#endif

#ifdef SIMULATION
    addr=scan ? scanid : i;
    vectorWrite(addr, i);
#endif

#ifdef HARDWARE
    addr=scan ? scanid : i;
    interfaceWrite(base+addr, i);
#endif
  }

  
  /* Execute the sort in software. */
  
#ifndef HARDWARE_ONLY
  mergesort(sortlist, size);
#endif

#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif


  /* Reading from the top node (addr doesn't matter) */

  addr = 0;

#ifdef SIMULATION
  data = 0xffffffff;
  for (j=0; j<pre_load; j++)
    vectorRead(addr, data);

  for (j=0; j<size; j++) {
    data = sortlist[j];
    vectorRead(addr, data);
  }
#endif

#ifdef HARDWARE

  /* one exta cycle for hardware version? */
  interfaceRead(base+addr, data);

  for (j=0; j<pre_load; j++)
    interfaceRead(base+addr, data);
  
  for (j=0; j<size; j++) {
    interfaceRead(base+addr, data);
    sortlist_hw[j] = data;
  }
#endif

#ifdef SOFTWARE
  print_array(sortlist, size);

  soft_time=diff_time(end_time, begin_time) / ((float)rpts);
  report_results(2*size-1,width,size+int_log(size)-1,soft_time);
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

main(int argc, char** argv)
{
  int size, width, scan;

  #ifdef SOFTWARE
  char* mode = "software";
  #endif

  #ifdef SIMULATION
  char* mode = "simulation";
  #endif

  #ifdef HARDWARE
  char* mode = "hardware";
  #endif

  if (argc != 4) {
    printf("Driver program for the Merge Sort Benchmark.\n");
    printf("\n");
    printf("usage: %s <size> <width> <scan> \n", mode);
    printf("\n");
    printf("size is the number of elements to sort\n");
    printf("width is data width of elements (4 to 32)\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    return (-1);
  };


  size = atoi(argv[1]);
  width = atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */

  driver(size, width, scan);
  
  exit(0);
}
