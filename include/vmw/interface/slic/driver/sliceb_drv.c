/* Copyright (c) 1992 by Sun Microsystems, Inc. */
/* 01/08/97 jbabb@mit.edu - modified yy_mmap to allow mmapping to ports */

#pragma ident  "@(#)yydrv.c 1.3     92/11/12 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

/*<<<<<<<<<<<<<<<<<<<<<<<<<<  INCLUDED FILES  >>>>>>>>>>>>>>>>>>>>>>>>>>*/

#include <sys/param.h>
#include <sys/errno.h>
#include <sys/debug.h>
#include <sys/time.h>
#include <sys/sysmacros.h>
#include <sys/systm.h>
#include <sys/user.h>
#include <sys/stropts.h>
#include <sys/stream.h>
#include <sys/conf.h>
#include <sys/stat.h>

#ifdef SYSV
#define DEBUG   1   /* for debug.h ASSERT() */
#include <sys/strlog.h>
#include <sys/cmn_err.h>
#include <sys/cpu.h>
#include <sys/kmem.h>
#include <sys/ddi.h>
#include <sys/sunddi.h>
#include <sys/ksynch.h>
#include <sys/vtrace.h>
#include <sys/obpdefs.h>
#include <sys/strsun.h>
#include <sys/dlpi.h>
#include <sys/ethernet.h>
#else SYSV
#include <sun/openprom.h>
#endif SYSV

#include <sliceb_var.h>
#include <sliceb_ioctl.h>

/*<<<<<<<<<<<<<<<<<<<<<<<<<  MACRO DEFINITIONS >>>>>>>>>>>>>>>>>>>>>>>>>*/

#define zprintf	printf

#ifdef SYSV
#define GETSTRUCT(structure, number)   \
			((structure *) kmem_zalloc( \
			(u_int) (sizeof (structure) * (number)), KM_SLEEP))
#else SYSV
#define GETSTRUCT(structure, number)   \
			((structure *) kmem_zalloc( \
			(u_int) (sizeof (structure) * (number)), KMEM_SLEEP))

#define	DB_BASE(mp)		((mp)->b_datap->db_base)
#define	DB_LIM(mp)		((mp)->b_datap->db_lim)
#define	DB_REF(mp)		((mp)->b_datap->db_ref)
#define	DB_TYPE(mp)		((mp)->b_datap->db_type)

#define	MBLKL(mp)		((mp)->b_wptr - (mp)->b_rptr)
#define	MBLKSIZE(mp)	((mp)->b_datap->db_lim - (mp)->b_datap->db_base)
#define	MBLKHEAD(mp)	((mp)->b_rptr - (mp)->b_datap->db_base)
#define	MBLKTAIL(mp)	((mp)->b_datap->db_lim - (mp)->b_wptr)
#define	MBLKIN(mp, off, len)	(((mp)->b_rptr + off + len) <= (mp)->b_wptr)

#define	OFFSET(base, p)	((caddr_t)(p) - (caddr_t)(base))
extern	mblk_t	*mexchange();
#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<<<<<<  DATA STRUCTURES  >>>>>>>>>>>>>>>>>>>>>>>>>>*/

int	yydebug = 0;

int		yy_units = 0;

yy_t	*yy_varp = NULL;
yystr_t	*yystrlstp = NULL;

char	yy_devname[] = YYNAME;

#ifdef SYSV
static krwlock_t    yystrlock;

/* Linked list of device "opsvec" structures */
static yyops_t      *yyops = NULL;
static kmutex_t     yyopslock;
#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<<<<<<  PROCEDURE DECLARATIONS  >>>>>>>>>>>>>>>>>>>*/

#ifdef SYSV
int yyidentify(dev_info_t*);
int yyattach(dev_info_t*, ddi_attach_cmd_t);
int yydetach(dev_info_t*, ddi_detach_cmd_t);
int yyinfo(dev_info_t *, ddi_info_cmd_t, void *, void **);
#else SYSV
int yyidentify();
int yyattach();
#endif SYSV

int	yyopen();
int	yyclose();		/* really void, not int */
int	yyrsrv();		/* really void, not int */
int	yywput();		/* really void, not int */
int	yywsrv();		/* really void, not int */

int yy_mmap();

/*<<<<<<<<<<<<<<<<<<<<<  AUTOCONFIG  DECLARATIONS  >>>>>>>>>>>>>>>>>>>>>*/

struct module_info	yy_minfo = {
	YYIDNUM,	/* mi_idnum */
	YYNAME,		/* mi_idname */
	YYMINPSZ,	/* mi_minpsz */
	YYMAXPSZ,	/* mi_maxpsz */
	YYHIWAT,	/* mi_hiwat */
	YYLOWAT		/* mi_lowat */
};

struct qinit	yy_rinit = {
	NULL,		/* int (*qi_putp)() */
	yyrsrv,		/* int (*qi_srvp)() */
	yyopen,		/* int (*qi_qopen() */
	yyclose,	/* int (*qi_qclose() */
	NULL,		/* int (*qi_qadmin)() */
	&yy_minfo,	/* struct module_info *qi_minfo */
	NULL		/* struct module_stat *qi_mstat */
};

struct qinit	yy_winit = {
	yywput,		/* int (*qi_putp)() */
	yywsrv,		/* int (*qi_srvp)() */
	NULL,			/* int (*qi_qopen() */
	NULL,			/* int (*qi_qclose() */
	NULL,			/* int (*qi_qadmin)() */
	&yy_minfo,	/* struct module_info *qi_minfo */
	NULL			/* struct module_stat *qi_mstat */
};

struct streamtab	yy_info = {
	&yy_rinit,	/* struct qinit	*st_rdinit */
	&yy_winit,	/* struct qinit	*st_wrinit */
	NULL,			/* struct qinit	*st_muxrinit */
	NULL			/* struct qinit	*st_muxwinit */
};

#ifdef SYSV
/* Use handy DDI macro to define the yy_ops structure. */
DDI_DEFINE_STREAM_OPS(
	yy_ops, 		/* XXname */		\
	yyidentify, 	/* XXidentify */	\
	nulldev, 		/* XXprobe */		\
	yyattach, 		/* XXattach */		\
	yydetach,		/* XXdetach */		\
	nodev, 			/* XXreset */		\
	yyinfo, 		/* XXgetinfo */		\
	(D_NEW | D_MP), /* XXflag */		\
	&yy_info		/* XXstream_tab */	\
	);
