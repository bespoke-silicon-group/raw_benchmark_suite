/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/des/src/generate.c,v 1.5 1997/08/09 05:57:06 jbabb Exp $
 *
 * Generator for DES benchmark
 *
 * Authors: Victor W. K. Lee        (wklee@lcs.mit.edu)
 *           Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <math.h>
#include <generate_verilog.h>
#include <util.h>

/*
  This program is the topology generator for the top level verilog
  module (main) for this benchmark. It supports a parameterized
  generation of instantiations of library components via the following
  generate subroutine.
*/

#define CONTROLID 0
#define SCANID 1

/* The routine to print out a pass */
void pass(char *t)
{
  printf(t);
}

/*
  Generate is written specifically for this benchmark.

  It calls the following include.c routines:
    generateHeader  - outputs what goes at the top of the main module
    generateTrailer - outputs what goes at the bottom of the main module
    wire            - outputs a wire declaration
    instantiate     - outputs instantiation of a particular library component
*/

#define DES_WIDTH 64

void  generate(int size, int scan)
{
  char name[MAXLEN];
  char iname[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];
  int  id;
  int  idwidth;
  int  width = 64;
  int  memspace = 2;
  int  idfirst=0;
  int  idlast;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t node_template, control_template;
#endif


  /* width of node identifier */
  
  idwidth = scan ? 1 : 8;


  /* generate the generic header */

  generateHeader();

#ifndef NO_TEMPLATES


  /* generate a node template */

  node_template = declareTemplate("DES_Node", 
				  4, "WIDTH", "MEMSPACE", "IDWIDTH", "SCAN");


  /* generate a control template */

  control_template = declareTemplate("DES_Control",
				     4,"WIDTH","MEMSPACE","IDWIDTH", "SCAN");

#endif


  /* generate the wire */

  sprintf(name, "key");
  generateWire(name,(DES_WIDTH-1),0);

  sprintf(name, "start");
  generateWire(name,0,0);

  for (id=0;id<size;id++) {
    sprintf(name, "rdy%d", id);
    generateWire(name,0,0);

    sprintf(name, "ScanLink%d", id);
    generateWire(name,32-1,0);
  }

  sprintf(name, "ScanLink%d", size);
  generateWire(name,32-1,0);

  sprintf(name, "ScanEnable");
  generateWire(name,0,0);


  /* generate the instances */

#ifdef NO_TEMPLATES
  sprintf(name,"DES_Control");
  sprintf(parameters,"%d, %d, %d, %d",width,memspace,idwidth,scan);
#endif

  sprintf(iname,"U_DES_Control_%d", CONTROLID);
  sprintf(connections,".Id(%d'd%d), .key(key), .start(start), ",
	  idwidth, CONTROLID);

  sprintf(s,".rdy(rdy1), ");
  strcat(connections,s);  
  sprintf(s,".ScanOut(ScanLink%d), ",size);
  strcat(connections,s);
  sprintf(s,".ScanIn(ScanLink%d), ",0);
  strcat(connections,s);
  sprintf(s,".ScanEnable(ScanEnable), ");
  strcat(connections,s);  
  sprintf(s,".ScanId(%d'd%d)",idwidth,SCANID);
  strcat(connections,s);


#ifdef NO_TEMPLATES
  generateInstance(name,parameters,iname,connections);
#else
  generateTemplateInstance(control_template,
			   iname,
			   connections,
			   width, memspace, idwidth, scan);
#endif

  for (id = 1; id <= size; id++) {

#ifdef NO_TEMPLATES
    sprintf(name, "DES_Node");
    sprintf(parameters,"%d, %d, %d, %d",width,memspace,idwidth,scan);
#endif

    sprintf(iname, "U_DES_Node_%d", id);
    sprintf(connections,".Id(%d'd%d), .key(key), .start(start), ",
	    idwidth, id);

    sprintf(s,".rdy(rdy%d), ", id);
    strcat(connections,s);

    sprintf(s,".ScanIn(ScanLink%d), ", id);
    strcat(connections,s);

    sprintf(s,".ScanOut(ScanLink%d), ", id-1);
    strcat(connections,s);

    sprintf(s,".ScanEnable(ScanEnable)");
    strcat(connections,s);  
    
#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
    generateTemplateInstance(node_template,
			     iname,
			     connections,
			     width, memspace, idwidth, scan);
#endif
  }


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
  int size;
  int scan;

  if (argc != 3) {
    printf("Computation structure generator for DES benchmark.\n");
    printf("\n");
    printf("usage: generate <size> <scan>\n");
    printf("\n");
    printf("<size> is the number of DES node in parallel\n");
    printf("<scan> is either scan or bus for respective implementation\n");

    printf("\n");
    exit(-1);
  };

  size=atoi(argv[1]);
  scan=strcmp(argv[2], "scan") == 0; /* 0 for bus, 1 for scan */


  /* generate the computation structure */

  generate(size, scan);

  exit(0);
}
