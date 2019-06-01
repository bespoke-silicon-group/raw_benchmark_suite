/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)yyhw.c 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

#include <sys/param.h>
#include <sys/stream.h>

#ifdef SYSV
#include <sys/ddi.h>
#include <sys/sunddi.h>
#endif SYSV

#include <sliceb_var.h>

void
yyreset(yyp)
yy_t	*yyp;
{
	if (yydebug)
		cmn_err(CE_CONT, "yyreset%d\n", yyp->unit);

#ifdef SYSV
	mutex_enter(&yyp->intrlock);
	mutex_enter(&yyp->xmitlock);
	mutex_enter(&yyp->buflock);
#endif SYSV


	/* Reset the chips. */
	chip_reset(yyp);

	/* zero out stats and error counters */

	/* untimeout any timers */

	yyp->flags &= ~RUNNING;

#ifdef SYSV
	mutex_exit(&yyp->buflock);
	mutex_exit(&yyp->xmitlock);
	mutex_exit(&yyp->intrlock);
#endif SYSV
}

yyinit(yyp)
yy_t	*yyp;
{
	register yystr_t	*yystrp;

	if (yydebug)
		cmn_err(CE_CONT, "yyinit%d\n", yyp->unit);

#ifdef SYSV
	mutex_enter(&yyp->intrlock);
	mutex_enter(&yyp->xmitlock);
	rw_enter(&yystrlock, RW_WRITER);
#endif SYSV

	yyp->inits++;

	/* Freeze the chips. */

	/* Free any queued msgs. */
	for (yystrp = yystrlstp; yystrp; yystrp = yystrp->nextp) {
		if (yystrp->yyp == yyp) {
			flushq(yystrp->rq, FLUSHALL);
			flushq(WR(yystrp->rq), FLUSHALL);
		}
	}

	/* Allocate data structures. */

	/* Reset message descriptors. */

	/* Initialize buffer allocation information. */

	/* Free all tx buffers */

	/* Clear all descriptors. */

	/* Hang out receive buffers. */

	/* Sync the special frames area & the descriptors */

	/* Init Chips */
	chip_init(yyp);

	yyp->flags |= RUNNING;

#ifdef SYSV
	rw_exit(&yystrlock);
	mutex_exit(&yyp->xmitlock);
	mutex_exit(&yyp->intrlock);
#endif SYSV

	return(0);
}
