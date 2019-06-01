/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)term.c 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

#include <sys/types.h>
#include <sys/stropts.h>
/*
#include <sys/file.h>
#include <sys/stream.h>
*/
#include <sys/stat.h>
#include <stdio.h>
#include <sgtty.h>

#define CTRLC	0x3
#define CTRLD	0x4
#define BS		0x8
#define LF		0xA
#define CR		0xD
#define SP		0x20
#define DEL		0x7F

typedef enum {
	FALSE = 0, TRUE = 1,
} boolean;

boolean		wason;
char 		*tty, *ttyname();
struct sgttyb  ttys, ttysnew, ttystemp;    /* for stty terminal mode calls */
struct stat statbuf;  	/* for terminal message on/off control */
struct stat errstatbuf;

extern int	errno;
int			slicfd;
char		*interface;


/* print error message and exit; if mode == TRUE, restore normal tty modes */
ttyerror(msg, mode)
char	*msg;
int		mode;
{
	if (mode) 
		reset_tty_raw();
	printf(msg);
}

set_tty_raw()
{
	if (ioctl(0,TIOCGETP,&ttys)<0)  /* get tty params */
		ttyerror("Can't get TTY Parameters", TRUE);

	tty = ttyname(0);  /* identify current tty */
	
	/* transfer current modes to new structure */
	ttysnew.sg_ispeed = ttys.sg_ispeed;	/* copy input speed */
	ttysnew.sg_ospeed = ttys.sg_ospeed;	/* copy output speed */
	ttysnew.sg_erase  = ttys.sg_erase;	/* copy erase flags */
	ttysnew.sg_flags  = ttys.sg_flags;	/* copy flags */
 	ttysnew.sg_kill   = ttys.sg_kill;	/* copy std terminal flags */
	

	ttysnew.sg_flags |= RAW;    /* set for RAW Mode */
			/* This ORs in the RAW mode value, thereby
			   setting RAW mode and leaving the other
			   mode settings unchanged */
	ttysnew.sg_flags &= ~ECHO;  /* set for no echoing */
			/* This ANDs in the complement of the ECHO
			   setting (for NO echo), thereby leaving all
			   current parameters unchanged and turning
			   OFF ECHO only */
	ttysnew.sg_flags &= ~XTABS;  /* set for no tab expansion */
	ttysnew.sg_flags &= ~LCASE;  /* set for no upper-to-lower case xlate */
	ttysnew.sg_flags &= ~ANYP; /* set for no Parity (8 bits) */
	ttysnew.sg_flags &= ~NL3;  /* turn off ALL delays - new line */
	ttysnew.sg_flags &= ~TAB2; /* turn off tab delays */
	ttysnew.sg_flags &= ~CR3;  /* turn off CR delays */
	ttysnew.sg_flags &= ~FF1;  /* turn off FF delays */
	ttysnew.sg_flags &= ~BS1;  /* turn off BS delays */
	ttysnew.sg_flags &= ~TANDEM;  /* turn off flow control */

	/* set new paramters */
	if (ioctl(0,TIOCSETP,&ttysnew) < 0)
		ttyerror("Can't set new TTY Parameters", TRUE);

	if (stat(tty, &statbuf) < 0)  /* get tty status */ 
		ttyerror("Can't get your TTY Status", TRUE);

	if (statbuf.st_mode & 022)	/* Need to turn messages off */
		if (chmod(tty, statbuf.st_mode & ~022) < 0)
			ttyerror("Can't change  TTY mode", TRUE);
		else wason = TRUE;
	else wason = FALSE;
}

int reset_tty_raw()
{
	if (wason)  /* if messages were on originally */
		if (chmod(tty, statbuf.st_mode | 022) < 0)
			ttyerror("Can't change TTY Mode", FALSE);
	return( ioctl(0,TIOCSETP,&ttys) );
}

opendevice()
{
	int		ppa;

	if ((slicfd = yyopen(interface)) < 0) {
		perror("yyopen failed\n");
		exit(-1);
	}
	ppa = atoi(&interface[strlen(interface)-1]);
	yyattach(slicfd, ppa);
	yyokack(slicfd);
}

txb(bchar)
char	bchar;
{
	struct strbuf   data;
	 
	data.buf = &bchar;
	data.len = 1;
	if (putmsg(slicfd, 0, &data, 0) < 0) {
		perror("putmsg");
		exit(1);
	}
}

rxb(bcharp)
char	*bcharp;
{
}

sendchar(bchar)
char	bchar;
{
	txb(bchar);
	putchar(bchar);
}

term()
{
	char	bchar;

	opendevice();
	set_tty_raw();
	while ((bchar = getchar()) != CTRLD && bchar != CTRLC) {
		if (bchar == BS || bchar == DEL) {
			sendchar(BS);
			sendchar(SP);
			sendchar(BS);
		}
		else if (bchar != LF) {
			if (bchar == CR) {
				sendchar(bchar);
				bchar = LF;
			}
			sendchar(bchar);
		}
	}
	reset_tty_raw();
}

usage()
{
	printf("usage: term interface\n");
	exit(-1);
}

main(argc, argv)
int		argc;
char	**argv;
{
	if (argc != 2) usage();
	interface = argv[1];
	term();
}