#else SYSV
struct dev_ops	yy_ops = {
	1,			/* revision number */
	yyidentify,	/* confirm device ID */
	yyattach,	/* attach routine of driver */
};
#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<<<<<<<<  SUPPORT ROUTINES  >>>>>>>>>>>>>>>>>>>>>>>*/

/* Detach a Stream from an interface. Call with lock acquired. */
static void
yydodetach(yystrp)
register yystr_t	*yystrp;
{
	register yystr_t	*tyystrp;
	register yy_t		*yyp;
	register int		reinit = 0;

	if (yydebug)
		cmn_err(CE_CONT, "yydodetach\n");

	/*
	ASSERT(yystrp->yyp);
	*/

	yyp = yystrp->yyp;
	yystrp->yyp = NULL;

	flushq(yystrp->rq, FLUSHALL);
	flushq(WR(yystrp->rq), FLUSHALL);

	/*
	 * Detach from device structure.
	 * Reset the device when no other streams are attached to it.
	 */
	for (tyystrp = yystrlstp; tyystrp; tyystrp = tyystrp->nextp)
		if (tyystrp->yyp == yyp)
			break;

	if (yyp) {
		if (yyp->dip) {
			if (tyystrp == NULL)
				yyreset(yyp);
		} 
	}

	/* Change state. */
	yystrp->state = DL_UNATTACHED;
}

#ifdef SYSV

static
yyerror(dip, fmt, a1, a2, a3, a4, a5, a6)
dev_info_t	*dip;
char	*fmt, *a1, *a2, *a3, *a4, *a5, *a6;
{
	static	long	last;
	static	char	*lastfmt;

	/*
	 * Don't print same error message too often.
	 */
	if ((last == (hrestime.tv_sec & ~1)) && (lastfmt == fmt))
		return;
	last = hrestime.tv_sec & ~1;
	lastfmt = fmt;

	cmn_err(CE_CONT, "%s%d:  ", ddi_get_name(dip), ddi_get_instance(dip));
	cmn_err(CE_CONT, fmt, a1, a2, a3, a4, a5, a6);
	cmn_err(CE_CONT, "\n");
}

#else SYSV

cmn_err(level, fmt, a1, a2, a3, a4, a5, a6)
int		level;
char	*fmt, *a1, *a2, *a3, *a4, *a5, *a6;
{
	printf(fmt, a1, a2, a3, a4, a5, a6);
}

#define getmajor	major
#define getminor	minor
#define makedevice	makedev

/*
 * Convert an M_IOCTL into an M_IOCACK.
 * Assumption:  mp points to an M_IOCTL msg.
 */
miocack(wq, mp, count, error)
queue_t		*wq;
mblk_t		*mp;
int			count;
int			error;
{
	struct iocblk	*iocp;

	mp->b_datap->db_type = M_IOCACK;
	iocp = (struct iocblk *) mp->b_rptr;
	iocp->ioc_count = count;
	iocp->ioc_error = error;
	qreply(wq, mp);
}

/*
 * Convert an M_IOCTL into an M_IOCNAK.
 * Assumption:  mp points to an M_IOCTL msg.
 */
static
miocnak(wq, mp, count, error)
register queue_t	*wq;
register mblk_t		*mp;
register int		count;
register int		error;
{
	struct iocblk	*iocp;

	mp->b_datap->db_type = M_IOCNAK;
	iocp = (struct iocblk *) mp->b_rptr;
	iocp->ioc_count = count;
	iocp->ioc_error = error;
	qreply(wq, mp);
}

merror(wq, mp, error)
queue_t		*wq;
mblk_t		*mp;
int			error;
{
	if ((mp == mexchange(wq, mp, 1, M_ERROR, -1)) == NULL)
		return;
	*mp->b_rptr = (unsigned char) error;
	qreply(wq, mp);
}

/*
 * Exchange one msg for another.  Free old msg and allocate
 * a new one if either (1) mp is NULL, (2), requested size
 * is larger than current size, or (3) reference count of
 * the current msg is greater than one.
 * Set db_type and b_rptr/b_wptr appropriately.
 * Set the first longword of the msg to 'primtype' if
 * 'primtype' is not -1.
 *
 * On allocb() failure, return NULL after sending an
 * M_ERROR msg w/ENOSR error upstream.
 */
mblk_t*
mexchange(wq, mp, size, type, primtype)
queue_t		*wq;
mblk_t		*mp;
int			size;
int			type;
long		primtype;
{
	if ((mp == NULL) || (MBLKSIZE(mp) < size) || (DB_REF(mp) > 1)) {
		freemsg(mp);
		if ((mp = allocb(size, BPRI_LO)) == NULL) {
			if (mp = allocb(1, BPRI_HI))
				merror(wq, mp, ENOSR);
			return (NULL);
		}
	}
	mp->b_datap->db_type = type;
	mp->b_rptr = mp->b_datap->db_base;
	mp->b_wptr = mp->b_rptr + size;
	if (primtype >= 0)
		*(long *)mp->b_rptr = primtype;
	return (mp);
}

dlokack(wq, mp, correct_primitive)
queue_t	*wq;
mblk_t	*mp;
u_long	correct_primitive;
{
	register	union	DL_primitives	*dlp;

	if ((mp = mexchange(wq, mp, sizeof (dl_ok_ack_t), M_PCPROTO,
			DL_OK_ACK)) == NULL)
		return;
	dlp = (union DL_primitives *) mp->b_rptr;
	dlp->ok_ack.dl_correct_primitive = correct_primitive;
	qreply(wq, mp);
}

dlerrorack(wq, mp, error_primitive, errno, unix_errno)
queue_t	*wq;
mblk_t	*mp;
u_long	error_primitive;
u_long	errno;
u_long	unix_errno;
{
	register	union	DL_primitives	*dlp;

	if ((mp = mexchange(wq, mp, sizeof (dl_error_ack_t), M_PCPROTO,
		DL_ERROR_ACK)) == NULL)
		return;
	dlp = (union DL_primitives *) mp->b_rptr;
	dlp->error_ack.dl_error_primitive = error_primitive;
	dlp->error_ack.dl_errno = errno;
	dlp->error_ack.dl_unix_errno = unix_errno;
	qreply(wq, mp);
}

