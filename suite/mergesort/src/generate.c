/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/mergesort/src/generate.c,v 1.4 1997/08/09 05:57:59 jbabb Exp $
 *
 * Generate for Merge Sort Benchmark
 *
 * Authors: Jang Kim                (jdkim@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <util.h>

void generate (int size, int width, int scan)
{
  int j, k, idwidth,scanid=0;
  char name[MAXLEN];
  char iname[MAXLEN];
  char parameters[MAXLEN];
  char connections[MAXLEN];
  char s[MAXLEN];

#ifdef NO_TEMPLATES
  char parameters[MAXLEN];
#else
  vtemplate_t template;
#endif


  /* width of node identifier */

  idwidth = scan ? 1 : int_log(size);
  
  generateHeader();
  

  /* Wires. */

  for (k=1; k<size; k*=2) {
    for (j=0; j<=size-k; j+=k)
      {
	sprintf(name, "Level%dOut%d", k, j);
	generateWire(name, width-1, 0);
	sprintf(name, "Level%dLoad%d", k, j);
	generateWire(name, 0, 0);
      }
  }


  /* Generate scan related wires */

  sprintf(name, "ScanEnable");
  generateWire(name, 0, 0);

  for (k=0; k<=size; k++) {
    sprintf(name, "ScanLink%d", k);
    generateWire(name, width-1, 0);
  }
  

  /* Low level modules. */

#ifdef NO_TEMPLATES  
  sprintf(name, "Merge_Low_Node");
  sprintf(parameters, "%d, %d, %d", width, idwidth, scan);
#else
  template = declareTemplate("Merge_Low_Node", 3, "DWIDTH", "IDWIDTH", "SCAN");
#endif
  

  for (j=0; j<=size-1; j+=1) {
    sprintf(iname, "U_Merge_Low_Node_%d", j);

    sprintf(connections, ".Id(%d'd%d), ", idwidth, j);

    sprintf(s, ".Load(Level1Load%d), ", j);
    strcat(connections, s);

    sprintf(s, ".Out(Level1Out%d), ", j);
    strcat(connections, s);

    sprintf(s, ".ScanIn(ScanLink%d), ", j);
    strcat(connections, s);

    sprintf(s, ".ScanOut(ScanLink%d), ", j+1);
    strcat(connections, s);

    sprintf(s, ".ScanEnable(ScanEnable)");
    strcat(connections, s);
    
#ifdef NO_TEMPLATES
    generateInstance (name, parameters, iname, connections);
#else
    generateTemplateInstance(template, iname, connections, 
			     width, idwidth, scan);
#endif

  }

#ifdef NO_TEMPLATES
  sprintf(name, "Merge_Node");
  sprintf(parameters, "%d", width);
#else
  template = declareTemplate("Merge_Node", 1, "DWIDTH");
#endif


  for (k=2; k<size; k*=2) {
    for (j=0; j<=size-k; j+=k)
      {
	sprintf(iname, "U_Merge_Node_%d_%d", j,k);
	
	sprintf(connections, ".Load(Level%dLoad%d), ", k, j);

	sprintf(s, ".Out(Level%dOut%d), ", k, j);
	strcat(connections, s);

	sprintf(s, ".In1(Level%dOut%d), ", k/2, j);
	strcat(connections, s);

	sprintf(s, ".In2(Level%dOut%d), ", k/2, (j+(k/2)));
	strcat(connections, s);

	sprintf(s, ".Read1(Level%dLoad%d), ", k/2, j);
	strcat(connections, s);

	sprintf(s, ".Read2(Level%dLoad%d)", k/2, (j+(k/2)));
	strcat(connections, s);
	
#ifdef NO_TEMPLATES
	generateInstance (name, parameters, iname, connections);
#else
	generateTemplateInstance(template, iname, connections, width);
#endif

      }
  }

#ifdef NO_TEMPLATES
  sprintf(name, "Merge_Top_Node");
  sprintf(parameters, "%d, %d, %d", width, idwidth, scan);
#else
  template = declareTemplate("Merge_Top_Node", 3, 
			     "DWIDTH", "IDWIDTH", "SCAN");
#endif
  
  k=size/2, j=0;

  sprintf(iname, "U_Merge_Top_Node");
  
  sprintf(connections, ".Id(%d'd%d), ", idwidth, size+1);

  sprintf(s, ".In1(Level%dOut%d), ", k, j);
  strcat(connections, s);

  sprintf(s, ".In2(Level%dOut%d), ", k, (j+size/2));
  strcat(connections, s);

  sprintf(s, ".Read1(Level%dLoad%d), ", k, j);
  strcat(connections, s);

  sprintf(s, ".Read2(Level%dLoad%d), ", k, (j+size/2));
  strcat(connections, s);

  sprintf(s, ".ScanIn(ScanLink%d), ", size);
  strcat(connections, s);

  sprintf(s, ".ScanOut(ScanLink%d), ", 0);
  strcat(connections, s);

  sprintf(s, ".ScanId(%d'd%d), ", idwidth, scanid);
  strcat(connections, s);

  sprintf(s, ".ScanEnable(ScanEnable)");
  strcat(connections, s);
    
#ifdef NO_TEMPLATES  
  generateInstance (name, parameters, iname, connections);
#else
  generateTemplateInstance(template, iname, connections, 
			   width, idwidth, scan);
#endif

  generateTrailer();
}


main(int argc, char** argv)
{
  int size, width, scan;

  if (argc != 4) {
    printf("Computation structure generator for Mergesort benchmark.\n");
    printf("\n");
    printf("Usage: generate <size of input array> <size of data> <scan>\n");
    printf("\n");
    exit(-1);
  };

  size = atoi(argv[1]);
  width = atoi(argv[2]);
  scan=strcmp(argv[3], "scan") == 0; /* 0 for bus, 1 for scan */

  generate(size, width, scan);

  exit(0);
}
