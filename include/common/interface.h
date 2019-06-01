/*
 * $Header: /projects/raw/cvsroot/benchmark/include/common/interface.h,v 1.4 1997/08/10 01:49:41 jbabb Exp $
 *
 * SLIC SBus card interface include file
 *
 * Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#ifndef INTERFACE_H
#define INTERFACE_H

#include <sys/types.h>


/* open, close, reset the memory mapped interface to the SLIC Sbus card */

void interfaceOpen(u_long** addr);

void interfaceReset();

void interfaceClose();


/* Read & Write to SLIC Sbus card interface */

#define interfaceRead(regp, data)  data = *((u_long *)(regp))

#define interfaceWrite(regp, data) *((u_long *)(regp)) = (u_long)data

#endif INTERFACE_H
