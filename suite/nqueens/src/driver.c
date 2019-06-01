/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/nqueens/src/driver.c,v 1.4 1997/08/09 05:58:04 jbabb Exp $
 *
 * Driver for N Queens benchmark
 *
 * Authors: Matthew Frank           (mfrank@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <sys/types.h>
#include <generate_verilog.h>
#include <util.h>
#include <tval.h>

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

#define assert(ex) {if(!(ex)){fprintf(stderr, "Died\n");exit(1);}}

#define FALSE (0)
#define TRUE  (1)


/* used for timing measurement */

int gRowCount, gTimeOut;
tval_t begin_time, end_time;


/* boolean vector */

typedef int *boolvect;


/* set a bit in a boolean vector */

static inline void setbit(boolvect vect, int pos) {
  vect[pos] = TRUE;
}


/* clear a bit in a boolean vector */

static inline void clearbit(boolvect vect, int pos) {
  vect[pos] = FALSE;
}


/* test a bit in a boolean vector */

static inline int testbit(boolvect vect, int pos) {
  return vect[pos];
}


/* which positive diagonal is square {row, col} on? */

static inline int pd_val(int n, int row, int col) {
  return (row + col);
}


/* which negative diagonal is square {row, col} on?  Scaled so that
 * min val is 0
 */

static inline int nd_val(int n, int row, int col) {
  return ((row - col) + (n - 1));
}


/* try all the n possible choices for where to put a queen on row "row"
 * given the availability of columns and diagonals in pos_diag, cols and
 * neg_diag.  Returns TRUE if an acceptable answer is found, FALSE otherwise.
 * The acceptable answer is returned in the "result" vector.
 */

int Try(int n,			/* number of rows or columns or queens */
	int row,		/* which row am I examining */
	boolvect pos_diag,	/* bit vector: positive diagonals already
				 * in use */
	boolvect cols,		/* bit vector: columns already in use */
	boolvect neg_diag,	/* bit vector: negative diagonals already
				 * in use */
	int result[])		/* vector of columns chosen */
{
  int col = 0;
  int answer = FALSE;


  /* count number of Rows tried, check if exceeding time limit */

  gRowCount++;
  if (gRowCount % 1048576) { /* large power of 2 */
    if (get_time(end_time) - begin_time > TIMELIMIT) return (gTimeOut=TRUE);
  }


  /* try each of the possible columns */

  for (col = 0; col < n; col++) {

    /* are the columns and diagonals free? */

    if (testbit(cols, col) &&
	testbit(pos_diag, pd_val(n, row, col)) &&
	testbit(neg_diag, nd_val(n, row, col))) {


      /* this is a possible place to go */


      /* set this column in the result vector */

      result[row]              = col;


      /* tell rows down the line not to use these columns or diagonals */

      clearbit(cols, col);
      clearbit(pos_diag, pd_val(n, row, col));
      clearbit(neg_diag, nd_val(n, row, col));

      if (row < (n-1)) {


	/* try the next row */

	answer = Try(n, row+1, pos_diag, cols, neg_diag, result);
	if ( ! answer ) {


	  /* row+1 couldn't find a workable answer */
	  /* make my column and diagonals free for future use */

	  setbit(cols, col);
	  setbit(pos_diag, pd_val(n, row, col));
	  setbit(neg_diag, nd_val(n, row, col));
	}
	else break;		/* found the answer! */
      }
      else {

	/* I'm the last row, I found the answer! */

	answer = TRUE;
	break;
      }
    }
  }

  return answer;
}


/* Find a possible board position for n queens, returns "result"
 * a vector of column positions, indexed by row.
 */

int *Doit(int n, int *result) {
  int i, q;
  int num_diags = n + n - 1;	/* number of diagonals on n by n board */
  int pos_diag[num_diags];	/* positive diagonals in use */
  int cols[n];			/* columns in use */
  int neg_diag[num_diags];	/* negative diagonals in use */


  /* set all the columns unused */

  for (i = 0; i < n; i++) {
    setbit(cols, i);
    result[i] = 0;
  }


  /* set the diagonals as unused */

  for (i = 0; i < num_diags; i++) {
    setbit(pos_diag, i);
    setbit(neg_diag, i);
  }


  /* get to work on recursive solution */

  q = Try(n, 0, pos_diag, cols, neg_diag, result);
  if(gTimeOut==1) q=FALSE;
  /*  assert(q); */			/* die if nothing found */

  return result;
}


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

driver(int rows, int iter, int scan) {
  int i, addr, data, sum, idwidth, controlid, scanid=0;
  int cycles, maxpoll, rpts=0;
  u_long* base;
  int timer_repeats;
  int result_hw[MAXLEN],result[MAXLEN];
  float soft_time;


  /* width of node identifier */
  
  idwidth = int_log(rows)+1;
  
  
  /* control node address */
  
  controlid = scan ? 1 : 1 << (idwidth-1);


  /* initialize number of rows tried */
  
  gRowCount=0;


#ifdef HARDWARE

  interfaceOpen(&base);

#endif

#ifdef SOFTWARE
  get_time(begin_time);

  do {
    rpts++;
#endif

#ifndef HARDWARE_ONLY

#ifdef HARDWARE
    if( rows < 16) Doit(rows, result);
#else
    Doit(rows, result);
#endif

#endif

#ifdef SOFTWARE
  } while (get_time(end_time) - begin_time < TIMELIMIT);
#endif

#ifdef SIMULATION


  /* start iterating */

  addr = controlid;
  data = 1;
  vectorWrite(addr, data);


  /* wait appropriate number of cycles */

  cycles = iter;
  vectorNop(cycles);


  /* now expect a 3 (SUCCESS) at the polling address */

  addr = controlid;
  data = 3;
  vectorRead(addr, data);

#endif

#ifdef HARDWARE


  /* starts iterating */

  addr = controlid;
  data = 1;
  interfaceWrite(base+addr, data);


  /* poll */

  maxpoll = 0;
  while((data != 3) && (maxpoll < MAXPOLL)) {
    maxpoll++;
    interfaceRead(base+addr, data);
  }

  if(maxpoll == MAXPOLL) {
    printf("Error: exceeded polling limit %d.\n", MAXPOLL);
  }

#endif    


  /* read back results */

#ifndef SIMULATION

  sum = 0;
      
#endif

  for (i = 0; i < rows; i++) {
      
#ifdef SIMULATION

    addr=scan ? scanid : i;
    data = result[i];
    vectorRead(addr, data);

#endif

#ifdef HARDWARE
    addr=scan ? scanid : i;
    interfaceRead(base+addr, data);
    result_hw[i]=data;      
#endif

  }

#ifdef SOFTWARE
  print_array(result, rows);

  soft_time=diff_time(end_time, begin_time) / ((float)(gRowCount));
  printf("Note: Software numbers are per row searched.\n");
  report_results(rows*rows,1,2,soft_time);
#endif

#ifdef HARDWARE

#ifndef HARDWARE_ONLY
  if(rows < 16)
    compare_array(result_hw, result, rows);
  else
    printf("Result: Unknown - software solution infeasible.\n");
#else
  print_array(result_hw, rows);
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
  int rows, iter, scan;

  if (argc != 4) {
    printf("Driver for NQueens benchmark\n");
    printf("\n");
    printf("usage: %s <rows> <iter> <scan>\n", argv[0]);
    printf("\n");
    printf("rows is how many rows to consider\n");
    printf("iter is how long to wait\n");
    printf("scan is either scan or bus for respective implementations\n");
    exit(-1);
  };


  /* parameters */

  rows = atoi(argv[1]);
  iter = atoi(argv[2]);
  scan = (strcmp(argv[3],"scan") == 0); /* 0 for bus, 1 for scan */


  /* drive the defined software/simulation/hardware */

  driver(rows, iter, scan);

  exit(0);
}
