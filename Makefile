#------------------------------------------------------------------------------
# $Header: /projects/raw/cvsroot/benchmark/Makefile,v 1.11 1997/08/16 22:19:37 jbabb Exp $
#
# Top level Benchmark Suite Makefile
#
# Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
#
# Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Targets of interest:
#
# release     - generate and check distribution netlists
# results     - generate results for all benchmarks
# distresults - generate results for all benchmarks from distribution nets
# summary     - summarize results for built benchmarks
# soft        - execute software version of all benchmarks
# drivers     - compile all driver programs
# driver-soft - compile hardware driver program
# driver-sim  - compile simulation driver program
# driver-hard - compile software driver program
# syn         - synthesize all benchmarks
# compile     - compile all benchmarks for hardware
# distcompile - compile all benchmarks for hardware from distribution netlists
# report      - report hardware statistics for compiled benchmarks
# check       - simulate behavioral and synthesized benchmark netlists
# checkhard   - execute smallest size of each benchmark on the hardware
# dist        - create a distribution tar.gz file including source and netlists
# distbuild   - builds the distribution
# distclean   - cleans up non-distributed files created during build process
# realclean   - cleans up as much as possible, down to the bare source
# 
# BENCHMARK.{any of the above} is the target for a specific benchmark
#
#------------------------------------------------------------------------------

.SILENT:

NAME         = benchmark_v1.0
SUITESDIR    = suites
RESULTS      = Results.txt
RESULTS_HTML = Results.html

SUITES =	 		\
	bheap.suite		\
	bubblesort.suite	\
	des.suite		\
	fft.suite		\
	intmatmul.suite		\
	jacobi.suite		\
	life.suite		\
	mergesort.suite		\
	nqueens.suite
#	graph.suite

all:
	@echo Nothing to make


release:
	@echo "Starting full release procedure..."
	gmake dist check | tee ../$(NAME).log
	echo \
	"Completed full release. (log file: $(NAME).log)"


results: $(SUITES:.suite=.results) summary

$(SUITES:.suite=.results):
	@echo "Generating results for $(@:.results=) suite..."
	(cd $(SUITESDIR)/$(@:.results=)/build; gmake results)
	@echo "Completed generating results for $(@:.results=) suite."


distresults: $(SUITES:.suite=.distresults) summary

$(SUITES:.suite=.distresults):
	@echo "Generating distresults, $(@:.distresults=) suite..."
	(cd $(SUITESDIR)/$(@:.distresults=)/build; gmake distresults)
	@echo "Completed generating distresults, $(@:.distresults=) suite."


$(RESULTS_HTML): summary
summary: summary.txt
	@echo "Creating results summary page ($(RESULTS_HTML))..."
	echo "<HTML><HEAD><TITLE>Results</TITLE></HEAD><BODY><TABLE ALIGN=ABSCENTER BORDER=1 CELLSPACING=1 CELLPADDING=1 >" > $(RESULTS_HTML)
	cat $(RESULTS) | awk '{print "<TR> <TD>"$$1"</TD> <TD>"$$2"</TD> <TD>"$$3"</TD> <TD>"$$4"</TD> <TD>"$$5"</TD> <TD>"$$6"</TD> <TD>"$$7"</TD> <TD>"$$8"</TD> <TD>"$$9"</TD> <TD>"$$10"</TD> <TD>"$$11"</TD> <TD>"$$12"</TD> <TD>"$$13"</TD> <TD>"$$14"</TD> </TR>"}' >> $(RESULTS_HTML)
	echo "</TABLE></BODY></HTML>" >> $(RESULTS_HTML)

