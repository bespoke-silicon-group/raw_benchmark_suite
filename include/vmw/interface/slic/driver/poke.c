/* Copyright (c) 1992 by Sun Microsystems, Inc. */
/* 01/08/97 JWB: Poke directly to port 1 */

#pragma ident  "@(#)poke.c 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <sys/types.h>
#include <sys/stropts.h>

#include <sliceb_ioctl.h>

/* MACID PROM FORMAT */
/*
	Word 0:		Format Code
	Word 1:		CPU Type
	Word 2-7:	MAC Address (Cononical(
	Word 8-11:	Date of manufacture (# of seconds since Jan 1 1979)
	Word 12-14:	Serial Number
	Word 15:	Checksum
*/

#define MAXLINE	80

extern	int		errno;
int				fd;
char			*interface;
FILE			*infile=NULL;

pokeioctl(pokecmdp)
pokecmd_t	*pokecmdp;
{
	struct strioctl		si;

	pokecmdp->yyhdr.cmd = YY_POKE;

	si.ic_cmd = DL_IOC_YY;
	si.ic_timout = 0;
	si.ic_len = sizeof(pokecmd_t);
	si.ic_dp = (char *) pokecmdp;

	if (ioctl(fd, I_STR, &si) < 0) {
		perror("ioctl");
		exit(-1);
	}
}

read_hw(chip, offset, pdata)
register u_long		chip;
register u_long		offset;
register u_long		*pdata;
{
	pokecmd_t	pokecmd;

	pokecmd.cmd = READ; 
	pokecmd.chip = chip;
	/* 01/08/97 JWB: Poke directly to port 1 */
	pokecmd.offset = offset +0x20000; 
	pokecmd.data = 0;	
	pokeioctl(&pokecmd);
	*pdata = pokecmd.data;
}

write_hw(chip, offset, data)
register u_long		chip;
register u_long		offset;
register u_long		data;
{
	pokecmd_t	pokecmd;

	pokecmd.cmd = WRITE; 
	pokecmd.chip = chip;
	/* 01/08/97 JWB: Poke directly to port 1 */
	pokecmd.offset = offset +0x20000; 
	pokecmd.data = data;	
	pokeioctl(&pokecmd);
}

usage()
{
	printf("usage: poke interface <infile>\n");
	exit(-1);
}

lc(str)
char	*str;
{
	while (*str) {
		*str = tolower(*str);
		str++;
	}
}

opendevice()
{
	int		ppa;

	if ((fd = yyopen(interface)) < 0) {
		perror("yyopen failed\n");
		exit(-1);
	}
	ppa = atoi(&interface[strlen(interface)-1]);
	yyattach(fd, ppa);
	yyokack(fd);
}

parse(line)
char	*line;
{
	u_long	cmd, chip, offset, data;
	char	str[80];
	char	*strp;
	char	*linep=line;

	cmd = chip = offset = data = 0;

	memset(str, 0, sizeof(str));

	strp = str;
	while (*linep != ' ' && *linep != '\t' && *linep != 0) 
		*strp++ = *linep++;
	*strp = 0;
	while (*linep == ' ' || *linep == '\t') 
		linep++;
	lc(str);

	if (strcmp(str, "read") == 0 || strcmp(str, "r") == 0)
		cmd = READ;
	else if (strcmp(str, "write") == 0 || strcmp(str, "w") == 0)
		cmd = WRITE;
	else if (strcmp(str, "quit") == 0 || strcmp(str, "q") == 0) {
		close(fd);
		exit(0);
	}
	else {
		return;
	}

	strp = str;
	while (*linep != ' ' && *linep != '\t') *strp++ = *linep++;
	*strp = 0;
	while (*linep == ' ' || *linep == '\t') linep++;
	lc(str);
	if (strcmp(str, "eprom") == 0 || strcmp(str, "e") == 0)
		chip = EPROM;
	else if (strcmp(str, "port") == 0 || strcmp(str, "p") == 0)
		chip = PORT;
	else if (strcmp(str, "reg") == 0 || strcmp(str, "r") == 0)
		chip = REG;
	else {
		return;
	}

	strp = str;
	while (*linep != ' ' && *linep != '\t' && *linep != 0) 
		*strp++ = *linep++;
	*strp = 0;
	while (*linep == ' ' || *linep == '\t') linep++;
	lc(str);
	offset = strtol(str, 0, 0);

	switch (cmd) {
	case READ:
		read_hw(chip, offset, &data);
		printf("%#x\n", data);
		break;
	case WRITE:
		strp = str;
		while (*linep != ' ' && *linep != '\t' && *linep != 0)
			*strp++ = *linep++;
		*strp = 0;
		lc(str);
		data = strtol(str, 0, 0);
		write_hw(chip, offset, data);
		break;
	}
}

poke()
{
	char	line[80];

	for (;;) {
		if (infile) {
			if (fgets(line, MAXLINE, infile) == NULL) exit(0);
			printf("cmd: %s", line);
		}
		else {
			printf("[read|write|quit] [eprom|port|reg] offset <data>\n");
			printf("cmd: ");
			gets(line);
		}
		parse(line);
		printf("\n");
	}
}

main(argc, argv)
int		argc;
char	**argv;
{

	if (argc < 2 || argc > 3) usage();

	interface = argv[1];
	if (argc == 3) {
		if ((infile = fopen(argv[2], "r")) == NULL) {
			char	msg[80];
			sprintf(msg, "Cannot open %s", argv[2]);
			perror(msg);
			exit(-1);
		}
	}

	opendevice();
	poke();
}
