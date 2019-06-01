/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/bheap/src/generate.c,v 1.6 1997/08/09 05:56:50 jbabb Exp $
 *
 * Generate for Binary Heap Benchmark
 *
 * Authors: Elliot Waingold         (elliotw@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <util.h>

void generate(int levels, int width, int scan)
{
  int i, j, idwidth, cwidth, id, id1, controlid, scanid=0;

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t template;
#endif

  char name[MAXLEN];
  char iname[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];

  cwidth = int_log(levels+1);
  idwidth = scan ? 1 : levels + 1;
  controlid = 1 << (idwidth-1);

  generateHeader();


  /* instantiate all wires */

  for (i=0; i<levels; i++)
    {
      sprintf(name, "wCtrlOut_%d", i);
      generateWire(name, 0, 0);

      sprintf(name, "wEnable_%d", i);
      generateWire(name, 0, 0);

      for (j=0; j < (1<<i); j++)
	{
	  if (i!=0)
	    {
	      sprintf(name, "wRegInTop_%d_%d", i, j);
	      generateWire(name, width-1, 0);
	      
	      sprintf(name, "wRegEnTop_%d_%d", i, j);
	      generateWire(name, 0, 0);
	    }

	  if (i!=(levels-1))
	    {
	      sprintf(name, "wRegInBot_%d_%d", i, j);
	      generateWire(name, width-1, 0);
	      
	      sprintf(name, "wRegEnBot_%d_%d", i, j);
	      generateWire(name, 0, 0);
	    }
	  
	  sprintf(name, "wRegOut_%d_%d", i, j);
	  generateWire(name, width-1, 0);
	}
    }


  /* The scan interface */

  sprintf(name, "ScanEnable");
  generateWire(name, 0, 0);

  for (i=0; i<pow(2,levels); i++) {
    sprintf(name, "ScanLink%d", i);
    generateWire(name, width-1, 0);
  }


  /* instantiate all data registers */

#ifdef NO_TEMPLATES
  sprintf(name, "BHeap_Reg");
  sprintf(parameters, "%d, %d, %d", width, idwidth, scan);
#else
  template = declareTemplate("BHeap_Reg", 3, "WIDTH", "IDWIDTH", "SCAN");
#endif

  id = 0;
  for (i=0; i<levels; i++)
    for (j=0; j < (1<<i); j++)
      {
	sprintf(iname, "BHR_%d_%d", i, j);

	id1=scan ? 0 : id;
	sprintf(connections, ".Id(%d'd%d), ", idwidth, id1);

	sprintf(s, ".Out(wRegOut_%d_%d), ", i, j);
	strcat(connections, s);

	if (i==0)
	  sprintf(s, ".Enable1(1'b0), ");
	else
	  sprintf(s, ".Enable1(wRegEnTop_%d_%d), ", i, j);
	strcat(connections, s);

	if (i==0)
	  sprintf(s, ".In1(%d'b0), ", width);
	else
	  sprintf(s, ".In1(wRegInTop_%d_%d), ", i, j);
	strcat(connections, s);

	if (i==(levels-1))
	  sprintf(s, ".Enable2(1'b0), ");
	else
	  sprintf(s, ".Enable2(wRegEnBot_%d_%d), ", i, j);
	strcat(connections, s);

	if (i==(levels-1))
	  sprintf(s, ".In2(%d'b0), ", width);
	else
	  sprintf(s, ".In2(wRegInBot_%d_%d), ", i, j);
	strcat(connections, s);
	
	sprintf(s, ".ScanIn(ScanLink%d), ", id+1);
	strcat(connections, s);

	sprintf(s, ".ScanOut(ScanLink%d), ", id);
	strcat(connections, s);

	sprintf(s, ".ScanEnable(ScanEnable)");
	strcat(connections, s);

	id++;

#ifdef NO_TEMPLATES
	generateInstance(name, parameters, iname, connections);
#else
	generateTemplateInstance(template, iname, connections, 
				 width, idwidth, scan);
#endif
      }


  /* instantiate all comparator nodes */

#ifdef NO_TEMPLATES
  sprintf(name, "BHeap_Node");
  sprintf(parameters, "%d", width);
#else
  template = declareTemplate("BHeap_Node", 1, "WIDTH");
#endif

  for (i=0; i < (levels-1); i++)
    for (j=0; j < (1<<i); j++)
      {
	sprintf(iname, "BHN_%d_%d", i, j);
	sprintf(connections, ".Enable(wEnable_%d), ", i);

	sprintf(s, ".P_WR(wRegEnBot_%d_%d), ", i, j);
	strcat(connections, s);

	sprintf(s, ".P_In(wRegOut_%d_%d), ", i, j);
	strcat(connections, s);
	
	sprintf(s, ".P_Out(wRegInBot_%d_%d), ", i, j);
	strcat(connections, s);

	sprintf(s, ".L_WR(wRegEnTop_%d_%d), ", i+1, j*2);
	strcat(connections, s);

	sprintf(s, ".L_In(wRegOut_%d_%d), ", i+1, j*2);
	strcat(connections, s);

	sprintf(s, ".L_Out(wRegInTop_%d_%d), ", i+1, j*2);
	strcat(connections, s);

	sprintf(s, ".R_WR(wRegEnTop_%d_%d), ", i+1, j*2+1);
	strcat(connections, s);

	sprintf(s, ".R_In(wRegOut_%d_%d), ", i+1, j*2+1);
	strcat(connections, s);

	sprintf(s, ".R_Out(wRegInTop_%d_%d)", i+1, j*2+1);
	strcat(connections, s);
	
#ifdef NO_TEMPLATES
	generateInstance(name, parameters, iname, connections);
#else
	generateTemplateInstance(template, iname, connections, width);
#endif
      }


  /* instantiate control registers */

#ifdef NO_TEMPLATES
  sprintf(name, "BHeap_CtrlReg");
  sprintf(parameters, "%d", width);
#else
  template = declareTemplate("BHeap_CtrlReg", 1, "WIDTH");
#endif

  for (i=0; i < (levels-1); i++)
    {
      sprintf(iname, "BHCR_%d", i);	
      sprintf(connections, ".In(wCtrlOut_%d), ", i+1);

      sprintf(s, ".Out(wCtrlOut_%d), ", i);
      strcat(connections, s);

      sprintf(s, ".Enable(wEnable_%d)", i);
      strcat(connections, s);
      
#ifdef NO_TEMPLATES
      generateInstance(name, parameters, iname, connections);
#else
      generateTemplateInstance(template, iname, connections, width);
#endif
    }


  /* instantiate global controller */

#ifdef NO_TEMPLATES
  sprintf(name, "BHeap_Control");
  sprintf(parameters, "%d, %d, %d, %d", cwidth, idwidth, width, scan);
#else
  template = declareTemplate("BHeap_Control", 4, 
			     "CWIDTH", "IDWIDTH", "WIDTH", "SCAN");
#endif

  sprintf(iname, "BHC");
  sprintf(connections, ".Id(%d'd%d), ", idwidth, controlid);
  
  sprintf(s, ".Go(wCtrlOut_%d), ", levels-1);
  strcat(connections, s);
  
  sprintf(s, ".Done(wCtrlOut_%d), ", 0);
  strcat(connections, s);

  sprintf(s, ".ScanIn(ScanLink%d), ", 0);
  strcat(connections, s);

  sprintf(s, ".ScanOut(ScanLink%d), ", id);
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
}

int main(int argc, char** argv)
{
  int size, width, scan;

  if (argc != 4) {
    printf("Computation structure generator for Binary Heap benchmark.\n");
    printf("\n");
    printf("usage: generate <size> <width>\n");
    printf("\n");
    printf("size is the number of levels in the tree\n");
    printf("width is data width of elements (4 to 32)\n");
    printf("scan is either scan or bus\n");
    printf("\n");
    return (-1);
  };

  size = atoi(argv[1]);
  width = atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */


  /* generate the computation structure */

  generate(size, width, scan);

  return (0);
}
