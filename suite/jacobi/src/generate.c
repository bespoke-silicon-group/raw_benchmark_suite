/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/jacobi/src/generate.c,v 1.5 1997/08/09 05:57:39 jbabb Exp $
 *
 * Generate for Jacobi benchmark
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
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
  generation of instantiations of library components.
*/

/*
  Generate is written specifically for this benchmark.

  It calls the following include.c routines:
    generateHeader  - outputs what goes at the top of the main module
    generateTrailer - outputs what goes at the bottom of the main module
    wire            - outputs a wire declaration
    instantiate     - outputs instantiation of a particular library component
*/


void generate(int sizex, int sizey, int width, int iter, int scan)
{
  int i,j,k,boundary,msb,lsb,cwidth,id=0,idfirst=0,idlast,id1;
  int idwidth,controlid,scanid=0;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t node_template, control_template;
#endif

  char name[MAXLEN];
  char iname[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];


  /* generate the generic header */

  generateHeader();


#ifndef NO_TEMPLATES

  /* a Jacobi_Node has parameters named WIDTH, IDWIDTH, BOUNDARY, SCAN
   * (see module Jacobi_Node in library.v) */

  node_template = declareTemplate("Jacobi_Node",
				  4, "WIDTH", "IDWIDTH", "BOUNDARY", "SCAN");
   
  /* a Jacobi_Control parameters named WIDTH, CWIDTH, IDWIDTH, SCAN. */

  control_template = declareTemplate("Jacobi_Control",
				     4, "WIDTH", "CWIDTH", "IDWIDTH","SCAN");

#endif


  /* max width of iteration counter */

  cwidth=int_log(iter+1);
  

  /* width of node identifier */

  idwidth = scan ? 1 : int_log(sizex*sizey)+1;


  /* control node address */

  controlid = 1 << (idwidth-1);


  /* here are all the wires I'm going to use (wires must come first) */

  idlast=ref(sizex-1,sizey-1)+1;
  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {
      id=ref(i,j);
      

      /* output to neighboring nodes */

      sprintf(name,"nOut%d_%d",i,j);
      msb=width-1;
      lsb=0;
      generateWire(name,msb,lsb);


      /* Scan outputs */

      sprintf(name,"nScanOut%d",id);
      msb=width-1;
      lsb=0;
      generateWire(name,msb,lsb);
    }
  }
  
  
  /* The enable wire from the control node */

  sprintf(name,"nEnable");
  msb=0;
  lsb=0;
  generateWire(name,msb,lsb);
  

  /* Scan enable */

  sprintf(name,"nScanEnable");
  msb=0;
  lsb=0;
  generateWire(name,msb,lsb);


  /* Scan out for control node */

  sprintf(name,"nScanOut%d",idlast);
  msb=width-1;
  lsb=0;
  generateWire(name,msb,lsb);
  
  
  /* now for the instantiations */
  
  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {
      id=ref(i,j);
      if((i==0) || (i==sizex-1) ||
	 (j==0) || (j==sizey-1)) {


	/* instantiate boundary nodes */

	/* 
           name includes the module name of the verilog library component
           that is being instantiated (Jacobi_Node in this case).
	*/

#ifdef NO_TEMPLATES
	sprintf(name,"U_Jacobi_Node_%d",id);
#endif

	/*
	  parameters are comma-delimited name,value pairs. If used,
	  they specify the parameters to be passed to the the synthesizer.
	  The synthesizer will use the parameterized component from
	  the library as a template to synthesize a new circuit for
	  every unique set of parameters. To minimize synthesis time,
	  keep the number of unique sets low. Constants may be passed
	  in on port connections rather than using parameters to avoid
	  such synthesis code explosion. See the Id connection.
	*/ 
	
#ifdef NO_TEMPLATES
	sprintf(parameters,"%d, %d, %d, %d",width,idwidth,boundary,scan);
#endif
	

	boundary=1;

	/*
           iname is a unique instance name.
	*/

	sprintf(iname,"U_Jacobi_Node_%d",id);

	/*
	  connections are specified as comma-delimited sets of named
          connections in the standard verilog format: .formal(actual)
          The actuals should either be constants or net names. To
          specify a constant, use verilog syntax such as:
	  4'b1111      - 4 bit binary constant with value 1111 binary
	  8'd124       - 8 bit decimal constanw with value 124 decimal
	*/

	id1=scan ? 0 : id;
	sprintf(connections,".Id(%d'd%d), ",idwidth,id1);


	/*	
          For net names, this procedure generates unique names on the
          fly, such as nOut23, which would be the output Out of the
          Jacobi node at x=2,y=3. Chose net names appropriately to
          establish the inter-module connections as needed.
	*/
         
	sprintf(s,".Out(nOut%d_%d), ",i,j);
	strcat(connections,s);


	/*
	  Scan connects.
	 */

	sprintf(s,".ScanIn(nScanOut%d), ",id+1);
	strcat(connections,s);

	sprintf(s,".ScanOut(nScanOut%d), ",id);
	strcat(connections,s);

	sprintf(s,".ScanEnable(nScanEnable)");
	strcat(connections,s);

	/*
          finally, given that the name, parameter, and connections are
          defined, make a call to instantiate to output the instantiation
          to standard out. This routine is in include.c.
	*/

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
	generateTemplateInstance(node_template,
				 iname,
				 connections,
				 width,idwidth,boundary,scan);
#endif
	
      } else {

#ifdef NO_TEMPLATES
	sprintf(name,"U_Jacobi_Node_%d",id);
	sprintf(parameters,"%d, %d, %d, %d",width,idwidth,boundary,scan);
#endif

	boundary=0;

	sprintf(iname,"U_Jacobi_Node_%d",id);

	/*Local connections. */

	id1=scan ? 0 : id;
	sprintf(connections,".Id(%d'd%d), ",idwidth,id1);

	sprintf(s,".Enable(nEnable), ");
	strcat(connections,s);

	sprintf(s,".Out(nOut%d_%d), ",i,j);
	strcat(connections,s);

	sprintf(s,".NorthIn(nOut%d_%d), ",i,j-1);
	strcat(connections,s);

	sprintf(s,".SouthIn(nOut%d_%d), ",i,j+1);
	strcat(connections,s);

	sprintf(s,".EastIn(nOut%d_%d), ",i+1,j);
	strcat(connections,s);

	sprintf(s,".WestIn(nOut%d_%d), ",i-1,j);
	strcat(connections,s);

	/* Scan connections. */
	
	sprintf(s,".ScanIn(nScanOut%d), ",id+1);
	strcat(connections,s);

	sprintf(s,".ScanOut(nScanOut%d), ",id);
	strcat(connections,s);

	sprintf(s,".ScanEnable(nScanEnable)");
	strcat(connections,s);

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
	generateTemplateInstance(node_template,
				 iname,
				 connections,
				 width, idwidth, boundary, scan);
#endif
      }
    }
  }


  /* generate a control node */

  id=controlid;
      