int
ddi_get_instance(dip)
dev_info_t	*dip;
{
	return (dip->devi_unit);
}

#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<<<<<<  DEVICE DEPENDENT  >>>>>>>>>>>>>>>>>>>>>>>>>*/

#define SRC		0x10	/* Status Register C */

#ifdef SYSV

static int
yyintr(yyp)
register yy_t	*yyp;
{
	int		serviced=0;

	mutex_enter(&yyp->intrlock);
	serviced = chip_intr(yyp);
	mutex_exit(&yyp->intrlock);
	return(serviced);
}

#else SYSV

static int
yyintr()
{
	yy_t	*yyp;
	int		unit;
	int		serviced=0;
	int		s;

	s = splimp();
	for (unit=0; unit<yy_units; unit++) {
		yyp = &yy_varp[unit];
		serviced |= chip_intr(yyp);
	}
	splx(s);
	return(serviced);
}

#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<  AUTOCONFIGURATION  SUPPORT  >>>>>>>>>>>>>>>>>>>>*/

#ifdef SYSV

static int
yyidentify(dip)
dev_info_t	*dip;
{
	if (strcmp(ddi_get_name(dip), yy_devname) == 0) {
		if (yydebug)
			cmn_err(CE_CONT, "yyidentify: %s identified\n", yy_devname);
		yy_units++;
		return (DDI_IDENTIFIED);
	}
	else
		return (DDI_NOT_IDENTIFIED);
}

static int
yyattach(dip, cmd)
dev_info_t			*dip;
ddi_attach_cmd_t	cmd;
{
	register yy_t		*yyp;
	register yy_t		*yyprevp;
	static int			unit = 0;
	int nregs;

	if (yydebug)
		cmn_err(CE_CONT, "yyattach: dip=%x cmd=%x\n", dip, cmd);

	if (cmd != DDI_ATTACH) {
		cmn_err(CE_CONT, "yyattach: DDI_ATTACH failed\n");
		return (DDI_FAILURE);
	}

	/* if yy_varp is null, than this is the first time thru. */
	if (yy_varp == NULL) {
		/* One time only driver initializations. */
		rw_init(&yystrlock, "yy streams linked list lock", RW_DRIVER, (void *) -1);
		mutex_init(&yyopslock, "yyops lock", MUTEX_DRIVER, (void *) -1);
 		yy_varp = GETSTRUCT(yy_t, yy_units);
		if (yy_varp == NULL) {
			yyerror(dip, "yyattach:  kmem_alloc failed for yy_varp");
			return (DDI_FAILURE);
		}
	}

	yyp = &yy_varp[unit];

#ifdef DMA
	/* Reject this device if it's a Bus Master in a slave-only slot. */
	if (ddi_slaveonly(dip) == DDI_SUCCESS) {
		yyerror(dip, "device in slave only slot");
		return (DDI_FAILURE);
	}
#endif DMA

	if (ddi_dev_nregs(dip, &nregs) == DDI_FAILURE) {
		yyerror(dip, "ddi_map_regs: ddi_dev_nregs");
		return (DDI_FAILURE);
	}

	if (nregs == 1) {

		/* Map in the device registers. */
		if (ddi_map_regs(dip, 0, (caddr_t *) &yyp->eprom, 
			yy_epromoffset, yy_epromsize + yy_portsize)) {
			yyerror(dip, "ddi_map_regs: yyp->eprom failed");
			return (DDI_FAILURE);
		}

		if (ddi_map_regs(dip, 0, (caddr_t *) &yyp->port, 
			yy_portoffset, yy_portsize)) {
			yyerror(dip, "ddi_map_regs: yyp->reg failed");
			return (DDI_FAILURE);
		}

		if (ddi_map_regs(dip, 0, (caddr_t *) &yyp->reg, 
			yy_regoffset, yy_regsize)) {
			yyerror(dip, "ddi_map_regs: yyp->reg failed");
			return (DDI_FAILURE);
		}

		yyp->hw_addr = (caddr_t) yyp->eprom;

	} else if (nregs == 3) {

		if (ddi_map_regs(dip, 0, (caddr_t *) &yyp->eprom, 0, 0)) {
			yyerror(dip, "ddi_map_regs: yyp->eprom failed");
			return (DDI_FAILURE);
		}
		if (ddi_map_regs(dip, 1, (caddr_t *) &yyp->port, 0, 0)) {
			yyerror(dip, "ddi_map_regs: yyp->port failed");
			return (DDI_FAILURE);
		}
		if (ddi_map_regs(dip, 2, (caddr_t *) &yyp->reg, 0, 0)) {
			yyerror(dip, "ddi_map_regs: yyp->reg failed");
			return (DDI_FAILURE);
		}
		yyp->hw_addr = (caddr_t) yyp->eprom;
	} else {
		yyerror(dip, "ddi_map_regs: invalid nregs=%d", nregs);
		return (DDI_FAILURE);
	}

	/* attach interrupts vectors */
	if (ddi_add_intr(dip, 0, &yyp->dic, 0, (u_int (*)()) yyintr, (caddr_t) yyp)) {
		yyerror(dip, "ddi_add_intr failed");
		return (DDI_FAILURE);
	}

	/* Initialize mutex's for this device. */
	mutex_init(&yyp->xmitlock, "yy xmit lock", 
				MUTEX_DRIVER, (void *) yyp->dic);
	mutex_init(&yyp->intrlock, "yy intr lock", 
				MUTEX_DRIVER, (void *) yyp->dic);
	mutex_init(&yyp->buflock, "yy bufs lock", 
				MUTEX_DRIVER, (void *) yyp->dic);

	if (yydebug)
		cmn_err(CE_CONT, "yyattach: map hw_addr=%x unit=%x\n", yyp->hw_addr, unit);

	/* At this point, we are really there. */
	ddi_set_driver_private(dip, (caddr_t) yyp);

	yyp->dip = dip;
	yyp->unit = unit;
	if (unit) {
		yyprevp = &yy_varp[unit-1];
		yyprevp->nextp = yyp;
	}
	unit++;

#ifdef LATER
	/*
	 * Look for "yyarg" property and call yyopsadd() with the info
	 * from our parent node if we find it.
	 */
	yyop = (yyops_t *) ddi_getprop(DDI_DEV_T_NONE,
						ddi_get_parent(dip), 0, "yyarg", 0);
	if (yyop)
		yyopsadd(yyop);
#endif LATER

	if (ddi_create_minor_node(dip, YYNAME, S_IFCHR,
			ddi_get_instance(dip), DDI_NT_NET, CLONE_DEV) == DDI_FAILURE) {
		ddi_remove_minor_node(dip, NULL);
		yyerror(dip, "ddi_create_minor_node failed");
		return (DDI_FAILURE);
	}

#ifdef SYSV
	/*
	yystatinit(yyp);
	*/
#endif SYSV

	ddi_report_dev(dip);

	/* Init the board */
	yyinit(yyp);

	return(DDI_SUCCESS);
}

