/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)slic.c 1.1     92/10/29 SMI"


#ifdef	__cplusplus
extern "C" {
#endif

#include <sys/param.h>
#include <sys/stream.h>

#ifdef SYSV
#include <sys/dditypes.h>
#include <sys/kstat.h>
#endif

#include <sliceb_var.h>
#include <slic.h>

int yy_epromsize =		0x20000;
int yy_portsize =		0xc0000;
int yy_regsize =		0x0100;

int yy_epromoffset =	0x00000000;
int yy_portoffset =		0x00020000;
int yy_regoffset =		0x000e0000;

void
chip_reset(yyp)
register yy_t	*yyp;
{
	slicreg_t	*slicregp = (slicreg_t *) yyp->reg;

	/* 01/08/97 JWB: Seems to be interfering with VLE interface:
	WRITE_REG(&slicregp->reg0, 0);
        */
}

void
chip_init(yyp)
register yy_t	*yyp;
{
	slicreg_t	*slicregp = (slicreg_t *) yyp->reg;

	/* 01/08/97 JWB: Seems to be interfering with VLE interface:
	WRITE_REG(&slicregp->regp1a, 0x24009000);
	WRITE_REG(&slicregp->regp1b, 0x26009000);
	WRITE_REG(&slicregp->reg5, 0xf3f);
        */
/*	m68901_init(yyp); */
}

int
chip_intr(yyp)
register yy_t	*yyp;
{
	slicreg_t	*slicregp = (slicreg_t *) yyp->reg;
	int			sr;
	int			serviced=0;

	READ_REG(&slicregp->reg4, sr);
	if (sr & 0xff) {
		m68901_intr(yyp);
		serviced = 1;
	}
	return(serviced);
}
