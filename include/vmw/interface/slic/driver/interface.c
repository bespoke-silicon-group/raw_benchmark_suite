/*
 * $Header: /projects/raw/cvsroot/benchmark/include/vmw/interface/slic/driver/interface.c,v 1.2 1997/08/09 05:56:38 jbabb Exp $
 *
 * SLIC SBus card interface program
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stropts.h>

#include <sys/param.h>      /* def of NULL and similar */
#include <sys/mman.h>       /* PROT_READ, PROT_WRITE, MAP_SHARED... */

#include "interface.h"
#include "sliceb_ioctl.h"
#include "slic.h"
  

/* copied from slic.c */

int yy_epromsize =		0x20000;
int yy_portsize =		0xc0000;
int yy_regsize =		0x0100;

int yy_epromoffset =	        0x00000000;
int yy_portoffset =		0x00020000;
int yy_regoffset =		0x000e0000;


/* globals */

int fd;
u_long   *port_addr;
slicreg_t *slicregp;


/* open SLIC SBus device */

openDevice(devname)
char* devname;
{
	int ppa;

	if ((fd = yyopen(devname)) < 0) {
		perror("Failed to open SLIC device.\n");
		exit(-1);
	}
	ppa = atoi(&devname[strlen(devname)-1]);
	yyattach(fd, ppa);
	yyokack(fd);
}



/*
  interface_open opens the SLIC SBus device, memory maps the registers
  and port1, and  sets the registers appropriately to communicate with
  the emulator by calling interface_reset.
*/

void interfaceOpen(u_long** addr)
{

  /* open SLIC device */
  openDevice("sliceb0");
  

  /* memory map port address space */

  if (! (port_addr=
	 (u_long *) mmap(
			 0,
			 yy_portsize,
			 PROT_READ|PROT_WRITE,
			 MAP_SHARED,
			 fd,
			 yy_portoffset))){
    perror("mmap failed for port address space.\n");
    exit(-1);
  }
  

  /* memory map the register space */

  if (! (slicregp=
	 (slicreg_t *) mmap(
			    (caddr_t) NULL,
			    yy_regsize,
			    PROT_READ|PROT_WRITE,
			    MAP_SHARED,
			    fd,
			    yy_regoffset))){
    perror("mmap failed for register address space\n.");
    exit(-1);
  }
  

  /* okay, we're open and mapped, now reset everything: */

  interfaceReset();


  /* return the port_addr mapping for future reads and writes */

  *addr = port_addr;
}



/*
  interfaceReset initializes the interface appropriately.
*/

void interfaceReset()
{

  /* initialization sequence */

  /* first, activate reset to emulator */

  interfaceWrite(&slicregp->reg1, 1);


  /* next, perform a soft reset of the SLIC card and program registers */

  interfaceWrite(&slicregp->reg0, 0);


  /* global control register (see page 6-6 of MC92005 User's manual)

     [25]=  1 port 1 buffered writes,
     [17]=  1 port 1 buffered reads,
     [11-8]=f PBus timeout = 15.
     [5-0]= 0 mask all interrupts
  */
  
  interfaceWrite(&slicregp->reg5,   0x02020f00);
  

  /* Device specific registers A (see page 6-8 of MC92005 User's manual)
     for read cycles:
       no chip select
       read polarity =    negative
       read activation=   1 Sbus cycle
       read deactivation= 1 Sbus cycle
       external ready, negative polarity
       */
  
  interfaceWrite(&slicregp->regp1a, 0x00480028);
  

  /* Device specific registers B (see page 6-9 of MC92005 User's manual)
     for write cycles:
     no chip select
     write polarity=    negative
     write activation=  1 Sbus cycle
     write deactivation=1 Sbus cycle
     external ready, negative polarity
     PBus Data width   = word
     */
  
  interfaceWrite(&slicregp->regp1b, 0x00009000);
  

  /* finally, de-activate reset to emulator, read to go! */

  interfaceWrite(&slicregp->reg1, 0);

}


/*
  interface_close unmaps the registers and ports to the SLIC card
  and closes the file to the device driver.
*/

void interfaceClose()
{


  /* unmap the registers */

  munmap(slicregp, yy_regsize);


  /* unmap the port address */

  munmap(port_addr, yy_portsize);


  /* and close the device */

  close(fd);
}