$(RESULTS): summary.txt
summary.txt: Makefile
	@echo "Creating results summary table ($(RESULTS))..."
	echo "name case elements bits cycles soft-speed(KHZ) total-gates useful-gates FPGAs v-cycles hard-clk(MHZ) hard-speed(KHZ) speedup per-FPGA" > $(RESULTS)
	cat suites/*/build/*.summary >> $(RESULTS)


report: $(SUITES:.suite=.report)

$(SUITES:.suite=.report):
	@echo "Compiling result reports for $(@:.report=) suite..."
	(cd $(SUITESDIR)/$(@:.report=)/build; gmake report)
	@echo "Completed running report version of $(@:.report=) suite."


soft: $(SUITES:.suite=.soft)

$(SUITES:.suite=.soft):
	@echo "Running software version of $(@:.soft=) suite..."
	(cd $(SUITESDIR)/$(@:.soft=)/build; gmake soft)
	@echo "Completed running software version of $(@:.soft=) suite."


drivers: $(SUITES:.suite=.drivers)

$(SUITES:.suite=.drivers):
	@echo "Building drivers for $(@:.drivers=) suite..."
	(cd $(SUITESDIR)/$(@:.drivers=)/build; gmake drivers)
	@echo "Completed building drivers for $(@:.drivers=) suite..."


driver-hard: $(SUITES:.suite=.driver-hard)

$(SUITES:.suite=.driver-hard):
	@echo "Building driver-hard for $(@:.driver-hard=) suite..."
	(cd $(SUITESDIR)/$(@:.driver-hard=)/build; gmake driver-hard)
	@echo "Completed building driver-hard for $(@:.driver-hard=) suite..."


driver-sim: $(SUITES:.suite=.driver-sim)

$(SUITES:.suite=.driver-sim):
	@echo "Building driver-sim for $(@:.driver-sim=) suite..."
	(cd $(SUITESDIR)/$(@:.driver-sim=)/build; gmake driver-sim)
	@echo "Completed building driver-sim for $(@:.driver-sim=) suite..."


driver-soft: $(SUITES:.suite=.driver-soft)

$(SUITES:.suite=.driver-soft):
	@echo "Building driver-soft for $(@:.driver-soft=) suite..."
	(cd $(SUITESDIR)/$(@:.driver-soft=)/build; gmake driver-soft)
	@echo "Completed building driver-soft for $(@:.driver-soft=) suite..."


check: $(SUITES:.suite=.check)

$(SUITES:.suite=.check):
	@echo "Checking $(@:.check=) suite..."
	(cd $(SUITESDIR)/$(@:.check=)/build; gmake check)
	@echo "Completed checking $(@:.check=) suite."


checkhard: $(SUITES:.suite=.checkhard)

$(SUITES:.suite=.checkhard):
	@echo "Checking small benchmark on hardware, $(@:.checkhard=) suite..."
	(cd $(SUITESDIR)/$(@:.checkhard=)/build; gmake checkhard)
	@echo "Checking small benchmark on hardware, $(@:.checkhard=) suite."


syn: $(SUITES:.suite=.syn)

$(SUITES:.suite=.syn):
	@echo "Running synthesizing $(@:.syn=) suite..."
	(cd $(SUITESDIR)/$(@:.syn=)/build; gmake syn)
	@echo "Completed synthesizing $(@:.syn=) suite."


compile: $(SUITES:.suite=.compile)

$(SUITES:.suite=.compile):
	@echo "Running compiling $(@:.compile=) suite..."
	(cd $(SUITESDIR)/$(@:.compile=)/build; gmake compile)
	@echo "Completed compiling $(@:.compile=) suite."


distcompile: $(SUITES:.suite=.distcompile)

$(SUITES:.suite=.distcompile):
	@echo "Compiling hardware from dist, $(@:.distcompile=) suite..."
	(cd $(SUITESDIR)/$(@:.distcompile=)/build; gmake distcompile)
	@echo "Compiling hardware from dist, $(@:.distcompile=) suite..."


dist: distbuild distclean tar

tar:
	(cd ..; \
	tar -cvf $(NAME).tar $(NAME); \
	gzip $(NAME).tar)
	@echo "Distribution file: $(NAME).tar.gz


distbuild: $(SUITES:.suite=.distbuild)

$(SUITES:.suite=.distbuild):
	@echo "Building $(@:.distbuild=) suite distribution..."
	(cd $(SUITESDIR)/$(@:.distbuild=)/build; gmake distbuild)
	@echo "Completed building $(@:.distbuild=) suite distribution."


distclean: $(SUITES:.suite=.distclean)
	@echo "Completed distcleaning benchmark directories."

$(SUITES:.suite=.distclean):
	(cd $(SUITESDIR)/$(@:.distclean=)/build; gmake distclean)
	@echo "Completed distcleaning $(@:.distclean=) suite."


realclean: $(SUITES:.suite=.realclean)
	-rm -f $(RESULTS) $(RESULTS_HTML)
	@echo "Completed realcleaning benchmark directories."

$(SUITES:.suite=.realclean):
	(cd $(SUITESDIR)/$(@:.realclean=)/build; gmake realclean)
	@echo "Completed cleaning $(@:.realclean=) suite."

#---------------------------------------------------------------------
