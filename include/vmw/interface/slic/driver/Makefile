#------------------------------------------------------------------------------
# $Header: /projects/raw/cvsroot/benchmark/include/vmw/interface/slic/driver/Makefile,v 1.3 1997/08/09 05:56:36 jbabb Exp $
#
# RAW Benchmark Suite vmw/interface/slic/driver Makefile
#
# Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
#
# (Note: Modified from Sun-supplied Makefile)
#------------------------------------------------------------------------------
.SILENT:

ARCH=		`arch -k`
LINT_FLAGS=	-abhnuxz
CFILES =	sliceb_drv.c sliceb_hw.c slic.c m68901.c
OFILES =	$(CFILES:.c=.o)
HFILES =	sliceb_var.h sliceb_ioctl.h dlpi.h slic.h m68901.h
UTIL_CFILES =	interface.c term.c poke.c util.c # chk.c tst.c macid.c
ADB_SCRIPTS =	sliceb_var slicebstr slicebstrlst slicebstrlst.nxt devinfo
SRC =		$(CFILES) $(HFILES) Makefile sliceb.INSTALL port unload \
			$(ADB_SCRIPTS) \
			$(UTIL_CFILES)

CPP =		/lib/cpp
AWK=		awk

#OS: sh = \
#	if  [ `expr  \`uname -r\` : 5\*` = 0 ] ; then \
#		echo "4.x" ; \
#	else \
#		echo "SYSV" ; \
#	fi
# JWB: the former wasn't working so do it manually below

INC=		-I. 

# choose the correct C compiler, 'acc' for 4.1 and 'cc' for Solaris 2 (SVR4)
# TMP_CC= acc
# CC= $(TMP_CC:SYSV=cc)

CC= gcc

TMP_DRV= sliceb.o
DRV= $(TMP_DRV:SYSV=sliceb)

FLAGS=		-O -c $(INC) -D$(ARCH) 
FLAGS1=		-O -c $(INC)  

TMP_CFLAGS= $(FLAGS)
CFLAGS= $(TMP_CFLAGS:SYSV=$(FLAGS1) -DSYSV)

K_FLAGS= -DKERNEL -D_KERNEL  -DLOADABLE
TMP_KFLAGS= $(K_FLAGS) -DLOADABLE
KFLAGS= $(TMP_KFLAGS:SYSV=$(K_FLAGS) -DSUNDDI)

TMP_LFLAGS=
LFLAGS= $(TMP_LFLAGS:SYSV=-lnsl)

CPP_FLAGS=	$(INC)

term_cfiles =	term.c util.c
term_ofiles =	$(term_cfiles:.c=.o)

poke_cfiles =	poke.c util.c
poke_ofiles =	$(poke_cfiles:.c=.o)


# 01/12/97 JWB: added interface files:
interface_cfiles =	interface.c util.c
interface_ofiles =	$(interface_cfiles:.c=.o)


BD = `date '+sliceb%y%m%d'`
BDT = `date '+sliceb%y%m%d-%H:%M'`

default:	interface.a sliceb.o poke # term qq chk tst

lint:		sliceb.lint

# 01/13/97 JWB: added install target, must be su on machine with slic card:
install:
	cp -p sliceb.o /etc/slic/drv
	(cd /etc/slic; ./sliceb.UNLOAD; ./sliceb.UNINSTALL)
	(cd /etc/slic/drv; ./sliceb.INSTALL; ./sliceb.LOAD)
	chmod 777 /dev/sliceb

# 01/13/97 JWB: added interface library target:
interface.a: $(interface_ofiles)
	ld -r -o interfacelib.o $(interface_ofiles)
	ar cr interface.a interfacelib.o
	ranlib interface.a

sliceb: sliceb.o

sliceb.o: $(OFILES)
	ld -r -o $@ $(OFILES)

term:	$(term_ofiles)
	$(CC) -o $@ $(term_ofiles)

poke:	$(poke_ofiles)
	$(CC) -o $@ $(poke_ofiles)

$(OFILES):
	$(CC) $(CFLAGS) $(KFLAGS) $*.c

.c.o:
	$(CC) $(CFLAGS) $*.c

# 07/06/97 JWB: added standard clean and realclean targets:
clean:
	echo "Cleaning up driver area (vmw/interface/slic/driver)..."
	rm -f sliceb.o poke term *.o interface.a

realclean: clean
	echo "Really cleaning up driver area (vmw/interface/slic/driver)..."

ctags:
	ctags $(CFILES) $(HFILES)

cscope:
	cscope $(CFILES) $(HFILES)


sav: $(SRC)
	(cd SAVE; rm -f $(SRC))
	cp $(SRC) SAVE

save: $(SRC)
	rm -f SAVE/$(BD).Z
	tar cvf SAVE/$(BD) $(SRC)
	compress SAVE/$(BD)
					 
ss: sav save


sliceb.lint:	$(CFILES)
	@rm -f sliceb.lint
	@lint $(LINT_FLAGS) $(ARCH) $(DEBUG_FLAG) $(CFILES) > sliceb.lint
	@echo ------------------------------------------------ >> sliceb.lint
	@lint $(LINT_FLAGS) $(ARCH) $(DEBUG_FLAG) \
					-DKERNEL sliceb.c >> sliceb.lint

depend: makedep
	echo '/^# DO NOT DELETE THIS LINE/+1,$$d' >eddep
	echo '$$r makedep' >>eddep
	echo 'w' >>eddep
	cp Makefile Makefile.bak
	ex - Makefile < eddep
	-rm -f eddep makedep makedep1 makedeperrs

makedep: $(CFILES) $(UTIL_CFILES) $(HFILES)
	for i in ${CFILES} ${UTIL_CFILES} ; \
	do ${CPP} -M ${CPP_FLAGS} $$i ;	done > makedep 2> makedeperrs
	-set -x ; sed \
		-e 's, \./, ,' \
		-e 's,/\./,/,' \
		-e 's,^\(.*\)\.o:,\1.o:,' makedep > makedep1
	@-${AWK} -F: ' \
		{ \
			if ($$1 != prev) { \
				print rec; \
				rec = $$0; \
				prev = $$1; \
			} \
			else { \
				if (substr($$2, 0, length(" /usr/include")) != " /usr/include") { \
					if (length(rec $$2) > 78) { \
						print rec; \
						rec = $$0; \
					} \
					else { \
						rec = rec " " $$2; \
					} \
				} \
			} \
		} \
	END	{ print rec } \
	' makedep1 > makedep
	-@cat makedeperrs >&- 1>&2

FRC:


# DO NOT DELETE THIS LINE -- make depend uses it

sliceb_drv.o: sliceb_drv.c  sliceb_var.h  dlpi.h  sliceb_ioctl.h
sliceb_hw.o: sliceb_hw.c  sliceb_var.h  dlpi.h
slic.o: slic.c  sliceb_var.h  dlpi.h  slic.h
m68901.o: m68901.c  sliceb_var.h  dlpi.h  m68901.h
interface.o: interface.c  sliceb_ioctl.h  slic.h
term.o: term.c
poke.o: poke.c  sliceb_ioctl.h
util.o: util.c  dlpi.h