static int
yydetach(dip, cmd)
dev_info_t			*dip;
ddi_detach_cmd_t	cmd;
{
	register yy_t		*yyp;
	register int		i;

	if (yydebug)
		cmn_err(CE_CONT, "yydetach\n");

	if (cmd != DDI_DETACH) {
		cmn_err(CE_CONT, "yydetach: DDI_DETACH failed\n");
		return (DDI_FAILURE);
	}

	if (!yy_varp) 
		return(DDI_SUCCESS);

	rw_destroy(&yystrlock);
	mutex_destroy(&yyopslock);
	for (i=0; i<yy_units; i++) {
		int nregs;
		yyp = &yy_varp[i];
		if (ddi_dev_nregs(dip, &nregs) == DDI_FAILURE) {
			cmn_err(CE_CONT, "yydetach: ddi_dev_nregs failed\n");
			return (DDI_FAILURE);
		}
		if (nregs == 1) {
			ddi_unmap_regs(yyp->dip, 0, (caddr_t *) &yyp->eprom, 
				yy_epromoffset, yy_epromsize);
			ddi_unmap_regs(yyp->dip, 0, (caddr_t *) &yyp->port, 
				yy_portoffset, yy_portsize);
			ddi_unmap_regs(yyp->dip, 0, (caddr_t *) &yyp->reg, 
				yy_regoffset, yy_regsize);
		} else {
			ddi_unmap_regs(yyp->dip, 0, 
				(caddr_t *) &yyp->eprom, 0, 0);
			ddi_unmap_regs(yyp->dip, 1, 
				(caddr_t *) &yyp->port, 0, 0);
			ddi_unmap_regs(yyp->dip, 2, 
				(caddr_t *) &yyp->reg, 0, 0);
		}

		mutex_destroy(&yyp->xmitlock);
		mutex_destroy(&yyp->intrlock);
		mutex_destroy(&yyp->buflock);
	}

	if ((yy_varp != NULL) && (yy_units > 0)) {
		kmem_free(yy_varp, sizeof(yy_t) * yy_units);
		yy_varp = NULL;
	}

	ddi_remove_minor_node(dip, NULL);
	return(DDI_SUCCESS);
}

/* Translate "dev_t" to a pointer to the associated "dev_info_t". */
int
yyinfo(dip, infocmd, arg, result)
dev_info_t		*dip;
ddi_info_cmd_t	infocmd;
void			*arg;
void			**result;
{
	dev_t		dev = (dev_t) arg;
	int			instance, rc;
	yystr_t		*yystrp;

	if (yydebug )
		cmn_err(CE_CONT, "yyinfo: dip=%x infocmd=%x arg=%x result=%x\n",
					dip, infocmd, arg, result);

	instance = getminor(dev);

	switch (infocmd) {
	case DDI_INFO_DEVT2DEVINFO:
		rw_enter(&yystrlock, RW_READER);
		dip = NULL;
		for (yystrp = yystrlstp; yystrp; yystrp = yystrp->nextp)
			if (yystrp->minordev == instance)
				break;

		if (yystrp && yystrp->yyp)
			dip = yystrp->yyp->dip;

		rw_exit(&yystrlock);

		if (dip) {
			*result = (void *) dip;
			rc = DDI_SUCCESS;
		} 
		else
			rc = DDI_FAILURE;
		break;

	case DDI_INFO_DEVT2INSTANCE:
		*result = (void *) instance;
		rc = DDI_SUCCESS;
		break;

	default:
		rc = DDI_FAILURE;
		break;
	}
	return (rc);
}

#else SYSV

/*
 *
 * ARGS:	
 *		name	A pointer to string which is device name as fetched
 *				from the PROM on the SBus card or from some other
 *				source in the case of a virtual device.
 *
 * RETURN VALUE:	
 *		1 on successful match and acceptance,
 *		0 on reject the mission.
 */
static int
yyidentify(name)
register char	*name;
{
	if (strcmp(name, yy_devname) == 0) {
		yy_units++;		/* count the number of interfaces */
		return(1);
	}
	else {
		return(0);
	}
}

/*
 *
 * ARGS:	
 *		devinfo	A pointer to the devinfo structure that
 *				gives access to (among other things) the
 *				name and unit number.
 *
 * RETURN VALUE:		
 *		0 on success, 
 *		-1 on failure.
 */
