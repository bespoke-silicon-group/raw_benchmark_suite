/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bubblesort/src/generate.c,v 1.5 1997/08/09 05:56:58 jbabb Exp $
 *
 * Generate for Bubble Sort Benchmark
 *
 * Authors: Elliot Waingold         (elliotw@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <math.h>
#include <generate_verilog.h>

/*
  This program is the topology generator for the top-level verilog 
  module (main for this benchmark.  It supports parameterized (by 
  array length and data element width) generation of instantiations 
  of library components via the generate subroutine.
  */

#define MAXLEN 1024

/* integer log2 function */

int int_log(int val) { return (int)(ceil(log((double)val)/log(2))); }

/* 
   Generate currently only supports an even value for size.
  */

void generate(int size, int width, int scan)
{
  int i, j, idwidth, cwidth, id, id1;
  int scanid=0,controlid;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t template;
#endif

  char name[MAXLEN], 
    iname[MAXLEN],
    connections[MAXLEN],
    s[MAXLEN];

  /* standard benchmark header */

  generateHeader();

  cwidth = int_log((size/2) + 1);
  idwidth = scan ? 1 : int_log(size+1);
  controlid = 1 << (idwidth-1);


  /* create all interconnection wires */

  for (i=0; i < (size/2); i++)
    {
      sprintf(name, "wRegInA%d", i);
      generateWire(name, width-1, 0);

      sprintf(name, "wRegInB%d", i);
      generateWire(name, width-1, 0);
      
      sprintf(name, "wAIn%d", i);
      generateWire(name, width-1, 0);

      sprintf(name, "wBIn%d", i);
      generateWire(name, width-1, 0);
    }

  for (i=0; i < ((size/2)-1); i++)
    {
      sprintf(name, "wAMid%d", i);
      generateWire(name, width-1, 0);
      
      sprintf(name, "wBMid%d", i);
      generateWire(name, width-1, 0);
    }

  sprintf(name, "wEnable");
  generateWire(name, 0, 0);


  /* support for scan interface */

  sprintf(name, "ScanEnable");
  generateWire(name, 0, 0);

  for (i=0; i <= size; i++) {
    sprintf(name, "ScanLink%d", i);
    generateWire(name, width-1, 0);
  }


  /* instantiate all comparator nodes */

#ifdef NO_TEMPLATES
  sprintf(name, "BubbleSort_Node");
  sprintf(parameters, "%d", width);
#else
  template = declareTemplate("BubbleSort_Node", 1, "WIDTH");
#endif

  for (i=0; i < (size/2); i++)
    {
      sprintf(iname, "BSN1_%d", i);
      sprintf(connections, ".AIn(wAIn%d), ", i);

      sprintf(s, ".BIn(wBIn%d), ", i);
      strcat(connections, s);

      if (i != 0)
	sprintf(s, ".HiOut(wBMid%d), ", i-1);
      else
	sprintf(s, ".HiOut(wRegInA%d), ", i);
      strcat(connections, s);

      if (i != ((size/2)-1))
	sprintf(s, ".LoOut(wAMid%d)", i);
      else
	sprintf(s, ".LoOut(wRegInB%d)", i);
      strcat(connections, s);

#if NO_TEMPLATES
      generateInstance(name, parameters, iname, connections);
#else
      generateTemplateInstance(template, iname, connections, width);
#endif
    }

  for (i=0; i < ((size/2)-1); i++)
    {
      sprintf(iname, "BSN2_%d", i);
      sprintf(connections, ".AIn(wAMid%d), ", i);
      
      sprintf(s, ".BIn(wBMid%d), ", i);
      strcat(connections, s);

      sprintf(s, ".HiOut(wRegInB%d), ", i);
      strcat(connections, s);
      
      sprintf(s, ".LoOut(wRegInA%d)", i+1);
      strcat(connections, s);

#ifdef NO_TEMPLATES
      generateInstance(name, parameters, iname, connections);
#else
      generateTemplateInstance(template, iname, connections, width);
#endif
    }

/* instantiate all input registers */

#ifdef NO_TEMPLATES
  sprintf(name, "BubbleSort_Reg");
  sprintf(parameters, "%d, %d, %d", width, idwidth, scan);
#else
  template = declareTemplate("BubbleSort_Reg", 3, "WIDTH", "IDWIDTH", "SCAN");
#endif

  id = size-1;
  for (i=0; i < (size/2); i++)
    {
      sprintf(iname, "U_BSR_%d", id);

      id1=scan ? 0 : id;
      sprintf(connections, ".Id(%d'd%d), ", idwidth, id1);

      strcat(connections, ".Enable(wEnable), ");

      sprintf(s, ".In(wRegInA%d), ", i);
      strcat(connections, s);

      sprintf(s, ".Out(wAIn%d), ", i);
      strcat(connections, s);

      sprintf(s, ".ScanIn(ScanLink%d), ", id+1);
      strcat(connections, s);
      
      sprintf(s, ".ScanOut(ScanLink%d), ", id);
      strcat(connections, s);

      sprintf(s, ".ScanEnable(ScanEnable)");
      strcat(connections, s);

      id--;
      
#ifdef NO_TEMPLATES
      generateInstance(name, parameters, iname, connections);
#else
      generateTemplateInstance(template, iname, connections, 
			       width, idwidth, scan);
#endif

      sprintf(iname, "U_BSR_%d", id);

      id1=scan ? 0 : id;
      sprintf(connections, ".Id(%d'd%d), ", idwidth, id1);

      strcat(connections, ".Enable(wEnable), ");
      
      sprintf(s, ".In(wRegInB%d), ", i);
      strcat(connections, s);
      
      sprintf(s, ".Out(wBIn%d), ", i);
      strcat(connections, s);
     
      sprintf(s, ".ScanIn(ScanLink%d), ", id+1);
      strcat(connections, s);
      
      sprintf(s, ".ScanOut(ScanLink%d), ", id);
      strcat(connections, s);

      sprintf(s, ".ScanEnable(ScanEnable)");
      strcat(connections, s);

      id--;

#ifdef NO_TEMPLATES 
      generateInstance(name, parameters, iname, connections);
#else
      generateTemplateInstance(template, iname, connections, 
			       width, idwidth, scan);
#endif
    }


/* instantiate controller node */

#ifdef NO_TEMPLATES
  sprintf(name, "BubbleSort_Control");
  sprintf(parameters, "%d, %d, %d, %d", cwidth, idwidth, width, scan);
#else
  template = declareTemplate("BubbleSort_Control", 4, 
			     "CWIDTH", "IDWIDTH", "WIDTH", "SCAN");
#endif

  sprintf(iname, "U_BSC");

  sprintf(connections, ".Id(%d'd%d), ", idwidth, controlid);
  strcat(connections, ".Enable(wEnable), ");

  sprintf(s, ".ScanIn(ScanLink%d), ", 0);
  strcat(connections, s);
  
  sprintf(s, ".ScanOut(ScanLink%d), ", size);
  strcat(connections, s);

  sprintf(s, ".ScanEnable(ScanEnable), ");
  strcat(connections, s);

  sprintf(s, ".ScanId(%d'd%d)", idwidth, scanid);
  strcat(connections, s);

#ifdef NO_TEMPLATES
  generateInstance(name, parameters, iname, connections);
#else
  generateTemplateInstance(template, iname, connections, 
			   cwidth, idwidth, width, scan);
#endif

  generateTrailer();
	  
  return;
}

main(int argc, char** argv)
{
  int size, width, scan;

  if (argc != 4) {
    printf("Computation structure generator for Bubble Sort benchmark.\n");
    printf("\n");
    printf("usage: generate <size> <width>\n");
    printf("\n");
    printf("size is the number of elements to sort (even)\n");
    printf("width is data width of array elements (4 to 32)\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    exit(-1);
  };

  size=atoi(argv[1]);
  width=atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */


  /* only even numbers for now */

  if ((size%2) == 1)
    size++;


  /* generate the computation structure */

  generate(size, width, scan);

  exit(0);
}
