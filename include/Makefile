#------------------------------------------------------------------------------
# $Header: /projects/raw/cvsroot/benchmark/include/Makefile,v 1.2 1997/08/09 05:56:02 jbabb Exp $
#
# RAW Benchmark Suite include Makefile
#
# Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
#          Matthew Frank           (mfrank@lcs.mit.edu)
#
# Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
#-----------------------------------------------------------------------------
.SILENT:

include_clean:
	echo "Cleaning up include area..."
	rm -f *~ *.o *_rtl.v
	rm -f *.area *.timing *.out *.log *.aux
	rm -rf WORK

include_real_clean: include_clean
	echo "Really cleaning up include area..."
	rm -f include.o *_vmw.v

#---------------------------------------------------------------------
