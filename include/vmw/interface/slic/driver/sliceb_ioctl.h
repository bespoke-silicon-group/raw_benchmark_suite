/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)yyioctl.h 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

#define		DL_IOC_YY		0x8020693b

/* YY generic header ioctl */
typedef struct {
	int		cmd;
	int		reserved[4];
} yyhdr_t;

#define	YY_POKE		0x55

/* cmd */
#define READ	0
#define	WRITE	1

/* chip */
#define EPROM	0
#define PORT	0x10
#define REG		0x20

typedef struct {
	yyhdr_t		yyhdr;
	u_long		cmd;
	u_long		chip;
	u_long		offset;
	u_long		data;
} pokecmd_t;
