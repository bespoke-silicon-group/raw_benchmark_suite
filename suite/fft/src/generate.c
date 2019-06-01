/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/fft/src/generate.c,v 1.4 1997/08/09 05:57:20 jbabb Exp $
 *
 * Generator for Integer FFT benchmark
 *
 * Authors: Devabhaktuni Srikrishna (chinnama@lcs.mit.edu)
 *          Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <generate_verilog.h>
#include <util.h>
#include "fft.h"

/*
  This program is the topology generator for the top level verilog
  module (main) for this benchmark. It supports a parameterized
  generation of instantiations of library components via the following
  generate subroutine.
*/

void generate(int n, int scan) {

	char name[MAXLEN];
	char iname[MAXLEN];
	char connections[MAXLEN];
	char s[MAXLEN];
	int idwidth;

#ifdef NO_TEMPLATES
	char parameters[MAXLEN];
#else
	vtemplate_t node_template, control_template;
#endif

	int logn = int_log(n);
	unsigned i, j, k ,i2, p, q;
	unsigned pass, node, id, msb, lsb, lc, rc, lb, rb, m;    
	unsigned array[logn+2][n/2][4];
	int CONTROLID=0, scanID = 1, linkID = 0, id1, size = n/2;
		
	/* width of node identifier */
	
	idwidth = scan ? 1 : GlobalAddrWidth;


	/*array is used to find the indices for the fft nodes*/
	/*k, k+i2, s, id*/
	/*in that order for each node */

	/*The following were added in to declare templates*/

#ifndef NO_TEMPLATES
        node_template = declareTemplate("FFT_Node", 4,
					"SIZE", "IDWIDTH", "s", "SCAN");
        control_template = declareTemplate("FFT_Control", 3,
					   "SIZE","IDWIDTH","SCAN");
#endif

	generateHeader(); /*generate the generic header*/

	/*These are the wires from the FFT_Node modules*/

	pass = 0;

	for(k=0; k<size; k++) { /*this is a pass that reorders the
				 data before FFT so that they come out right*/

                node = k;

                array[pass][node][0] = (k << 1);
                array[pass][node][1] = (k << 1) + 1;
                array[pass][node][2] = (size << 1)+1; /*s = n+1 since no
							shifting is to be
							performed*/
                array[pass][node][3] = pass*(size)+node;

        }/*for*/

        pass++;

	for(i = 2; i<=n; i <<= 1) { /*These are the passes of the FFT*/

		q = n/i;
		i2 = i >> 1;
	
		node=0;

		for(j=0; j<q; j++) {

			p = j*i;

			for(k=p; k<p+i2; k++) {
				
				array[pass][node][0] = k;
				array[pass][node][1] = k+i2;
				array[pass][node][2] = q*(k%i);
				array[pass][node][3] = pass*(n/2)+node;

				node++;

			}/*for*/
			
		}/*for*/

		pass++;
		
	}/*for*/

	/*reorder the input for the next pass*/

        j=0;

        for(i=0; i<=n; i++) {

                if(j>i) {  /*SWAP*/

                /*The following set of statements, swaps the expected
		  input for this pass*/

                array[pass][i/2][0] = (!(i%2)) ? j : array[pass][i/2][0];
                array[pass][i/2][1] = (i%2) ? j : array[pass][i/2][1];
                array[pass][j/2][0] = (!(j%2)) ? i: array[pass][j/2][0];
                array[pass][j/2][1] = (j%2) ? i : array[pass][j/2][1];

                }/*if*/

                m = n >> 1;

                while(m>=1 && j>=m) {

                        j -= m;

                        m >>= 1;

                }/*while*/

                j+=m;

        }/*for*/

	for(k=0; k<n/2; k++) { /*this is a pass that reorders the 
				 ata after FFT so that they come out right*/

                node = k;

                array[pass][node][0] = (k << 1);
                array[pass][node][1] = (k << 1) + 1;
                array[pass][node][2] = (size << 1)+1; /*s = n+1 since no shifting is to be performed*/
                array[pass][node][3] = pass*(size)+node;

	}/*for*/


	/*here are all the wires that I am going to use*/

	for(i=0; i<=(logn+2)*(n/2); i++) {

		msb=size;
		lsb=0;

		sprintf(name,"nLeftOut_%u", i); /*corresponds to id*/
		generateWire(name,msb,lsb);

		sprintf(name,"nRightOut_%u", i); /*corresponds to id*/
		generateWire(name,msb,lsb);

	}/*for*/


	/* The enable wire from the control node */

	sprintf(name,"nEnable");

	msb=0;
	lsb=0;
	generateWire(name,msb,lsb);


	/* Add new wires for scan interface */

	sprintf(name, "ScanEnable");
	generateWire(name, 0, 0);

	for (i=0;i<=n;i++) {
	  sprintf(name, "ScanLink%d",i);
	  generateWire(name, size-1, 0);
	}
	

	/*now for the instantiations*/

	pass = 0;

	for(j=0; j<n/2; j++) { /*first pass*/

#ifdef NO_TEMPLATES
	  sprintf(name,"FFT_Node");
	  sprintf(parameters,"%d, %d, %d, %d",
		  size,idwidth,array[pass][j][2],scan);
#endif

		sprintf(iname,"node_%u", array[pass][j][3]);

		id1=scan ? 0 :  (array[pass][j][3] << 2)+1;
		sprintf(connections,".Idl(%u'd%u), ", idwidth, id1);
		
		id1=scan ? 0 :  (array[pass][j][3] << 2)+2;
		sprintf(s,".Idr(%u'd%u), ", idwidth, id1);
		strcat(connections,s);
		
		id1=scan ? 0 :  (array[pass][j][3] << 2)+3;
		sprintf(s,".Ids(%u'd%u), ", idwidth, id1);
		strcat(connections,s);
		
		sprintf(s,".Enable(nEnable), ");
		strcat(connections,s);

		sprintf(s,".inleft(nLeftOut_%d), ", array[pass][j][3]);
		strcat(connections,s);

		sprintf(s,".inright(nRightOut_%d), ", array[pass][j][3]);
		strcat(connections,s);
		
		sprintf(s,".outleft(nLeftOut_%u), ", array[pass][j][3]);
		strcat(connections,s);
	
		sprintf(s,".outright(nRightOut_%u), ", array[pass][j][3]);
		strcat(connections,s);

		sprintf(s, ".ScanIn(ScanLink%d), ", linkID);
		strcat(connections, s);

		sprintf(s, ".ScanOut(ScanLink%d), ", linkID+1);
		strcat(connections, s);

		linkID ++; 

		sprintf(s, ".ScanEnable(ScanEnable)");
		strcat(connections, s);

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
		generateTemplateInstance(node_template,iname,connections,
					 size,idwidth,array[pass][j][2],scan);
#endif

	}/*for*/
	
	pass++;

	for(i=pass; i<logn+2; i++) {

		for(j=0; j<n/2; j++) {

#ifdef NO_TEMPLATES
		  sprintf(name,"FFT_Node");
		  sprintf(parameters,"%d, %d, %d, %d",
			  size,idwidth,array[i][j][2],scan);
#endif
			sprintf(name,"FFT_Node");
	
			sprintf(iname,"node_%u", array[i][j][3]);
			strcat(connections,s);

			id1=scan ? 0 :  (array[i][j][3] << 2)+1;
			sprintf(connections,".Idl(%u'd%u), ", idwidth, id1);

			id1=scan ? 0 :  (array[i][j][3] << 2)+2;
			sprintf(s,".Idr(%u'd%u), ", idwidth, id1);
			strcat(connections,s);

			id1=scan ? 0 :  (array[i][j][3] << 2)+3;
			sprintf(s,".Ids(%u'd%u), ", idwidth, id1);
			strcat(connections,s);

			sprintf(s,".Enable(nEnable), ");
			strcat(connections,s);


			/*find the connections to be made for
			  inleft and inright inputs*/

			for(k=0; k<size; k++) {

				if(array[i-1][k][0] == array[i][j][0]) {
					lc = array[i-1][k][3];
					lb=0;
				}/*if*/
				
				if(array[i-1][k][1] == array[i][j][0]) {
					lc = array[i-1][k][3];
					lb=1;
				}/*if*/
				
				if(array[i-1][k][0] == array[i][j][1]) {
					rc = array[i-1][k][3];
					rb=0;
				}/*if*/
				
				if(array[i-1][k][1] == array[i][j][1]) {
					rc = array[i-1][k][3];
					rb=1;
				}/*if*/
			
			}/*for*/

			if(!lb) {
				sprintf(s,".inleft(nLeftOut_%u), ", lc);
				strcat(connections,s);
			}/*if*/

			else {
				sprintf(s,".inleft(nRightOut_%u), ", lc);
				strcat(connections,s);
			}/*else*/

			if(!rb) {

				sprintf(s,".inright(nLeftOut_%u), ", rc);
				strcat(connections,s);
			}/*if*/

			else {
				sprintf(s,".inright(nRightOut_%u), ", rc);
				strcat(connections,s);
			}/*else*/

			sprintf(s,".outleft(nLeftOut_%u), ", array[i][j][3]);
			strcat(connections,s);
	
			sprintf(s,".outright(nRightOut_%u), ", array[i][j][3]);
			strcat(connections,s);

			if (i != logn+1) {
			  sprintf(s, ".ScanIn(%d'd%d), ",size,0);
			  strcat(connections, s);
			  
			  sprintf(s, ".ScanEnable(1'b0)");
			  strcat(connections, s);
			} else {
			  sprintf(s, ".ScanIn(ScanLink%d), ", linkID);
			  strcat(connections, s);

			  sprintf(s, ".ScanOut(ScanLink%d), ", linkID+1);
			  strcat(connections, s);

			  linkID ++; 

			  sprintf(s, ".ScanEnable(ScanEnable)");
			  strcat(connections, s);
			}

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
	generateTemplateInstance(node_template,iname,connections, 
				 size, idwidth, array[i][j][2], scan);
#endif
		}/*for*/

	}/*for*/

	pass = i;


	/* generate a control node*/


	/*id for control node is 1 << logn) */

#ifdef NO_TEMPLATES
	sprintf(name,"FFT_Control");
	sprintf(parameters,"%d, %d, %d",
		size,idwidth,scan);
#endif


	sprintf(iname,"node_Control");

	sprintf(connections,".Id(%u'd%u), ", idwidth, CONTROLID);

	sprintf(s,".Enable(nEnable), ");
	strcat(connections,s);
	
	sprintf(s, ".ScanIn(ScanLink%d), ", linkID);
	strcat(connections, s);

	sprintf(s, ".ScanOut(ScanLink%d), ", 0);
	strcat(connections, s);

	sprintf(s, ".ScanEnable(ScanEnable), ");
	strcat(connections, s);
	
	sprintf(s, ".ScanId(%d'd%d)", idwidth, scanID);
	strcat(connections, s);

#ifdef NO_TEMPLATES
	generateInstance(name,parameters,iname,connections);
#else
	generateTemplateInstance(control_template,iname,connections,
				 size, idwidth, scan);
#endif


	/*generate the generic trailer (you must have this) */

	generateTrailer();

	return;

}/*generate*/



/* 
  Main routine for generate. Usage and input parameters are
  specific to this benchmark. Modify accordingly to support
  your benchmark.
*/

void main(int argc, char**argv) {

	int n;
	int scan;

	if (argc != 3) {

	 	printf("Computation structure generator for FFT benchmark.\n");
		printf("\n");
    		printf("usage: generate <n> <scan> \n");
    		printf("\n");
		printf("n is the size of the FFT being computed\n");
		printf("scan is either scan or bus\n");
		printf("\n");
		exit(-1);

	}

	n = atoi(argv[1]);
	scan=strcmp(argv[2], "scan") == 0; /* 0 for bus, 1 for scan */

        if(n < 4 || n > 64 ) { 

                printf("n must be between 4 and 64.\n");
		exit(-1);
        
        }/*if*/

	
	generate(n, scan);

	exit(0);

}/*main*/
