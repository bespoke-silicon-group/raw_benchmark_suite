/*
  $Header: /projects/raw/cvsroot/benchmark/include/common/generate_verilog.h,v 1.5 1997/07/27 12:10:21 jbabb Exp $
  RAW Benchmark Suite common library header for verilog generation
*/

#ifndef GENERATE_VERILOG_H
#define GENERATE_VERILOG_H

/* template typedef */

typedef struct vtemplate_body *vtemplate_t;


/* subroutine to declare a template */

vtemplate_t declareTemplate(char *template_name,
			    int num_params,
			    ...); /* list of param names */


/* subroutine to instantiate a template */

void generateTemplateInstance(vtemplate_t template,
			      char* iname, 
			      char* localConnections,
			      ...); /* the template parameters */


/* subroutine to instantiate a sub-module (old way before template version) */

void generateInstance(char* name,
                 char* parameters,
                 char* iname, 
                 char* localConnections);


/* generate generic header that declares the main module */

void generateHeader();


/* generate stuff at end of main module */

void generateTrailer();


/* subroutine to generate a wire */

void generateWire(char* name,
		  int msb,
		  int lsb);


/* subroutines to output test vectors */

void vectorRead(int addr,
		int data);

void vectorWrite(int addr,
		 int data);

void vectorNop(int cycles);


#endif GENERATE_VERILOG_H
