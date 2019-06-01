/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/nqueens/src/generate.c,v 1.4 1997/08/09 05:58:06 jbabb Exp $
 *
 * Generate for N Queens benchmark
 *
 * Authors: Matthew Frank           (mfrank@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <util.h>

/*
  This program is the topology generator for the top level verilog
  module (main) for this benchmark. It supports a parameterized
  generation of instantiations of library components via the following
  generate subroutine.
*/


/*
  Generate is written specifically for this benchmark.

  It calls the following include.c routines:
    generateHeader  - outputs what goes at the top of the main module
    generateTrailer - outputs what goes at the bottom of the main module
    wire            - outputs a wire declaration
    instantiate     - outputs instantiation of a particular library component
*/


void generate(int rows, int iter, int scan)
{
  int i,j,boundary,msb,lsb,idwidth,controlid,id1,scanid=0,id=0;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t node_template, control_template;
#endif

  char name[MAXLEN];
  char iname[MAXLEN];
  char parameters[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];


  /* generate the generic header */

  generateHeader();

#ifndef NO_TEMPLATES


  /* an NQueens_Node has 3 parameters named WIDTH, IDWIDTH, SCAN
   * (see module NQueens_Node in library.v) */

  node_template = declareTemplate("NQueens_Node",
				  3, "WIDTH", "IDWIDTH", "SCAN");
  
 

  /* an NQueens_Control has 2 parameters named IDWIDTH and SCAN. */

  control_template = declareTemplate("NQueens_Control",
				     2, "IDWIDTH", "SCAN");

#endif

  
  /* width of node identifier */

  idwidth =  int_log(rows)+1;

  /* Note: unlike the other benchmarks, can't set idwidth=1 for scan
     because it is used internal to the node for other purposes */


  /* control node address */

  controlid = scan ? 1 : 1 << (idwidth-1);


  /* here are all the wires I'm going to use (wires must come first) */

  for (i = 0; i <= rows; i++) { /* rows + 1 of these */
    sprintf(name, "wCall_%d", i);
    generateWire(name, 0, 0);
    sprintf(name, "wScan_%d", i);
    generateWire(name, idwidth-1, 0);
  }

  for (i = 0; i < rows; i++) {
    sprintf(name, "wReturn_%d", i);
    generateWire(name, 0, 0);
  }

  for (i = 1; i < rows; i++) {
    sprintf(name, "wColumn_%d", i);
    generateWire(name, rows-1, 0);
    sprintf(name, "wPDiag_%d", i);
    generateWire(name, rows-1, 0);
    sprintf(name, "wNDiag_%d", i);
    generateWire(name, rows-1, 0);
  }

  sprintf(name, "wScanEnable");
  generateWire(name, 0, 0);


  /* now for the instantiations */
  
  for(i = 0; i < rows; i++) {

#ifdef NO_TEMPLATES
	sprintf(name,"U_NQueens_Node_%d",i);
	sprintf(parameters,"%d, %d, %d",rows,idwidth,scan);
#endif

    sprintf(iname, "U_NQueens_Node_%d", i);

    
    /* the connections */

    sprintf(connections,
	    "\n.ScanIn(wScan_%d), .ScanOut(wScan_%d), .ScanEnable(wScanEnable),\n",
	    i+1, i);

    if (i == (rows - 1)) {


      /* the tail never gets returned to */

      id1=scan ? 0 : id;
      sprintf(s,
	      ".Id(%d'd%d), .CallIn(wCall_%d), .ReturnIn(1'd0),\n",
	      idwidth, id1,
	      i);
    }
    else {
      id1=scan ? 0 : id;
      sprintf(s,
	      ".Id(%d'd%d), .CallIn(wCall_%d), .ReturnIn(wReturn_%d),\n",
	      idwidth, id1,
	      i,
	      i+1);
    }
    strcat(connections,s);

    if (i == 0) {


      /* the head can use any column or diagonal it likes */

      sprintf(s, ".ColIn(%d'd0), .PDiagIn(%d'd0), .NDiagIn(%d'd0),\n",
	      rows, rows, rows);
    }
    else {
      sprintf(s,
	      ".ColIn(wColumn_%d), .PDiagIn(wPDiag_%d), .NDiagIn(wNDiag_%d),\n",
	      i, i, i);
    }
    strcat(connections,s);

    sprintf(s, ".CallOut(wCall_%d), .ReturnOut(wReturn_%d)", i+1, i);
    strcat(connections,s);

    if (i != (rows - 1)) {


      /* noone cares about what columns and diagonals the tail uses */

      sprintf(s, ",\n.ColOut(wColumn_%d), .PDiagOut(wPDiag_%d), .NDiagOut(wNDiag_%d)\n",
	      i+1, i+1, i+1);
      strcat(connections,s);
    }

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
    generateTemplateInstance(node_template,
			     iname,
			     connections,
			     rows, idwidth, scan);
#endif
  }


  /* generate a control node */
      
#ifdef NO_TEMPLATES
	sprintf(name,"U_NQueens_Control");
	sprintf(parameters,"%d, %d",idwidth,scan);
#endif

  sprintf(iname,"U_NQueens_Control");
  
  sprintf(connections, "\n.Id(%d'd%d),", idwidth, controlid);

  sprintf(s, ".ScanId(%d'd%d),\n", idwidth, scanid);
  strcat(connections, s);

  sprintf(s,
	  ".ScanIn(wScan_0), .ScanOut(wScan_%d), .ScanEnable(wScanEnable),\n",
	  rows);
  strcat(connections, s);
  
  sprintf(s, ".CallIn(wCall_%d), ", rows);
  strcat(connections, s);
  
  sprintf(s, ".ReturnIn(wReturn_0), ");
  strcat(connections, s);

  sprintf(s, ".CallOut(wCall_0)");
  strcat(connections, s);


#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
  generateTemplateInstance(control_template,
			   iname,
			   connections,
			   idwidth, scan);
#endif


  /* generate the generic trailer (you must have this) */

  generateTrailer();
}


/* 
  Main routine for generate. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
*/

main(int argc, char** argv)
{
  int rows;
  int iter;
  int scan;

  if (argc != 4) {
    printf("Computation structure generator for NQueens combinatorial benchmark.\n");
    printf("\n");
    printf("usage: %s <rows> <iter> <scan>\n", argv[0]);
    printf("\n");
    printf("rows is the number of rows to consider\n");
    printf("iter is the number of cycles to wait\n");
    printf("scan is either scan or bus for respective implementations\n");
    exit(-1);
  }

  rows = atoi(argv[1]);
  iter = atoi(argv[2]);
  scan = (strcmp(argv[3],"scan") == 0); /* 0 for bus, 1 for scan */

  /* generate the computation structure */

  generate(rows, iter, scan);

  exit(0);
}
