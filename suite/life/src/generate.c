/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/life/src/generate.c,v 1.5 1997/08/09 05:57:49 jbabb Exp $
 *
 * Generate for Life benchmark
 *
 * Authors: Rajeev Kumar Barua      (barua@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
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

/*
  Generate is written specifically for this benchmark.

  It calls the following include.c routines:
    generateHeader  - outputs what goes at the top of the main module
    generateTrailer - outputs what goes at the bottom of the main module
    wire            - outputs a wire declaration
    instantiate     - outputs instantiation of a particular library component
*/

void generate(int sizex, int sizey, int iter, int scan) 
{
  int i,j,msb,lsb,idwidth,cwidth,id1,id=0,idfirst=0,idlast,
    controlid,scanid=0,width=32;

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
  node_template = declareTemplate("Life_Block",
				  2, "IDWIDTH","SCAN");
  
  control_template = declareTemplate("Life_Control",
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
      sprintf(name,"nOut%d_%d",i,j);
      msb=GlobalDataWidth-1;
      lsb=0;
      generateWire(name,msb,lsb);

      /* Scan outputs */

      sprintf(name,"nScanOut%d",id);
      msb=GlobalDataWidth-1;
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
  msb=GlobalDataWidth-1;
  lsb=0;
  generateWire(name,msb,lsb);
  
  /* now for the instantiations */
  
  for(i=0;i<sizex;i++) {
    for(j=0;j<sizey;j++) {
      id=ref(i,j);
      
#ifdef NO_TEMPLATES
      sprintf(name,"U_Life_Block_%d",id);
      sprintf(parameters,"%d, %d",idwidth,scan);
#endif

      sprintf(iname,"U_Life_Block_%d",id);
      
      id1=scan ? 0 : id;
      sprintf(connections,".Id(%d'd%d), ",idwidth,id1);
      
      sprintf(s,".Enable(nEnable), ");
      strcat(connections,s);
      
      sprintf(s,".BLOCK_VALUE(nOut%d_%d), ",i,j);
      strcat(connections,s);
	
      if (j != 0)
	sprintf(s,".NORTH_EDGE(nOut%d_%d), ",i,j-1);
      else
	sprintf(s,".NORTH_EDGE(%d'd0), ",GlobalDataWidth);
      strcat(connections,s);
      
      if (j != sizey-1)
	sprintf(s,".SOUTH_EDGE(nOut%d_%d), ",i,j+1);
      else
	sprintf(s,".SOUTH_EDGE(%d'd0), ",GlobalDataWidth);
      strcat(connections,s);
      
      /* Eastern connections */

      if (i != sizex-1)
	sprintf(s,".EAST_EDGE(nOut%d_%d[%d]), ",i+1,j,GlobalDataWidth-1);
      else
	sprintf(s,".EAST_EDGE(1'd0), ");
      strcat(connections,s);
      
      if ((i != sizex-1) && (j != 0))
	sprintf(s,".NE_EDGE(nOut%d_%d[%d]), ",i+1,j-1,GlobalDataWidth-1);
      else
	sprintf(s,".NE_EDGE(1'd0), ");
      strcat(connections,s);
      
      if ((i != sizex-1) && (j != sizey-1))
	sprintf(s,".SE_EDGE(nOut%d_%d[%d]), ",i+1,j+1,GlobalDataWidth-1);
      else
	sprintf(s,".SE_EDGE(1'd0), ");
      strcat(connections,s);
      
      /* Western connections */

      if (i != 0)
	sprintf(s,".WEST_EDGE(nOut%d_%d[0]), ",i-1,j);
      else
	sprintf(s,".WEST_EDGE(1'd0), ");
      strcat(connections,s);
      
      if ((i != 0) && (j != 0))
	sprintf(s,".NW_EDGE(nOut%d_%d[0]), ",i-1,j-1);
      else
	sprintf(s,".NW_EDGE(1'd0), ");
      strcat(connections,s);
      
      if ((i != 0) && (j != sizey-1))
	sprintf(s,".SW_EDGE(nOut%d_%d[0]), ",i-1,j+1);
      else
	sprintf(s,".SW_EDGE(1'd0), ");
      strcat(connections,s);
      
      /* Scan connects. */
      
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
				 idwidth,scan);
#endif

    }
  }


  /* generate a control node */
  
#ifdef NO_TEMPLATES
      sprintf(name,"U_Life_Control");
      sprintf(parameters,"%d, %d, %d, %d",width,cwidth,idwidth,scan);
#endif

  sprintf(iname,"U_Life_Control");
    
  sprintf(connections,".Id(%d'd%d), ",idwidth,controlid);

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
				 width,cwidth,idwidth,scan);
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
  int sizex,sizey,iter,scan;

  if (argc != 5) {
    printf("Computation structure generator for Life benchmark.\n");
    printf("\n");
    printf("usage: generate <sizex> <sizey> <iter>\n");
    printf("\n");
    printf("sizex is X dimension of Life grid\n");
    printf("sizey is Y dimension of Life grid\n");
    printf("iter is the maximum number of iterations\n");
    printf("scan is either scan or bus for respective implementations\n");
    printf("\n");
    exit(-1);
  };

  sizex=atoi(argv[1]);
  sizey=atoi(argv[2]);
  iter =atoi(argv[3]);
  scan =(strcmp(argv[4],"scan") == 0); /* 0 for bus, 1 for scan */

  if (sizex % GlobalDataWidth) {
    printf("sizex has to be a multiple of %d.\n Terminated.\n",
	   GlobalDataWidth);
    exit(-1);
  }

  /* Convert sizex from bits to blocks */

  sizex = sizex/GlobalDataWidth;

  /* generate the computation structure */

  generate(sizex,sizey,iter,scan);

  exit(0);
}
