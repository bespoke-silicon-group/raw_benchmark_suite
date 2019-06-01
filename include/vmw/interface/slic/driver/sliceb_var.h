/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)yyvar.h 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

typedef struct yy			yy_t;
typedef struct yystr		yystr_t;

#ifdef SYSV
typedef struct yyops		yyops_t;
typedef struct yystat		yystat_t;
#else
typedef struct dev_info		dev_info_t;
#endif SYSV

#define MAXYY	0x10

#define YYIDNUM		(86)		/* module ID number */
#define YYNAME		"sliceb"	/* module name */
#define YYMINPSZ	(0)			/* min packet size */
#define YYMAXPSZ	1500		/* max packet size */
#define YYHIWAT		(1)			/* hi-water mark */
#define YYLOWAT		(1)			/* lo-water mark */

#define IFNET_YYMTU	1500

/* flags */
#define	RUNNING		0x01	/* chip is initialized */
#define	PROMISC		0x02	/* promiscuous mode enabled */
#define	MULTI		0x04	/* multicast mode enabled */
#define	SUN4C		0x08	/* hack for sun4c */

/* per stream flags */
#define SLFAST      0x01    /* "M_DATA fastpath" mode */
#define	SLRAW		0x02	/* M_DATA raw xmit/recv */
#define	SLALLPHYS	0x04	/* we enabled promiscuous mode */
#define	SLALLMULTI	0x08	/* Receive all multicasts */
#define	SLALLSAP	0x10	/* Receive all ether type vaules */

/* Maximum valid sap (ethernet type) value. */
#define	YYMAXSAP	(0xffff)

/* Maximum # of multicast addresses per Stream. */
#define	YYMAXMC	64
#define	YYMCALLOC	(YYMAXMC * sizeof (struct ether_addr))

/* Full DLSAP address length (in struct dladdr format). */
#define	YYADDRL	(sizeof (u_short) + ETHERADDRL)


/*
 * Per-Stream instance state information.
 *
 * Each instance is dynamically allocated at open() and free'd
 * at close().  Each per-Stream instance points to at most one
 * per-device structure using the yyp field.  All instances
 * are threaded together into one list of active instances
 * ordered on minor device number.
 */
struct yystr {
	yystr_t			*nextp;		/* next in list */
	queue_t			*rq;		/* pointer to our rq */
	u_long			minordev;	/* minor device number */
	u_long			state;		/* current DL state */
	u_long			sap;		/* bound sap */
	u_long			flags;		/* misc. flags */
	yy_t 			*yyp;		/* attached device */
#ifdef SYSV
	kmutex_t		lock;		/* protect this structure */
#endif SYSV
};

/*
 * Per-Device instance state information.
 * Each instance is dynamically allocated on first attach.
 */
struct yy {
	yy_t				*nextp;
	dev_info_t			*dip;
	int					unit;

	/* Hardware Address */
	caddr_t				hw_addr;
	u_char				*eprom;
	u_char				*port;
	u_char				*reg;

	/* Performance statistics counters */
	u_long	ipackets;	/* # packets received */
	u_long	ierrors;	/* # total input errors */
	u_long	opackets;	/* # packets sent */
	u_long	oerrors;	/* # total output errors */
	u_long	reset;		/* Number of resets */
	u_long	tx_abort;	/* Tx abort */
	u_long	tx_uflo;	/* Tx underruns */
	u_long	tx_full;	/* Tx buffer full */
	u_long	tx_notmds;	/* Tx out of tmds */
	u_long	rx_frmerr;	/* Rx frame error */
	u_long	rx_oflo;	/* Rx overflow */
	u_long	rx_full;	/* Rx buffer full */
	u_long	rx_notavail;/* Rx not available */
	u_long	rx_missed;	/* Rx out of rbufs */
	u_long	inits;		/* Number of inits */
	u_long	nocanput;	/* input canput() returned false */
	u_long	allocbfail;	/* esballoc/allocb failed */

	u_long	scpy;		/* Input copy small buffer operations */
	u_long	lcpy;		/* Input copy large buffer operations */
	u_long	loan;		/* loan buffer operations */
	u_long	loanret;	/* loan buffer return operations */
	u_long	cfreebuf;	/* Number of free buffers left currently */
	u_long	fastxmit;	/* Number of Fast/Raw xmits */
	u_long	fastrecv;	/* Number of Fast recv */
	u_long	rawrecv;	/* Number of raw recv */
	u_long	normrecv;	/* Number of normal recv */

	/* Error counters */
	u_long	errack;		/* SBus Error Acks */
	u_long	lateerr;	/* SBus Late Errors */
	u_long	masterparerr;	/* Master Parity Error */

	/* Miscellanous Flags */
	u_int   flags;

#ifdef SYSV
	/* DDI dma handle of IOPB area */
	ddi_dma_handle_t	iopbhandle1;	/* iopb dma handle */
	caddr_t				iopbkbase1;		/* kernel base of iopb area */
	caddr_t				iopbiobase1;	/* io base of iopb area */

	ddi_dma_handle_t	iopbhandle2;	/* iopb dma handle */
	caddr_t				iopbkbase2;		/* kernel base of iopb area */
	caddr_t				iopbiobase2;	/* io base of iopb area */

	ddi_dma_handle_t	iopbhandle3;	/* iopb dma handle */
	caddr_t				iopbkbase3;		/* kernel base of iopb area */
	caddr_t				iopbiobase3;	/* io base of iopb area */

	/* DDI dma handle of buffer area */
	ddi_dma_handle_t	bufhandle;	/* bufs dma handle */
	caddr_t				bufkbase;	/* kernel base of buf area */
	caddr_t				bufiobase;	/* io base of buf area */

	ddi_iblock_cookie_t	dic;

	kmutex_t			xmitlock;	/* protect xmit-side fields */
	kmutex_t			intrlock;	/* protect intr-side fields */
	kmutex_t			buflock;	/* protect private buffers */

	kstat_t				*kstatp;
#endif SYSV
};

#ifdef SYSV
/* "Export" a few of the error counters via the kstats mechanism. */
struct	yystat {
	kstat_named_t	ipackets;
	kstat_named_t	ierrors;
	kstat_named_t	opackets;
	kstat_named_t	oerrors;
	kstat_named_t	collisions;
	kstat_named_t	tx_abort;
	kstat_named_t	tx_uflo;
	kstat_named_t	tx_full;
	kstat_named_t	tx_notmds;
	kstat_named_t	rx_frmerr;
	kstat_named_t	rx_oflo;
	kstat_named_t	rx_full;
	kstat_named_t	rx_notavail;
	kstat_named_t	rx_missed;
	kstat_named_t	inits;
	kstat_named_t	nocanput;
	kstat_named_t	allocbfail;
};
#endif SYSV

extern int	yy_epromsize;
extern int	yy_portsize;
extern int	yy_regsize;

extern int yy_epromoffset;
extern int yy_portoffset;
extern int yy_regoffset;

extern int		yydebug;
extern yystr_t	*yystrlstp;

#ifdef SYSV
static krwlock_t    yystrlock;
#endif SYSV

#ifndef SYSV
#define CE_CONT		0
#include "dlpi.h"
#endif SYSV

/* Read & Write to Hardwire Registers */
#define READB_REG(regp, data)    data = *((u_char *)(regp))
#define WRITEB_REG(regp, data)   *((u_char *)(regp)) = (u_char)data

#define READ_REG(regp, data)    data = *((u_long *)(regp))
#define WRITE_REG(regp, data)   *((u_long *)(regp)) = (u_long)data
