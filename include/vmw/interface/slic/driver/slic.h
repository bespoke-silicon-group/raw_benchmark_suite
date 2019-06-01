/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)slic.h 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

typedef struct slicreg	slicreg_t;

struct slicreg {
	u_long	reg0;	
	u_long	reg1;	
	u_long	reg2;	
	u_long	reg3;	
	u_long	reg4;	
	u_long	reg5;	
	u_long	unused[2];
	u_long	regp0a;
	u_long	regp0b;
	u_long	regp1a;
	u_long	regp1b;
	u_long	regp2a;
	u_long	regp2b;
	u_long	regp3a;
	u_long	regp3b;
	u_long	regp4a;
	u_long	regp4b;
	u_long	regp5a;
	u_long	regp5b;
	u_long	regp6a;
	u_long	regp6b;
};