#ifdef NO_TEMPLATES
  sprintf(name,"U_Jacobi_Control");
  sprintf(parameters,"%d, %d, %d, %d",width,idwidth,boundary,scan);
#endif

  sprintf(iname,"U_Jacobi_Control",id);
  
  sprintf(connections,".Id(%d'd%d), ",idwidth,id);
  
  sprintf(s,".Enable(nEnable), ");
  strcat(connections,s);

  sprintf(s,".ScanId(%d'd%d), ",idwidth,scanid);
  strcat(connections,s);

  sprintf(s,".ScanEnable(nScanEnable), ");
  strcat(connections,s);

  sprintf(s,".ScanIn(nScanOut%d), ",idfirst);
  strcat(connections,s);

  sprintf(s,".ScanOut(nScanOut%d)",idlast);
  strcat(connections,s);
  
#ifdef NO_TEMPLATES
  generateInstance(name,parameters,iname,connections);
#else
  generateTemplateInstance(control_template,
			   iname,
			   connections,
			   width, cwidth, idwidth, scan);
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
  int sizex,sizey,width,iter,scan;

  if (argc != 6) {
    printf("Computation structure generator for Jacobi SOR benchmark.\n");
    printf("\n");
    printf("usage: generate <sizex> <sizey> <width> <iter> <scan> \n");
    printf("\n");
    printf("sizex is X dimension of Jacobi grid\n");
    printf("sizey is Y dimension of Jacobi grid\n");
    printf("width is data width of Jacobi elements (4 to 32)\n");
    printf("iter is the maximum number of iterations\n");
    printf("scan = scan or bus, for respective implementations\n");
    printf("\n");
    exit(-1);
  };

  sizex=atoi(argv[1]);
  sizey=atoi(argv[2]);
  width=atoi(argv[3]);
  iter =atoi(argv[4]);
  scan =(strcmp(argv[5],"scan") == 0); /* 0 for bus, 1 for scan */

  /* generate the computation structure */

  generate(sizex,sizey,width,iter,scan);

  exit(0);
}
