/*
 * $Header: /projects/raw/cvsroot/benchmark/include/common/generate_verilog.c,v 1.8 1997/08/09 05:56:09 jbabb Exp $
 *
 * RAW Benchmark Suite verilog generator library program
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *          Matthew Frank           (mfrank@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <copyright.h>
#include <stdarg.h>
#include <stdio.h>
#include <generate_verilog.h>

#define MAX_TEMPLATE_PARAMS  16
#define MAX_TEMPLATE_CALLS  128

#define V_NAME      "generated.v"
#define POST_V_NAME "generated.post.v"
#define TPLT_V_NAME "generated.template.v"


/* Printf to both v_file and post_v_file.
 * Uses gcc macro varargs. 
 * The ## operator removes the "," if "args" is empty.
 */

#define vfiles_printf(format, args...) {  \
  fprintf(v_file, format , ## args);      \
  fprintf(post_v_file, format , ## args); \
}


FILE *v_file = NULL;		/* The behavioral version */
FILE *post_v_file = NULL;	/* behavioral with templates instantiated */


/* template structure */

struct vtemplate_body {
  char *template_name;		/* name of the template module */
  int   num_params;		/* number of parameters */
  char *param_names[MAX_TEMPLATE_PARAMS]; /* names of the parameters */
  int   num_calls;		/* number of distinct instantiations */
  /* actuals for each distinct instantiation  */
  int   actuals[MAX_TEMPLATE_CALLS][MAX_TEMPLATE_PARAMS];
  struct vtemplate_body *next;	/* linked list of all templates*/
};


/* keep a list of all templates that have been declared */

static struct vtemplate_body *all_templates = NULL;


/* aux string routine */

static char *make_string_copy(char *orig) {
  char *new;

  if ((new = (char *)malloc(strlen(orig)+1)) == NULL) {
    printf("Error: allocation error in make_string_copy.\n");
    exit(-1);
  };

  return strcpy(new, orig);
}


/* Subroutine to declare a template.  Just stores some info about the
 * template (the names of the params).
 */

vtemplate_t declareTemplate(char *template_name,
			    int num_params,
			    ...) /* list of param names */
{
  va_list ap;			/* points to each unnamed arg in turn */
  vtemplate_t new_template;
  int i;


  /* check number of parameters */
  
  if (num_params > MAX_TEMPLATE_PARAMS) {
    printf("Error: declareTemplate, max number of parameters exceeded.\n");
    exit(-1);
  }
  

  /* allocate space for the template */
  
  if ((new_template = (vtemplate_t)malloc(sizeof(struct vtemplate_body)))
      == NULL) {
    printf("Error: declareTemplate, template allocation failed.\n");
    exit(-1);
  }


  /* make ap point to 1st unnamed arg */

  va_start(ap, num_params);
  

  /* create new template */

  new_template->template_name = make_string_copy(template_name);
  new_template->num_params = num_params;
  new_template->num_calls = 0;


  /* update the global linked list */

  new_template->next = all_templates;
  all_templates = new_template;


  /* record all the parameters */

  for (i = 0; i < num_params; i++) {
    char *next_param = va_arg(ap, char *); /* get the next parameter */

    new_template->param_names[i] = make_string_copy(next_param);
  }


  /* clean up */

  va_end(ap);			
  
  return new_template;
}


/* subroutine to instantiate a template */

void generateTemplateInstance(vtemplate_t template,
			      char* iname, 
			      char* localConnections,
			      ...) /* the template parameters */
{
  va_list ap;			/* points to each unnamed arg in turn */
  char* globalConnections= ".Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut),";
  int i;
  int params[MAX_TEMPLATE_PARAMS];
  int found = 0;

  /* make ap point to 1st unnamed arg */

  va_start(ap, localConnections);


  /* print out the instantiation */

  vfiles_printf("%s",
         template->template_name);

  /* the difference between the behavioral (v_file) and
   * post-instantiated (post_v_file) are in how they handle the params.
   * behavioral looks like:
   *   template #(param1, param2) inst-name (global-wires local-wires)
   * post-instantiated looks like:
   *   template_PNAME1param1_PNAME2param2 inst-name (global-wires local-wires)
   */
  fprintf(v_file, " #( ");

  for (i = 0; i < template->num_params; i++) {
    params[i] = va_arg(ap, int); /* get next param */

    if (i != 0) fprintf(v_file, ", ");

    fprintf(v_file, "%d", params[i]);
    fprintf(post_v_file, "_%s%d", template->param_names[i], params[i]);
  }

  fprintf(v_file, " )");



  vfiles_printf(" %s ( %s %s );\n",
	 iname, globalConnections, localConnections);


  /* clean up the varargs stuff */

  va_end(ap);


  /* Now go search to see if we've called it before */

  for (i = 0; i < template->num_calls; i++) {
    int j;

    for (j = 0; j < template->num_params; j++) {
      if (template->actuals[i][j] != params[j]) {
	break;
      }
    }

    if (j == template->num_params) {
      found = 1;


      /* yes, get out */

      break;
    }
  }
  

  /* No match found, this is a new instantiation, record it. */

  if (!found) {
    int j;


    /* Check number of instances */
    
    if (i >= MAX_TEMPLATE_CALLS) {
      printf("Error: declareTemplate, max number of instances exceeded.\n");
      exit(-1);
    }
    
    for (j = 0; j < template->num_params; j++) {
      template->actuals[i][j] = params[j];
    }
    
    (template->num_calls)++;

  }
}


/* generate dummy instances for template synthesis */

static void generateTemplateDummies() {

  FILE *template_file = fopen(TPLT_V_NAME, "w");
  struct vtemplate_body *template = all_templates;
  char* globalConnections= ".Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut)";
  int d = 0;

  fprintf(template_file, "`include \"../src/library.v\"\n");
  fprintf(template_file,
	  "module dummy_node (Clk, Reset, RD, WR, Addr, DataIn, DataOut);\n");
  fprintf(template_file, "\ninput Clk,Reset,RD,WR;\n");
  fprintf(template_file, "input  [`GlobalAddrWidth-1:0] Addr;\n");
  fprintf(template_file, "input  [`GlobalDataWidth-1:0] DataIn;\n");
  fprintf(template_file, "output [`GlobalDataWidth-1:0] DataOut;\n\n");

  while (template != NULL) {
    int i;


    /* loop through all the distinct calls to this template */
    
    for (i = 0; i < template->num_calls; i++) {
      int j;

      fprintf(template_file, "%s #( ",
	      template->template_name);


      /* loop through params */

      for (j = 0; j < template->num_params; j++) {
	if (j != 0) fprintf(template_file, ", ");

	fprintf(template_file, "%d", template->actuals[i][j]);
      }

      fprintf(template_file, " ) dummy%d ( %s );\n",
	      d++, globalConnections);
    }

    template = template->next;
  }

  fprintf(template_file, "\nendmodule\n");
  fclose(template_file);
}


/* subroutine to instantiate a sub-module (old way before template version) */

void generateInstance(char* name,
                 char* parameters,
                 char* iname, 
                 char* localConnections)
{
  char* globalConnections= ".Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut),";

  vfiles_printf("%s #( %s ) %s ( %s %s );\n",
         name, parameters, iname, globalConnections, localConnections);
}


/* generate generic header that declares the main module */

void generateHeader() {
  if ((v_file = fopen(V_NAME, "w")) == NULL) {
    fprintf(stderr, "Couldn't open %s for write\n", V_NAME);
    exit(1);
  }

  if ((post_v_file = fopen(POST_V_NAME, "w")) == NULL) {
    fprintf(stderr, "Couldn't open %s for write\n", POST_V_NAME);
    exit(1);
  }

  vfiles_printf("`include \"main_header.v\"\n");
}


/* generate stuff at end of main module */

void generateTrailer() {

  vfiles_printf("`include \"main_trailer.v\"\n");

  generateTemplateDummies();

  fclose(v_file);
  fclose(post_v_file);
}


/* subroutine to generate a wire (all wires must come before instantiations) */

void generateWire(char* name,
		  int msb,
		  int lsb)
{
  vfiles_printf("wire [%d:%d] %s;\n",msb,lsb,name);
}


/* subroutines to output verilog test vectors */

void vectorRead(int addr,
	         int data)
{
  printf("/* READ  */ ");
  printf("force RD=1; ");
  printf("force WR=0; " );
  printf("force Addr=%d; ",addr);
  printf("force DataCheck=%d; ",data);
  printf("#100;\n");
}


void vectorWrite(int addr,
		  int data)
{
  printf("/* WRITE */ ");
  printf("force RD=0; ");
  printf("force WR=1; ");
  printf("force Addr=%d; ",addr);
  printf("force DataIn=%d; ",data);
  printf("#100\n");
}

void vectorNop(int cycles)
{
  printf("/* NOP   */ ");
  printf("force RD=0; ");
  printf("force WR=0; ");
  printf("force Addr=0; ");
  printf("force DataIn=0; ");
  printf("#%d; \n",cycles*100);
}
