/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)m68901.c 1.1     92/10/29 SMI"

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
#include <m68901.h>

struct {
	int		c_valid;	/* c is valid */
	u_char	c;
} mfp_hold;

void
m68901_init(yyp)
register yy_t	*yyp;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;

	WRITEB_REG(&mfp->tddr, 1);
	WRITEB_REG(&mfp->tcdcr, 3);

	WRITEB_REG(&mfp->ucr,
			(UCR_CLK_DIV16 |
			UCR_WL_8 |			/* 8 data bits */
			UCR_SSBITS_1_1 |	/* 1 start, 1 stop */
			UCR_PARITY_DISABLE));

	/* Enable transmitter and receiver */
 	WRITEB_REG(&mfp->tsr, TSR_XMIT_ENABLE);
 	WRITEB_REG(&mfp->rsr, RSR_RECV_ENABLE);

	WRITEB_REG(&mfp->iera, IRA_XMIT_EMPTY+IRA_RB_FULL);
	WRITEB_REG(&mfp->imra, IRA_XMIT_EMPTY+IRA_RB_FULL);
}

#define zprintf	printf

void
m68901_intr(yyp)
register yy_t	*yyp;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;
	u_char				data;
	char				iera, ipra, isra, tsr, rsr;

	READB_REG(&mfp->iera, iera);
	READB_REG(&mfp->ipra, ipra);
	READB_REG(&mfp->isra, isra);
	READB_REG(&mfp->tsr, tsr);
	READB_REG(&mfp->rsr, rsr);
	zprintf("yyintr: iera=%x ipra=%x isra=%x\n", iera, ipra, isra);
	zprintf("yyintr: tsr=%x rsr=%x\n", tsr, rsr);
	if (rsr & RSR_FULL) {
		READB_REG(&mfp->udr, data);
		zprintf("data=%x %c\n", data, data);
	}
}

u_char
peekchar(yyp)
register yy_t	*yyp;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;
	u_char				data;
	u_char				rsr;
	int					s;

	s = splimp();
	if (mfp_hold.c_valid) {
		(void) splx(s);
		return mfp_hold.c;
	}

	READB_REG(&mfp->rsr, rsr);

	if (((rsr & (RSR_OVERRUN|RSR_PARITY|RSR_FRAME|RSR_CIP)) != 0) ||
				((rsr & RSR_FULL) != RSR_FULL) ) {
		(void) splx(s);
		return 0;
	}

	READB_REG(&mfp->udr, data);

	if (data != 0) {
		mfp_hold.c = data;
		mfp_hold.c_valid = 1;
	}
	(void) splx(s);
	return data;
}

/* outchar - output a character to the 68901 serial port. */
void
outchar(yyp, c)
register yy_t	*yyp;
u_char	c;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;
	u_char				tsr;

	READB_REG(&mfp->tsr, tsr);
	while ((tsr & TSR_EMPTY) != TSR_EMPTY) {
		READB_REG(&mfp->tsr, tsr);
	}
	
	WRITEB_REG(&mfp->udr, c);
}

/* inchar - get a character from the 68901 serial port. */
u_char
inchar(yyp)
register yy_t	*yyp;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;
	u_char				data;
	u_char				rsr;
	int					s;

	s = splimp();
	if (mfp_hold.c_valid) {
		mfp_hold.c_valid = 0;
		(void) splx(s);
		return mfp_hold.c;
	}
	(void) splx(s);

	data = 0;
	while (data == 0) {
		READB_REG(&mfp->rsr, rsr);

		if ((rsr & (RSR_OVERRUN|RSR_PARITY|RSR_FRAME)) != 0)
			continue;

		if ((rsr & RSR_CIP) != 0)
			continue;

		READB_REG(&mfp->rsr, rsr);
		if ((rsr & RSR_FULL) != RSR_FULL)
			continue;

		READB_REG(&mfp->udr, data);
	}

	(void) splx(s);
	return data;
}

/* port_status - get status of m68901 input. */
int
port_status(yyp)
register yy_t	*yyp;
{
	register m68901_t	*mfp = (m68901_t *) yyp->port;
	register u_char		rsr;
	int					s;

	if (mfp_hold.c_valid)
		return STS_CHAR;

	READB_REG(&mfp->rsr, rsr);
	if ((rsr & (RSR_OVERRUN|RSR_PARITY|RSR_FRAME|RSR_CIP)) != 0)
		return STS_NODATA;

	if (rsr & RSR_BREAK) {
		while (rsr & RSR_BREAK) {
			READB_REG(&mfp->rsr, rsr);
		}

 		return STS_BREAK;
	}

	if (peekchar(yyp) != 0)
		return STS_CHAR;

	return STS_NODATA;
}
