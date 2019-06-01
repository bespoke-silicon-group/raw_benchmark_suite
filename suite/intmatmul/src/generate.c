/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/generate.c,v 1.7 1997/08/10 01:23:08 jbabb Exp $
 *
 * Generate for Integer Matrix Multiply benchmark
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */


#include <copyright.h>

#include <math.h>
#include <generate_verilog.h>
#include <stdio.h>
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

void  generate(int sizen,int width, int scan)
{
  char name[MAXLEN];
  char iname[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];
  char t[MAXLEN];
  int i;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t node_template, control_template;
#endif

#ifndef NO_TEMPLATES
  node_template = declareTemplate("VectorDotProduct",
				  2, "pVectorSize", "pWordSize");
  
  control_template = declareTemplate("IntMatMul_Control",
				     3, "pVectorSize", "pWordSize", "pScan");
#endif


  /* generate the generic header */

  generateHeader();


  /* wires */

  generateWire("vectorInput",sizen*width-1,0);
  generateWire("matrixInput",sizen*sizen*width-1,0);
  generateWire("cOutput",sizen*width-1,0);

#ifdef NO_TEMPLATES
  sprintf(name,"U_IntMatMul_Control");
  sprintf(parameters,"%d, %d, %d ", sizen, width, scan);
#endif
  
  sprintf(iname,"U_IntMatMul_Control");
  
  sprintf(connections,".vectorInput(vectorInput), .matrixInput(matrixInput), .cOutput(cOutput)");
  
#ifdef NO_TEMPLATES
  generateInstance(name,parameters,iname,connections);
#else
  
  generateTemplateInstance(control_template,
			   iname,
			   connections,
			   sizen,width,scan);
#endif


  /* generate "sizen" vector dot products */

  for (i = 0; i < sizen; i++)
    {
#ifdef NO_TEMPLATES
      sprintf(name,"VectorDotProduct_%d",i);
      sprintf(parameters,"%d, %d", sizen, width);
#endif
      sprintf(iname,"VectorDotProduct_%d",i);
      sprintf(connections,".vectorAInput(vectorInput)"
	      ", .vectorBInput(matrixInput[%d:%d]), .cOutput(cOutput[%d:%d])",
	      (sizen*width*(i+1)-1),sizen*width*i,
	      (i+1)*width - 1, i*width);

#ifdef NO_TEMPLATES
  generateInstance(name,parameters,iname,connections);
#else
      generateTemplateInstance(node_template,iname,connections,
			       sizen, width);
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
  int sizen,width,scan;

  if (argc != 4) {
    printf("Computation Structure Generator for Int Matrix"
	   "Multiply benchmark.\n"
	   "\n"
	   "usage: generate <sizen> <width> <scan> \n"
	   "\n"
	   "sizen determines the size of a side of a matrix\n"
	   "width is data width of the matrix elements (in bits)[1-32]\n"
	   "scan is either scan or bus for respective implementations\n");
    exit(-1);
  };


  /* parameters */

  sizen=atoi(argv[1]);
  width=atoi(argv[2]);
  scan = (strcmp(argv[3],"scan") == 0); /* 0 for bus, 1 for scan */


  /* generate the computation structure */

  generate(sizen,width,scan);

  exit(0);
}