static int
yyattach(dip)
register dev_info_t	*dip;
{
	register yy_t	*yyp;
	register yy_t	*yyprevp;
	static int 		unit = 0;
	register int	slot;

	/* if yy_varp is null, than this is the first time thru. */
	if (yy_varp == NULL) {
		yy_varp = GETSTRUCT(yy_t, yy_units);
		if (yy_varp == NULL) {
			cmn_err(CE_CONT, "yy: no space for structures\n");
			return (-1);
		}
	}

	yyp = &yy_varp[unit];

#ifdef DMA
	/* Reject this device if it's a Bus Master in a slave-only slot. */
	slot = slaveslot(dip->devi_reg->reg_addr);
	if (slot >= 0) {
		cmn_err(CE_CONT, "yy%d: not used - SBus slot %d is slave-only\n", 
				unit, slot);
		return (-1);
	}
#endif DMA
	/* map in the device registers */
	if (dip->devi_nreg == 1) {

		yyp->eprom = (u_char *) map_regs( dip->devi_reg->reg_addr,
		    		yy_epromsize, dip->devi_reg->reg_bustype);

		yyp->port = (u_char *) map_regs(
				(dip->devi_reg->reg_addr + yy_portoffset),
		    		yy_portsize, dip->devi_reg->reg_bustype);

		yyp->reg = (u_char *) map_regs(
				 (dip->devi_reg->reg_addr + yy_regoffset),
		    		yy_regsize, dip->devi_reg->reg_bustype);

		yyp->hw_addr = (caddr_t) yyp->eprom;
	} else if (dip->devi_nreg == 3) {
		
		yyp->eprom = (u_char *) map_regs( dip->devi_reg[0].reg_addr,
		    		dip->devi_reg[0].reg_size, 
				dip->devi_reg[0].reg_bustype);
		yyp->port = (u_char *) map_regs( dip->devi_reg[1].reg_addr,
		    		dip->devi_reg[1].reg_size, 
				dip->devi_reg[1].reg_bustype);
		yyp->reg = (u_char *) map_regs( dip->devi_reg[2].reg_addr,
		    		dip->devi_reg[2].reg_size, 
				dip->devi_reg[2].reg_bustype);
		yyp->hw_addr = (caddr_t) yyp->eprom;

	} else {
		cmn_err(CE_CONT, "yy%d: bad register specification\n", unit);
		yy_free_units();
		return (-1);
	} 

	/* attach interrupts vectors */
	if (dip->devi_nintr) {
		addintr(dip->devi_intr->int_pri, yyintr, dip->devi_name, unit);
#ifdef LATER
		adddma(dip->devi_intr->int_pri);
#endif LATER
	}

	dip->devi_data = (caddr_t) yyp;
	dip->devi_unit = unit;

	yyp->dip = dip;
	yyp->unit = unit;
	if (unit) {
		yyprevp = &yy_varp[unit-1];
		yyprevp->nextp = yyp;
	}
	unit++;

	/* tell the world we're here */
	report_dev(dip);

	/* Reset the board */
	yyinit(yyp);

	return (0);
}

/*
 * Free the unit (control) structures.
 *
 * ARGS:			None.
 *
 * RETURN VALUE:	Error code
 */
int
yy_free_units()
{
	register int		unit;
	register yy_t		*yyp;

	for (unit=0; unit<yy_units; unit++) {
		yyp = &yy_varp[unit];

		yyreset(yyp);	

		if (yyp->hw_addr) {
			/*unmap_regs(yyp->eprom, yy_epromsize);*/
			unmap_regs(yyp->eprom, yy_epromsize+yy_portsize);
			/*unmap_regs(yyp->port, yy_portsize);*/
			unmap_regs(yyp->reg, yy_regsize);
		}

		remintr(yyp->dip->devi_intr->int_pri, yyintr);
	}

	if ((yy_varp != NULL) && (yy_units > 0)) {
		kmem_free(yy_varp, sizeof(yy_t) * yy_units);
		yy_varp = NULL;
	}

	return(0);
}
#endif SYSV

/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<  IOCTL SUPPORT >>>>>>>>>>>>>>>>>>>>>>>>>>*/

yypoke(yyp, cmdp)
register yy_t		*yyp;
register pokecmd_t	*cmdp;
{
	caddr_t		regp;

	if (yydebug)
		cmn_err(CE_CONT, "yypoke: yyp=%x cmdp=%x\n", yyp, cmdp);

	if (yydebug)
		cmn_err(CE_CONT, "cmd=%x chip=%x offset=%x data=%x\n",
			cmdp->cmd, cmdp->chip, cmdp->offset, cmdp->data);

	if (yyp == 0) {
		if (yydebug)
			cmn_err(CE_CONT, "yyp=0\n");
		return;
	}

	switch (cmdp->chip) {
	case EPROM:
		regp = (caddr_t) yyp->eprom;
		regp += cmdp->offset;
	/* cmdp->data &= 0x000000ff; */
		if (cmdp->cmd == READ)
			READ_REG(regp, cmdp->data);
		else if (cmdp->cmd == WRITE)
			WRITE_REG(regp, cmdp->data);
		break;
	case PORT:
		regp = (caddr_t) yyp->eprom;
		regp += cmdp->offset;
	/*	cmdp->data &= 0x000000ff; */
		if (cmdp->cmd == READ)
			READ_REG(regp, cmdp->data);
		else if (cmdp->cmd == WRITE)
			WRITE_REG(regp, cmdp->data);
		break;
	case REG:
		regp = (caddr_t) yyp->reg;
		regp += cmdp->offset;
		if ((int) regp & 3) {
			cmn_err(CE_CONT, "only word access is allowed\n");
			return;
		}
		if (cmdp->cmd == READ)
			READ_REG(regp, cmdp->data);
		else if (cmdp->cmd == WRITE)
			WRITE_REG(regp, cmdp->data);
		break;
	}

	if (yydebug)
		cmn_err(CE_CONT, "regp=%x cmd=%x chip=%x offset=%x data=%x\n",
			regp, cmdp->cmd, cmdp->chip, cmdp->offset, cmdp->data);

}

static void
yyioctl(wq, mp)
register queue_t	*wq;
register mblk_t		*mp;
{
	register struct	iocblk	*iocp = (struct iocblk *) mp->b_rptr;
	register yystr_t		*yystrp = (yystr_t *) wq->q_ptr;
	register yyhdr_t		*yyhdrp;

	if (yydebug)
		cmn_err(CE_CONT, "yyioctl: wq=%x cmd=%x\n", wq, iocp->ioc_cmd);

	switch (iocp->ioc_cmd) {
	case DL_IOC_YY:		/* Generic YY IOCTL */
		if (yydebug)
			cmn_err(CE_CONT, "yyioctl: DL_IOC_YY\n");

		yyhdrp = (yyhdr_t *) mp->b_cont->b_rptr;
		switch (yyhdrp->cmd) {
			case YY_POKE:
				yypoke(yystrp->yyp, mp->b_cont->b_rptr);
				mp->b_datap->db_type = M_IOCACK;
				qreply(wq, mp);
				break;

			default:
				if (yydebug)
					cmn_err(CE_CONT, "yyioctl: DL_IOC_FDG: default\n");
				miocnak(wq, mp, 0, EINVAL);
				break;
		}
		break;

	default:
		if (yydebug)
			cmn_err(CE_CONT, "yyioctl: default %x\n", iocp->ioc_cmd);
		miocnak(wq, mp, 0, EINVAL);
		break;
	}
}

