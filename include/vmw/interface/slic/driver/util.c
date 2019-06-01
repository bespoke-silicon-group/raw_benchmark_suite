/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)util.c 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

#include <sys/types.h>
#include <sys/unistd.h>
#include <sys/stropts.h>
#include <sys/fcntl.h>
#include <sys/signal.h>

#ifdef SYSV
#include <sys/dlpi.h>
#include <sys/ethernet.h>
#else SYSV
#include "dlpi.h"
#endif SYSV

#define            MAXDLBUF        1024
#define            MAXWAIT         15

/* Primitives for Local Management Services */
char	*prim_msg[] = {
	"DL_INFO_REQ",
	"DL_BIND_REQ",
	"DL_UNBIND_REQ",
	"DL_INFO_ACK",
	"DL_BIND_ACK",
	"DL_ERROR_ACK",
	"DL_OK_ACK",
	"DL_UNITDATA_REQ",
	"DL_UNITDATA_IND",
	"DL_UDERROR_IND",
	"DL_UDQOS_REQ",
	"DL_ATTACH_REQ",
	"DL_DETACH_REQ",
	"DL_CONNECT_REQ",
	"DL_CONNECT_IND",
	"DL_CONNECT_RES",
	"DL_CONNECT_CON",
	"DL_TOKEN_REQ",
	"DL_TOKEN_ACK",
	"DL_DISCONNECT_REQ",
	"DL_DISCONNECT_IND",
};

/* DL_ERROR_ACK error return values */
char	*err_msg[] = {
	"DL_BADSAP",
	"DL_BADADDR",
	"DL_ACCESS",
	"DL_OUTSTATE",
	"DL_SYSERR",
	"DL_BADCORR",
	"DL_BADDATA",
	"DL_UNSUPPORTED",
	"DL_BADPPA",
	"DL_BADPRIM",
	"DL_BADQOSPARAM",
	"DL_BADQOSTYPE",
	"DL_BADTOKEN",
	"DL_BOUND",
	"DL_INITFAILED",
	"DL_NOADDR",
	"DL_NOTINIT",
	"DL_UNDELIVERABLE",
	"DL_NOTSUPPORTED",
	"DL_TOOMANY",
	"DL_NOTENAB	",
	"DL_BUSY",
	"DL_NOAUTO",
	"DL_NOXIDAUTO",
	"DL_NOTESTAUTO",
	"DL_XIDAUTO	",
	"DL_TESTAUTO",
	"DL_PENDING",
};

#ifdef SYSV
int	yyopen(char*);					/* eg. int fd = yyopen("bf") */
int	yyattach(int, u_long);			/* eg. yyattach(fd, ppa) */
int	yyokack(int);					/* eg. yyokack(fd);	*/

/* Return string. */
char*
ether_ntoa(addr)
u_char	*addr;
{
	static	char	addrbuf[1024];
	int		i;
	char	*p;
	int		length = sizeof(struct ether_addr);

	p = addrbuf;
	for (i = 0; i < length; i++) {
		sprintf(p, "%x:", addr[i] & 0xff);
		p = p + strlen(p);
	}
	if (length)
		*(--p) = '\0';

	return (addrbuf);
}

/* Return Address. */
struct ether_addr *
ether_aton(p)
char	*p;
{
	int	n = 0;
	char	*addr, *a ;
	int	len;
	int	val;

	a = (char*) malloc(sizeof(struct ether_addr));
	addr = (char*) a;
	while (p = (char *) strtok(p, ":")) {
		if (sscanf(p, "%x", &val) != 1)
			printf("stringtoaddr:  invalid input string:  %s", p);
		if (val > 0xff)
			printf("stringtoaddr:  invalid input string:  %s", p);
		*addr++ = val;
		n++;
		p = NULL;
	}
	
	return ((struct ether_addr*)addr);
}

ether_hostton(v,a)
char *v,*a;
{
	return(-1);
}

long
getpagesize()
{
	long p;

	if ((p = sysconf(_SC_PAGESIZE)) == -1) {
		perror("getpagesize");
		exit (-1);
	}
	return(p);
}
#endif SYSV

