#---------------------------------------------------------------------
# $Header: /projects/raw/cvsroot/benchmark/suites/jacobi/doc/Makefile,v 1.1 1997/04/07 03:43:47 jbabb Exp $
#---------------------------------------------------------------------
# RAW Benchmark Suite Makefile for Jacobi documentation
#---------------------------------------------------------------------
.SILENT:

jacobi.ps.gz:
	-gunzip *.gz
	latex jacobi.tex
	latex jacobi.tex
	dvi2ps jacobi.dvi > jacobi.ps
	gzip *.psi *.tex *.ps
	rm -f *.aux *.log *.dvi