/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<  DLPI SUPPORT >>>>>>>>>>>>>>>>>>>>>>>>>>>*/

static void
yyattachreq(wq, mp)
register queue_t	*wq;
register mblk_t		*mp;
{
	register union	DL_primitives	*dlp;
	register yystr_t	*yystrp;
	register yy_t		*yyp;
	register int		ppa;

	yystrp = (yystr_t *) wq->q_ptr;
	dlp = (union DL_primitives *) mp->b_rptr;
	ppa = dlp->attach_req.dl_ppa;

	if (yydebug)
		cmn_err(CE_CONT, "yyattachreq: wq=%x ppa=%x\n", wq, ppa);

	if (MBLKL(mp) < DL_ATTACH_REQ_SIZE) {
		dlerrorack(wq, mp, DL_ATTACH_REQ, DL_BADPRIM, 0);
		return;
	}

	if (yystrp->state != DL_UNATTACHED) {
		dlerrorack(wq, mp, DL_ATTACH_REQ, DL_OUTSTATE, 0);
		return;
	}

	/* Valid ppa (unit number)? */
	for (yyp = yy_varp; yyp; yyp = yyp->nextp)
		if (ddi_get_instance(yyp->dip) == ppa)
			break;
	if (yyp == NULL) {
		dlerrorack(wq, mp, dlp->dl_primitive, DL_BADPPA, 0);
		return;
	}

	/* Has device been initialized?  Do so if necessary. */
	if ((yyp->flags & RUNNING) == 0) {
		if (yyinit(yyp)) {
			dlerrorack(wq, mp, dlp->dl_primitive, DL_INITFAILED, 0);
			return;
		}
	}

	/* Point to attached device and update our state. */
	yystrp->yyp = yyp;
	yystrp->state = DL_UNBOUND;

	dlokack(wq, mp, DL_ATTACH_REQ);
}

static void
yydetachreq(wq, mp)
register queue_t	*wq;
register mblk_t		*mp;
{
	register yystr_t	*yystrp;

	if (yydebug)
		cmn_err(CE_CONT, "yydetachreq: wq=%x\n", wq);

	yystrp = (yystr_t *) wq->q_ptr;

	if (MBLKL(mp) < DL_DETACH_REQ_SIZE) {
		dlerrorack(wq, mp, DL_DETACH_REQ, DL_BADPRIM, 0);
		return;
	}

	if (yystrp->state != DL_UNBOUND) {
		dlerrorack(wq, mp, DL_DETACH_REQ, DL_OUTSTATE, 0);
		return;
	}

	yydodetach(yystrp);
	dlokack(wq, mp, DL_DETACH_REQ);
}

static void
yyproto(wq, mp)
register queue_t	*wq;
register mblk_t		*mp;
{
	union	DL_primitives	*dlp;
	register yystr_t		*yystrp;
	register u_long			prim;

	if (yydebug)
		cmn_err(CE_CONT, "yyproto: wq=%x mp=%x\n", wq, mp);

	yystrp = (yystr_t *) wq->q_ptr;
	dlp = (union DL_primitives*) mp->b_rptr;
	prim = dlp->dl_primitive;

#ifdef SYSV
	mutex_enter(&yystrp->lock);
#endif SYSV

	switch (prim) {
		case DL_ATTACH_REQ:
			yyattachreq(wq, mp);
			break;

		case DL_DETACH_REQ:
			yydetachreq(wq, mp);
			break;

		default:
			if (yydebug )
				cmn_err(CE_CONT, "yyproto: wq=%x prim=%x\n", wq, prim);
			dlerrorack(wq, mp, prim, DL_UNSUPPORTED, 0);
			break;
	}

#ifdef SYSV
	mutex_exit(&yystrp->lock);
#endif SYSV
}

/*<<<<<<<<<<<<<<<<<<<<<  DRIVER ENTRY POINTS  >>>>>>>>>>>>>>>>>>>>>>>>>>*/