static int
sigalrm()
{
	printf("sigalrm:  TIMEOUT\n");
	exit(-1);
}

static
strgetmsg(fd, ctlp, datap, flagsp, caller)
register int				fd;
register struct	strbuf	*ctlp, *datap;
register int				*flagsp;
register char			*caller;
{
	int			rc;
	static char	errmsg[80];

	/* Start timer. */
	signal(SIGALRM, sigalrm);
	if (alarm(MAXWAIT) < 0) {
		printf("%s:  alarm", caller);
		exit(-1);
	}

	/* Set flags argument and issue getmsg(). */
	*flagsp = 0;
	if ((rc = getmsg(fd, ctlp, datap, flagsp)) < 0) {
		printf("%s:  getmsg", caller);
		exit(-1);
	}

	/* Stop timer. */
	if (alarm(0) < 0) {
		printf("%s:  alarm", caller);
		exit(-1);
	}

	/* Check for MOREDATA and/or MORECTL. */
	if ((rc & (MORECTL | MOREDATA)) == (MORECTL | MOREDATA))
		printf("%s:  MORECTL|MOREDATA\n", caller);
	if (rc & MORECTL)
		printf("%s:  MORECTL\n", caller);
	if (rc & MOREDATA)
		printf("%s:  MOREDATA\n", caller);

	/* Check for at least sizeof (long) control data portion. */
	if (ctlp->len < sizeof (long))
		printf("getmsg:  control portion length < sizeof (long):  %d\n", ctlp->len);
}

int
yyopen(interface)
register char	*interface;
{
	char	dev[0x20];
	register int		fd;

	memset(dev, 0, sizeof(dev));
	strcpy(dev, "/dev/");
	strncat(dev, interface, strlen(interface)-1);
	if ((fd = open(dev, O_RDWR)) < 0) {
		perror("open");
		exit(-1);
	}
	return(fd);
}

yyattach(fd, ppa)
register int		fd;
register u_long	ppa;
{
	dl_attach_req_t	attach_req;
	struct	strbuf	ctl;
	register int	flags;

	attach_req.dl_primitive = DL_ATTACH_REQ;
	attach_req.dl_ppa = ppa;

	ctl.maxlen = 0;
	ctl.len = sizeof (attach_req);
	ctl.buf = (char *) &attach_req;

	flags = 0;

	if (putmsg(fd, &ctl, NULL, flags) < 0) {
		perror("dlattachreq:  putmsg");
		exit(-1);
	}
}

yyokack(fd)
register int		fd;
{
	register union	DL_primitives	*dlp;
	int		flags;
	long	ctlbuf[MAXDLBUF];
	struct	strbuf	ctl;

	ctl.maxlen = MAXDLBUF;
	ctl.len = 0;
	ctl.buf = (char *) ctlbuf;

	strgetmsg(fd, &ctl, NULL, &flags, "dlokack");

	dlp = (union DL_primitives *) ctl.buf;

	if (dlp->dl_primitive != DL_OK_ACK) {
		printf("receive %s for %s with %s error\n",
				prim_msg[dlp->error_ack.dl_primitive],
				prim_msg[dlp->error_ack.dl_error_primitive],
				err_msg[dlp->error_ack.dl_errno]);
		exit(-1);
	}

	if (ctl.len < sizeof (dl_ok_ack_t)) {
		printf("dlokack:  response ctl.len too short:  %d", ctl.len);
		exit(-1);
	}

	if (flags != RS_HIPRI) {
		printf("dlokack:  DL_OK_ACK was not M_PCPROTO");
		exit(-1);
	}

	if (ctl.len < sizeof (dl_ok_ack_t)) {
		printf("dlokack:  short response ctl.len:  %d", ctl.len);
		exit(-1);
	}

	if (ctl.len > sizeof (dl_ok_ack_t)) {
		printf("dlokack:  ctl.len > sizeof (dl_ok_ack_t):  %d", ctl.len);
		exit(-1);
	}
}