int
#ifdef SYSV
yyopen(rq, devp, flag, sflag)
queue_t		*rq;
dev_t		*devp;
int			flag;
int			sflag;
{
#else SYSV
yyopen(rq, dev, flag, sflag)
queue_t		*rq;
dev_t		dev;
int			flag;
int			sflag;
{
	register dev_t		*devp = &dev;
#endif SYSV
	register yystr_t	*yystrp;
	register yystr_t	**prevyystrp;
	int					minordev;

	if (yydebug)
		cmn_err(CE_CONT, "yyopen: rq=%x devp=%x flag=%x sflag=%x wq=%x\n",
						rq, devp, flag, sflag, WR(rq));

	ASSERT(rq);
	ASSERT(sflag != MODOPEN);

	/* Serialize all driver open and closes. */

#ifdef SYSV
	rw_enter(&yystrlock, RW_WRITER);
#endif SYSV

	/* Determine minor device number. */
	prevyystrp = &yystrlstp;
	if (sflag == CLONEOPEN) {
		minordev = 0;
		for (; (yystrp = *prevyystrp); prevyystrp = &yystrp->nextp) {
			if (minordev < yystrp->minordev)
				break;
			minordev++;
		}
		*devp = makedevice(getmajor(*devp), minordev);
	} 
	else {
		minordev = getminor(*devp);
	}

	if (rq->q_ptr) {	/* already open */
#ifdef SYSV
		rw_exit(&yystrlock);
		qprocson(rq);
#endif SYSV
		return(0);
	}

	if ((yystrp = GETSTRUCT(yystr_t, 1)) == NULL) {
#ifdef SYSV
		rw_exit(&yystrlock);
		qprocson(rq);
#endif SYSV
		return(ENOMEM);
	}

	if (yydebug)
		cmn_err(CE_CONT, "yyopen: yystrp=%x minordev=%x\n", yystrp, minordev);

	yystrp->minordev = minordev;
	yystrp->rq = rq;
	yystrp->state = DL_UNATTACHED;
	yystrp->sap = 0;
	yystrp->flags = 0;
	yystrp->yyp = NULL;

#ifdef SYSV
	mutex_init(&yystrp->lock, "yy stream lock", MUTEX_DRIVER, (void *) 0);
#endif SYSV

	/*
	 * Link new entry into the list of active entries.
	 */
	yystrp->nextp = *prevyystrp;
	*prevyystrp = yystrp;

	rq->q_ptr = WR(rq)->q_ptr = (char *) yystrp;

	/* Disable our write-side service procedure. */
	noenable(WR(rq));

#ifdef SYSV
	rw_exit(&yystrlock);
	qprocson(rq);
#endif SYSV

	return(0);
}

int
yyclose(rq)
queue_t		*rq;
{
	register yystr_t	*yystrp;
	register yystr_t	**prevyystrp;

	if (yydebug)
		cmn_err(CE_CONT, "yyclose: rq=%x wq=%x\n", rq, WR(rq));

	ASSERT(rq);
	ASSERT(rq->q_ptr);

#ifdef SYSV
	qprocsoff(rq);
#endif SYSV

	yystrp = (yystr_t *) rq->q_ptr;

#ifdef SYSV
	rw_enter(&yystrlock, RW_WRITER);

	/* Implicit detach Stream from interface. */
	if (yystrp->yyp) {
		yydodetach(yystrp);
	}

	/* Unlink the per-Stream entry from the active list and free it. */
	for (prevyystrp = &yystrlstp; (yystrp = *prevyystrp); prevyystrp = &yystrp->nextp)
		if (yystrp == (yystr_t *) rq->q_ptr)
			break;

	ASSERT(yystrp);
	*prevyystrp = yystrp->nextp;

	mutex_destroy(&yystrp->lock);
	kmem_free((char *) yystrp, sizeof(yystr_t));
	rw_exit(&yystrlock);
#else SYSV
	/* The last close */
	for (; yystrlstp; yystrlstp = yystrlstp->nextp) {
		yystr_t		*yystrp;
		yystrp = yystrlstp;
		yydodetach(yystrp);
		kmem_free((char *) yystrp, sizeof(yystr_t));
	}
#endif SYSV

	rq->q_ptr = WR(rq)->q_ptr = NULL;

	return (0);
}

yywput(wq, mp)
register queue_t	*wq;
register mblk_t		*mp;
{
	register yystr_t	*yystrp = (yystr_t *) wq->q_ptr;
	register yy_t		*yyp = yystrp->yyp;
	register char		c=*mp->b_rptr;

	if (yydebug)
		cmn_err(CE_CONT, "yywput: wq=%x\n", wq);

	ASSERT(wq);
	ASSERT(mp);

	switch (DB_TYPE(mp)) {
	case M_DATA:
		outchar(yyp, c);
		freemsg(mp);
		break;

	case M_PROTO:
	case M_PCPROTO:
		yyproto(wq, mp);
		break;

	case M_IOCTL:
		yyioctl(wq, mp);
		break;

	case M_FLUSH:
		if (*mp->b_rptr & FLUSHW) {
			flushq(wq, FLUSHALL);
			*mp->b_rptr &= ~FLUSHW;
		}
		if (*mp->b_rptr & FLUSHR) {
			flushq(RD(wq), FLUSHALL);
			qreply(wq, mp);
		}
		else
			freemsg(mp);
		break;

	default:
		freemsg(mp);
		break;
	}
}

yywsrv(wq)
register queue_t	*wq;
{
	if (yydebug)
		cmn_err(CE_CONT, "yywsrv: wq=%x\n", wq);
}

yyrsrv(rq)
register queue_t	*rq;
{
	mblk_t	*mp;

	if (yydebug)
		cmn_err(CE_CONT, "yyrsrv: rq=%x\n", rq);

	while (canput(rq->q_next) && (mp = getq(rq)))
		putnext(rq, mp);
}

/*<<<<<<<<<<<<<<<<<<<<<<<<<<  LOADABLE SUPPORT >>>>>>>>>>>>>>>>>>>>>>>>>*/
#ifdef LOADABLE

#ifdef SYSV
#include <sys/modctl.h>

/* Driver */
extern struct mod_ops	mod_driverops;
static struct modldrv modldrv = {
	&mod_driverops,			/* Type of module.  This one is a driver */
	"YY Driver v1.1",
	&yy_ops,				/* driver ops */
};
static struct modlinkage modlinkage = {
	MODREV_1, (void *) &modldrv, NULL
};

_init()
{ 
	if (yydebug)
		cmn_err(CE_CONT, "_init\n");
	return (mod_install(&modlinkage));  
}

_fini()
{
	if (yydebug)
		cmn_err(CE_CONT, "_fini\n");
	return(mod_remove(&modlinkage));
}

_info(modinfop)
struct modinfo *modinfop;
{
	if (yydebug)
		cmn_err(CE_CONT, "_info\n");
	return (mod_info(&modlinkage, modinfop));
}

#else SYSV

#include <sun/vddrv.h>

int
yy_load()
{
	return(0);
}

int
yy_unload()
{
	int		rc=0;

	rc = yy_free_units();
	if (rc == 0) {
		if (yydebug)
			cmn_err(CE_CONT, "yyunload\n");
	}
	return(rc);

}

extern int		nulldev();
extern int		seltrue();

/*
 * Character device entry points for this driver.
 * These are in cdevsw[] in sun/conf.c for preconfigured drivers.
 */
struct cdevsw yy_cdevsw = {
	nulldev,    nulldev,    nulldev,    nulldev,
	nulldev,    nulldev,    seltrue,    yy_mmap,    &yy_info
};

/*
 * The vd driver is a non loadable pseudo driver that loads loadable
 * modules. The following initialized structure is used by the vd driver
 * to locate entry points and data when loading and configuring the 
 * loadable driver. The fields are explained below.
 *
 * VDMAGIC_DRV is the magic number in the Drv_magic field that tells
 * the vd driver that this loadable module is a character device driver.
 *
 * Drv_name is a pointer to a string which is the name of the driver.
 *
 * Drv_dev_ops is a pointer to the dev_ops structure defined in
 * sun/openprom.h which contains all of the entry points to driver
 * routines which are known outside of the driver. Generally the driver
 * is responsible for having the dev_ops structure initialized. 
 *
 * The address of Drv_bdevsw can be NULL if there is no block device
 * for this driver.
 *
 * The address of Drv_cdevsw can be NULL if there is no character device
 * for this driver.
 *
 * If the driver has a preconfigured location in the bdevsw or cdevsw
 * structures, then that location index for the bdevsw goes in
 * Drv_blockmajor, and that location index for the cdevsw goes in
 * Drv_charmajor. This is the case for all devices that are already
 * supported by sun/conf.c.
 *
 * For drivers that do not have a preconfigured location in the bdevsw,
 * Drv_blockmajor should be 0, and the system will choose a major device
 * number (location index) when the module is loaded by the vd driver.
 *
 * For drivers that do not have a preconfigured location in the cdevsw,
 * Drv_charmajor should be 0, and the system will choose a major device
 * number (location index) when the module is loaded by the vd driver.
 */
struct vdldrv yy_drv = {
	VDMAGIC_DRV,		/* Drv_magic		*/
	yy_devname,			/* *Drv_name		*/
	&yy_ops,			/* *Drv_dev_ops		*/
	NULL,				/* *Drv_bdevsw		*/
	&yy_cdevsw,			/* *Drv_cdevsw		*/
	0,					/* Drv_blockmajor	*/
	0					/* Drv_charmajor	*/
};

/*
 * yy_vdcmd -- Support for a loadable device driver.
 *		 Required by the utilities modload modstat & modunload.
 *
 * The vd driver is a non loadable pseudo driver that loads loadable
 * modules. The vd driver is used by modload modstat & modunload.
 * All loadable modules are required to supply a routine that is
 * called by the vd driver when a module is loaded, unloaded, or the
 * object of a VDSTAT status request ioctl on the vd driver. On the
 * modload man page this routine is referred to as the entry point.
 * Note that the default entry point name "xxxinit()" should never be
 * used, as the names will collide if two or more drivers use this name.
 *
 * ARGS:
 *
 * The command arg identifies why this module was called. During loading
 * (command == VDLOAD) the driver should do any initialization that it
 * wants to do, and then fill in the linkage pointer as shown below.
 * Before unloading (command == VDUNLOAD) the driver is called to
 * determine if it's ok to be unloaded and to allow the driver to do
 * any cleanup that it needs to do. During a status request
 * (command == VDSTAT) the driver is called to fill in any type specific
 * information into vds_modinfo.
 *
 * The vddrv structure is where the vd driver (think of it as the kernel)
 * collects all information about a loaded module. The driver being loaded
 * will fill in vddrv.vdd_vdtab, which is a pointer to the vdldrv structure
 * initialized above. Since this pointer is not passed to the kernel until
 * the VDLOAD command is handled by this interface routine, these
 * initializations need not be static.
 *
 * The vdi arg is a pointer to one of the following structures:
 *	If the command is VDLOAD:
 *		The vdioctl_load structure contains configuration
 *		information if any was passed in from modload.
 *	If the command is VDUNLOAD:
 *		The vdioctl_unload structure contains only the module id.
 *	If the command is VDSTAT:
 *		The vdioctl_stat structure contains hooks to allow you
 * 		to build an elaborate status function if you wish.
 *
 * The vds arg is a pointer to a status structure that may be filled in
 * when the command is VDSTAT. This pointer is NULL when command has
 * a value other than VDSTAT.
 *
 * For more information see /usr/include/sun/vddrv.h.
 *
 * RETURN VALUE:		0 on success, an errno value on error.
 */

/*ARGSUSED*/
sliceb_vdcmd(command, vdp, vdi, vds)
int					command;/* Identify why module called   */
struct vddrv		*vdp;	/* Pointer to kernel's struct.  */
struct vdioctl_load	*vdi;	/* pointer to struct vdioctl_*  */
struct vdstat		*vds;	/* ID and status information    */
{
	int				status = 0;

	switch (command) {
	case VDLOAD:
		/*
		 * Fill in pointer to the vdldrv structure,
		 * which must be already initialized at this point.
		 */
		vdp->vdd_vdtab = (struct vdlinkage *) &yy_drv;
		status = yy_load();
		break;

	case VDUNLOAD:
		status = yy_unload();
		break;

	case VDSTAT:
		break;

	default:
		status = EINVAL;
		break;
	}

	return (status);
}

#endif SYSV
#endif LOADABLE

#ifdef SYSV
yy_mmap(dev, off, prot)
dev_t dev;
off_t off;
int prot;
{
	int i = -1;
	if (minor(dev) > yy_units)
		return(-1);

	if (off > yy_regsize)
		return(-1);

/*
	i = hat_getkpfnum((caddr_t)(yy_varp[minor(dev)].reg + ddi_btop(off)));
*/

	if (yydebug) printf("yy_mmap: off=0x%x, dev=%d, hat=0x%x\n",
		off, minor(dev), i);

	return(i);

}
#else
yy_mmap(dev, off, prot)
dev_t dev;
off_t off;
int prot;
{
	int i;
	if (minor(dev) > yy_units)
		return(-1);

	/* 01/08/97 jbabb@mit.edu: if <=regsize, map to regs, (slic gui),
                                   else to ports or regs (raw interface),
                                   never to eprom! */

	if (off > yy_regsize)
	  if (off > yy_epromsize + yy_portsize + yy_regsize || 
	      off < yy_epromsize)	    
	    return(-1);	 
	
	if (off <= yy_regsize)
	  i = (hat_getkpfnum(yy_varp[minor(dev)].reg + btop(off)));
	else 
	  if (off < yy_regoffset)
	    i = (hat_getkpfnum(yy_varp[minor(dev)].port + btop(off)));
	  else
	    i = (hat_getkpfnum(yy_varp[minor(dev)].reg 
			       + btop(off-yy_regoffset)));
	
	if (yydebug) printf("yy_mmap: off=0x%x, dev=%d, hat=0x%x\n",
		off, minor(dev), i);

	return(i);

}
#endif
