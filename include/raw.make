#------------------------------------------------------------------------------
# $Header: /projects/raw/cvsroot/benchmark/include/raw.make,v 1.23 1997/08/16 22:16:14 jbabb Exp $
#
# RAW Benchmark Suite Included Makefile
#
# Authors: Jonathan Babb           (jbabb@lcs.mit.edu)
#          Matthew Frank           (mfrank@lcs.mit.edu)
#
# Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#
# Input variables expected from calling Makefile:
#
# BENCHNAME      = name of benchmark
# BENCHMARKS     = list of parameterized benchmark versions to generate
# BENCHSMALL     = identifies smallest benchmark version
# GENERATE_FILES = set of C files to build the generate program
# DRIVER_FILES   = set of C files to build the driver programs
# LIBRARY_FILE   = library containing behavioral verilog components
# HOSTS_FILE     = additional FPGA place and route hosts file
# SYSTEM_ARCH    = reconfigurable computing system architecture 
# MAX_BOARDS     = maximum number of VirtuaLogic boards to use
# VLE_SPEED      = speed of virtuaLogic emulator (1-8)
# INCLUDE_DIR    = include directory
#
#-----------------------------------------------------------------------------
.SILENT:

# Target the vmw (IKOS VirtuaLogic Emulator) V1.4 with SLIC interface:

HARDWARE         = vmw
VLE_VERSION      = V1.4
VLE_HOST         = Halibut
INTERFACE        = slic


# reported hardware speed given 25MHZ Clock (corresponds to VLE_SPEED of 7)
REPORT_CLOCK    = 25.
CLOCK_UNITS     = 1000000.
SPEED_UNITS     = 1000.

# Use Synopsys for synthesis:

SYNTHESIZER	= synopsys
SYN_SHELL       = dc_shell


# Use Cadence Verilog with behavioral speedup:

SIMULATOR       = verilog.exe
SIMFLAGS        = +speedup


# synthesizer script to convert from behavioral verilog to VirtualLogic

VERILOG2VLE = $(HARDWARE_DIR)/$(SYNTHESIZER)/verilog2vle.syn
FLATTEN_VLE = $(HARDWARE_DIR)/$(SYNTHESIZER)/flatten_vle.syn
SYN_LIB     = $(HARDWARE_DIR)/$(SYNTHESIZER)/vmw_ref.db


# Target derivatives:

HARDWARE_DIR    = $(INCLUDE_DIR)/$(HARDWARE)
TEMPLATE_DIR    = $(INCLUDE_DIR)/$(HARDWARE)/template


# Interface files

INTERFACE_DIR   = $(HARDWARE_DIR)/interface/$(INTERFACE)
DRIVER_DIR      = $(INTERFACE_DIR)/driver
INTERFACE_FILES = $(addprefix $(INTERFACE_DIR)/, vmw.clk vmw.pod params.mak)
INTERFACE_VLOG  = $(addprefix $(INTERFACE_DIR)/, system.v interface.v)
INTERFACE_SYN   = $(INTERFACE_VLOG:.v=_vmw.v)


# derivatives of the BENCHMARK list:

BENCH_TEMPLATE	   = $(BENCHMARKS:.v=.template.v)
BENCH_POST	   = $(BENCHMARKS:.v=.post.v)
BENCH_EXPAND	   = $(BENCHMARKS:.v=.expand.v)
BENCH_SYN          = $(BENCHMARKS:.v=_vmw.v)
BENCH_DIR          = $(BENCHMARKS:.v=.vmw)
BENCH_DIRAUX       = $(BENCHMARKS:.v=.aux)
BENCH_DIRCP        = $(BENCHMARKS:.v=.cp)
BENCH_COMPILE      = $(BENCHMARKS:.v=.compile)
BENCH_DISTCOMPILE  = $(BENCHMARKS:.v=.distcompile)
BENCH_PPR          = $(BENCHMARKS:.v=.ppr)
BENCH_VECTORS      = $(BENCHMARKS:.v=.vectors)
BENCH_SIM          = $(BENCHMARKS:.v=.sim)
BENCH_SIMS         = $(BENCHMARKS:.v=_vmw.sim)
BENCH_DISTSIM      = $(BENCHMARKS:.v=.distsim)
BENCH_DISTSIMS     = $(BENCHMARKS:.v=_vmw.distsim)
BENCH_RUN          = $(BENCHMARKS:.v=.run)
BENCH_LOAD         = $(BENCHMARKS:.v=.load)
BENCH_HARD         = $(BENCHMARKS:.v=.hard)
BENCH_SOFT         = $(BENCHMARKS:.v=.soft)
BENCH_REPORT	   = $(BENCHMARKS:.v=.report)


.PRECIOUS: %.expand.v %_vmw.v %.aux %.compile %.ppr %.vectors \
	%.sim %_vmw.sim %.run %.load %.hard %.soft


# Simulation files:

TEST_SHELL      = $(COMMON_DIR)/test_shell.v

VENDOR_LIB      = $(HARDWARE_DIR)/lib/vmw_reference.v \
                  $(HARDWARE_DIR)/lib/vmw_synthprim.v

SIM_FILES       = $(TEST_SHELL)
SIMS_FILES      = $(TEST_SHELL) $(VENDOR_LIB)


# Common files used for all architectures:

COMMON_DIR      = $(INCLUDE_DIR)/common
MAIN_DEFINE     = main_define.v
MAIN_HEADER     = main_header.v 
MAIN_TRAILER    = main_trailer.v
MAIN_FILES      = $(MAIN_TRAILER) $(MAIN_HEADER) $(MAIN_DEFINE)


# Benchmark-specific driver programs:

DRIVERS         = driver-soft driver-sim driver-hard


# Common C routines that are needed:

GENERATE_VERILOG   = $(COMMON_DIR)/generate_verilog.o

COMMON_LIBRARY     = $(GENERATE_VERILOG)

COMMON_HARDWARE    = $(DRIVER_DIR)/interface.a

COMMON_INCLUDE     = $(COMMON_DIR)/generate_verilog.h \
                     $(COMMON_DIR)/interface.h \
                     $(COMMON_DIR)/util.h \
                     $(COMMON_DIR)/tval.h

COMMON_FILES       = $(COMMON_LIBRARY) $(COMMON_INCLUDE)


# C Compiler flags

CC     = gcc
CFLAGS = -g -I$(COMMON_DIR) -I../src
LFLAGS = -lm


#---------------------------------------------------------------------


.PHONY: default soft sim sims vectors driver drivers ppr compile syn bench \
	clean realclean common_clean common_realclean interface_clean \
	interface_realclean driver_clean all_clean all_realclean


# Default targets:

default: all

all: soft bench vectors sim syn sims compile report ppr run


# Report results though software and virtual wires compilation:

results: soft compile report


# Report results though software and virtual wires compilation:

distresults: soft distcompile report


# Compile and execute small benchmark on the hardware:

checkhard: $(BENCHSMALL:.v=.ppr) $(BENCHSMALL:.v=.run)


# Build distribution netlists:

distbuild: bench syn


# Check (simulate) specified distribution netlists:

check: $(BENCHCHECK:.v=.distsim) $(BENCHCHECK:.v=_vmw.distsim)


# Compile hardware from distribution netlists:

distcompile: $(BENCH_DISTCOMPILE)


# Report VMW compile statistics (number of FPGAs, cycles count etc.)

report: $(BENCH_REPORT)


# download configuration (load) and drive hardware (hard)

run: $(BENCH_RUN)


# drive hardware: (use run instead)

#hard: $(BENCH_HARD)


# download configuration to the reconfigurable hardware: (use run instead)

#load: $(BENCH_LOAD)


# run software version:

soft: $(BENCH_SOFT)


# run behavioral simulation (second version doesn't rebuid):

sim: $(BENCH_SIM)

distsim: $(BENCH_DISTSIM)


# run synthesized simulation (second version doesn't rebuid):

sims: $(BENCH_SIMS)

distsims: $(BENCH_DISTSIMS)


# drive simulation test vectors:

vectors: $(BENCH_VECTORS)


# compile all driver versions:

driver: drivers

drivers: $(DRIVERS)


# FPGA place and routes:

ppr: $(BENCH_PPR)


# virual wires compilation:

compile: $(BENCH_COMPILE)


# synthesize design:

syn: $(BENCH_SYN) $(INTERFACE_SYN)


# generate benchmarks:

bench: $(BENCHMARKS)


#---------------------------------------------------------------------

# Execute software version:

%.soft: driver-soft
	rm -f $@
	@echo "Executing software version $(BENCHNAME) $@..."
	@echo "(log file: $@.log)"
	echo $(basename $@) > $@.sed
	-driver-soft `sed "s/_/ /g" $@.sed` > $@.log
	rm -f $@.sed
	-grep -i Result $@.log
	touch $@


#---------------------------------------------------------------------


# Simulate synthesized design:

%_vmw.sim: %_vmw.v %.vectors \
               $(SIMS_FILES) $(MAIN_FILES)
	@echo "Simulating $(BENCHNAME) $(@:.sim=.v)...(log file: $@.log)"
	@echo " (note: ignored Error 1's are expected)"
	rm -f $@
	cp -p $(@:_vmw.sim=.vectors) vectors.v
	$(SIMULATOR) $(SIMFLAGS) $(SIMS_FILES) $(@:.sim=.v) > $@.log
	rm -f vectors.v
	-grep -i error $@.log
	touch $@


# Simulate unsynthesized design:

%.sim: %.v %.vectors \
	$(SIM_FILES) $(MAIN_FILES)
	@echo "Simulating $(BENCHNAME) $(@:.sim=.v)...(log file: $@.log)"
	@echo " (note: ignored Error 1's are okay)"
	rm -f $@
	cp -p $(@:.sim=.vectors) vectors.v
	$(SIMULATOR) $(SIMFLAGS) $(SIM_FILES) $(@:.sim=.v) > $@.log
	rm -f vectors.v
	-grep -i error $@.log
	touch $@


# Generating simulation vectors:

%.vectors: driver-sim
	@echo "Generating simulation vectors $(BENCHNAME) $@..."
	echo $(basename $@) > $@.sed
	driver-sim `sed "s/_/ /g" $@.sed` > $@
	rm -f $@.sed


#---------------------------------------------------------------------


# Simulate synthesized design from distribution (don't rebuid):

%_vmw.distsim: %.vectors \
               $(SIMS_FILES) $(MAIN_FILES)
	@echo \
	"Simulating $(BENCHNAME) $(@:.distsim=.v)...(log file: $@.log)"
	@echo " (note: ignored Error 1's are okay)"
	rm -f $@
	cp -p $(@:_vmw.distsim=.vectors) vectors.v
	$(SIMULATOR) $(SIMFLAGS) $(SIMS_FILES) $(@:.distsim=.v) > $@.log
	rm -f vectors.v
	-grep -i error $@.log
	touch $@


# Simulate unsynthesized design  from distribution (don't rebuid):

%.distsim: %.vectors \
	$(SIM_FILES) $(MAIN_FILES)
	@echo \
	"Simulating $(BENCHNAME) $(@:.distsim=.v)...(log file: $@.log)"
	@echo " (note: ignored Error 1's are okay)"
	rm -f $@
	cp -p $(@:.distsim=.vectors) vectors.v
	$(SIMULATOR) $(SIMFLAGS) $(SIM_FILES) $(@:.distsim=.v) > $@.log
	rm -f vectors.v
	-grep -i error $@.log
	touch $@


#---------------------------------------------------------------------


# Load and drive hardware:

%.run: %.load %.hard
	@echo \
	"Finished running hardware for $(BENCHNAME) $(@:.run=)."

# Load hardware (Set speed, configure and enable design):

%.load:
	@echo \
	"Loading $(BENCHNAME) $(@:.load=) on hardware...(log file: $@.log)"
	echo "connect" > $@.script
	echo "speed $(VLE_SPEED)" >> $@.script
	echo "configure system -probe probe_window_0.pbw/system0" >>$@.script
	echo "enable" >> $@.script
	(rsh $(VLE_HOST) "cd /home/ac1; cd `pwd`/$(@:.load=.vmw); vrun") < \
	 $@.script |tee $@.log
	rm -f $@.script
	@echo " "

# Drive hardware:

%.hard: driver-hard
	@echo \
	"Driving hardware for $(BENCHNAME) $(basename $@)...(log file: $@.log)"
	echo $(basename $@) > $@.sed
	(rsh $(VLE_HOST) "cd /home/ac1; cd `pwd`; driver-hard `sed \"s/_/ /g\" $@.sed`") \
	 > $@.log
	rm -f $@.sed
	grep -i result $@.log


#---------------------------------------------------------------------


# FPGA Place and Route:

%.ppr: %.compile
	@echo \
	"Running FPGA place,route for $(BENCHNAME) $@...(log file: $@.log)"
	rm -f $@
	cat $(HOSTS_FILE) > $(@:.ppr=.vmw)/machlist.mach
	(cd $(@:.ppr=.vmw); gmake -f params.mak pprrun) |tee $@.log
	touch $@


#---------------------------------------------------------------------


# Create directory for VirtuaLogic:

$(BENCH_DIRAUX):
	rm -f $@
	-mkdir $(@:.aux=.vmw)
	touch $@
	@echo "Created VirtualLogic sub-directory $(@:.aux=.vmw)."


# Copy include files into VirtuaLogic directory, add link to benchmark:

%.cp: %.aux $(INTERFACE_SYN) $(INTERFACE_FILES)
	@echo "Copying files from $(TEMPLATE_DIR) to $(@:.cp=.vmw)..."
	rm -f $@
	cp -pr $(TEMPLATE_DIR)/* $(@:.cp=.vmw)/
	@echo "Copying $(INTERFACE) interface files to $(@:.cp=.vmw)..."
	cp -p $(INTERFACE_DIR)/vmw.clk $(@:.cp=.vmw)/
	cp -p $(INTERFACE_DIR)/vmw.pod $(@:.cp=.vmw)/
	cp -p $(INTERFACE_DIR)/interface_vmw.v $(@:.cp=.vmw)/
	cp -p $(INTERFACE_DIR)/system_vmw.v $(@:.cp=.vmw)/
	echo "# VMW Configuration $(VLE_VERSION)" > $(@:.cp=.vmw)/params.mak
	echo CFG = `pwd`/$(@:.cp=.vmw) >> $(@:.cp=.vmw)/params.mak
	echo NUM_BOARDS = $(MAX_BOARDS) >> $(@:.cp=.vmw)/params.mak
	cat $(INTERFACE_DIR)/params.mak >> $(@:.cp=.vmw)/params.mak
	@echo "Linking $(@:.cp=.vmw)/main_vmw.v -> $(@:.cp=_vmw.v)"
	-ln -s ../$(@:.cp=_vmw.v) $(@:.cp=.vmw)/main_vmw.v
	touch $@


# synthesize instantiated templates with synthesizer behavioral compiler:

%.expand.v: %.template.v $(LIBRARY_FILE) $(MAIN_FILES) WORK.aux
	@echo "Synthesizing $(BENCHNAME) $@... (log file: $@.log)..."
	echo "FILE=$*.template; TOP=dummy_node; SYN_LIB=$(SYN_LIB)" > $@.syn
	echo "include $(VERILOG2VLE)" >> $@.syn
	$(SYN_SHELL) < $@.syn > $@.log
	mv -f $*.template_vmw.v $@
	rm -f $@.syn
	-grep -i error $@.log


# flatten synthesized templated into final netlist:

%_vmw.v: %.expand.v %.post.v $(LIBRARY_FILE) $(MAIN_FILES) WORK.aux
	@echo "Synthesizing $(BENCHNAME) $@... (log file: $@.log)"
	cat $*.expand.v $*.post.v > $*.cat.v
	echo "FILE=$*.cat; TOP=main; SYN_LIB=$(SYN_LIB)" > $@.syn
	echo "include $(FLATTEN_VLE)" >> $@.syn
	$(SYN_SHELL) < $@.syn >> $@.log
	mv -f $*.cat_vmw.v $@
	rm -f $@.syn $*.cat.v
	-grep -i error $@.log
#	mv -f $*.cat.area $*_vmw.area
#	mv -f $*.cat.timing $*_vmw.timing


#---------------------------------------------------------------------


# VirtuaLogic Compile:

%.compile: %_vmw.v %.cp
	@echo "Virtual wires compiling $(BENCHNAME) ...(log file: $@.log)"
	rm -f $@
	(cd $(@:.compile=.vmw); gmake -f params.mak compile) > $@.log
	touch $@


# VirtuaLogic Compile (from distribution, i.e. don't rebuild _vmw.v files):

%.distcompile: %.cp
	@echo "Virtual wires compiling $(BENCHNAME) ...(log file: $@.log)"
	rm -f $@
	(cd $(@:.distcompile=.vmw); gmake -f params.mak compile) > $@.log
	touch $@

#---------------------------------------------------------------------


# Copy include header files from include area to benchmark area:

$(MAIN_HEADER): $(COMMON_DIR)/$(MAIN_HEADER)
	@echo "Copying verilog include file $@ from $(COMMON_DIR)..."
	echo "/* Auto-generated file */" > $@
	echo "\`include \"main_define.v\" " >> $@
	echo "\`include \"$(LIBRARY_FILE)\" " >> $@
	cat $(COMMON_DIR)/$@ >> $@


# Copy include trail and define files from include area to benchmark area:

$(MAIN_TRAILER) $(MAIN_DEFINE): %: $(COMMON_DIR)/%
	@echo "Copying verilog include file $@ from $(COMMON_DIR)..."
	cp -p $(COMMON_DIR)/$@ $@


# Run benchmark-specific topology generator program:

$(BENCHMARKS) $(BENCH_TEMPLATE) $(BENCH_POST): generate $(LIBRARY_FILE)
	@echo "Generating $(BENCHNAME) $@..."
	echo $(basename $(basename $@)) > $@.sed
	generate `sed "s/_/ /g" $@.sed`
	mv generated.v $(basename $(basename $@)).v
	mv generated.template.v $(basename $(basename $@)).template.v
	mv generated.post.v $(basename $(basename $@)).post.v
	rm -f $@.sed


# Compile benchmark-specific generate program:

generate: $(GENERATE_FILES) $(COMMON_FILES)
	@echo "Compiling and linking $(BENCHNAME) $@ program..."
	$(CC) $(CFLAGS) -o $@ $(GENERATE_FILES) $(COMMON_LIBRARY) $(LFLAGS)


#---------------------------------------------------------------------


# Compile benchmark-specific software driver program:

driver-soft: $(DRIVER_FILES) $(COMMON_FILES)
	@echo "Compiling and linking $(BENCHNAME) $@ program..."
	$(CC) $(CFLAGS) -O4 -DSOFTWARE \
              -o $@ $(DRIVER_FILES) $(COMMON_LIBRARY) $(LFLAGS)


# Compile benchmark-specific simulator driver program:

driver-sim: $(DRIVER_FILES) $(COMMON_FILES)
	@echo "Compiling and linking $(BENCHNAME) $@ program..."
	$(CC) $(CFLAGS) -DSIMULATION \
              -o $@ $(DRIVER_FILES) $(COMMON_LIBRARY) $(LFLAGS)


# Compile benchmark-specific hardware driver program:

driver-hard: $(DRIVER_FILES) $(COMMON_FILES) $(COMMON_HARDWARE)
	@echo "Compiling and linking $(BENCHNAME) $@ program..."
	$(CC) $(CFLAGS) -DHARDWARE \
              -o $@ $(DRIVER_FILES) $(COMMON_LIBRARY) $(COMMON_HARDWARE) \
		    $(LFLAGS)


#---------------------------------------------------------------------


# Compile $(GENERATE_VERILOG), used by benchmark-specific generate program:

$(GENERATE_VERILOG): %.o : %.c
	@echo "Compiling $(BENCHNAME) $@..."
	$(CC) $(CFLAGS) -c $(basename $@).c -o $@


#---------------------------------------------------------------------


# synthesize interface verilog routines with synthesizer:

$(INTERFACE_SYN): %_vmw.v : %.v %.syn \
                  $(INTERFACE_DIR)/$(MAIN_DEFINE) \
                  $(INTERFACE_DIR)/WORK.aux
	@echo "Synthesizing $(BENCHNAME) $@...(log file: $@.log)"
	(cd $(INTERFACE_DIR); $(SYN_SHELL) < $(@F:_vmw.v=.syn)) > $@.log
	-grep -i error $@.log


# Copy main_define from common to interface: (used by system.v)

$(INTERFACE_DIR)/$(MAIN_DEFINE): $(COMMON_DIR)/$(MAIN_DEFINE)
	@echo "Copying $< to $@..."
	cp -p $< $@


# Copy interface.h from driver to common:

$(COMMON_DIR)/interface.h: $(DRIVER_DIR)/interface.h
	@echo "Copying $< to $@..."
	cp -p $< $@


# Re-build the interface.a library:

$(INTERFACE_DIR)/driver/interface.a: %.a : %.c
	@echo "Building $@..."
	(cd $(INTERFACE_DIR)/driver; gmake interface.a)

#---------------------------------------------------------------------

%.report:
	rm -f $@
	touch dummy.aux
	echo "Benchmark-name $(BENCHNAME)" > $@
	echo "Benchmark-case $(@:.report=)" >> $@
	-grep -i "Result" $(@:.report=.soft.log) \
	| awk '{print $$2, " ", $$3 }' >> $@
	-(cd $(@:.report=.vmw); grep -i "fpga cost" system.stats | sort +3n \
	| awk '{sum += $$4}; END {print "Hardware-total-gates ", sum}' \
	>> ../$@)
	-(cd $(@:.report=.vmw); grep -i "blks" system.stats | grep -i "mem" \
	| sort +3n \
	| awk '{sum += $$2}; END {print "Hardware-useful-gates ", sum}' \
	>> ../$@)
	-(cd $(@:.report=.vmw); wc ../dummy.aux *.tsk \
	| grep total | awk '{print "Hardware-FPGA-count ",$$1 }'  >> ../$@)
	-(cd $(@:.report=.vmw); grep -i "virtual cycles" system.stats \
	| awk '{sum += $$4}; END {print "Hardware-virtual-cycles: ", sum}'  \
	>> ../$@)
	-more $@ | awk '{print $$2}' | \
	awk 'BEGIN {FS="\n";RS=""} \
		{sspeed=$$6/$(SPEED_UNITS); \
		 if($$10) hclk=$(REPORT_CLOCK)/$$10; \
		 if($$5) hspeed=(hclk*$(CLOCK_UNITS))/($$5*$(SPEED_UNITS));\
		 if($$6) speedup=hspeed/sspeed;\
		 if($$9) speedup_per_fpga=speedup/$$9; \
		 printf("%s %s %d %d %d %.4g %d %d %d %d %.4g %.4g %.4g %.4g\n", \
		 $$1, $$2, $$3, $$4, $$5, sspeed, $$7, $$8, $$9, $$10, \
		 hclk, hspeed, speedup, speedup_per_fpga)}' \
  	 | head -1 > $(@:.report=.summary)
	-rm -f dummy.aux
	-more $@

#---------------------------------------------------------------------


# Create working directory for synthesizer:

WORK.aux $(INTERFACE_DIR)/WORK.aux:
	rm -f $@
	-mkdir $(basename $@)
	touch $@
	@echo "Created working directory $(basename $@)."


#---------------------------------------------------------------------


# Clean up:

clean:
	@echo "Cleaning $(BENCHNAME) Suite..."
	-rm -f *~ *.o *.aux *.log verilog.key *.script
	-rm -f *.soft *.hard *.vectors *.sed *.syn *.sim *.distsim
	-rm -f vectors.v generated.v generated.template.v generated.post.v
	-rm -f *.ppr *.compile *.cp 
	-rm -f $(BENCH_TEMPLATE) $(BENCH_POST) $(BENCH_EXPAND)

distclean: all_clean
	@echo "Distcleaning $(BENCHNAME) Suite..."
	-rm -f generate $(MAIN_FILES) $(LOCAL_FILES)
	-rm -f driver-soft driver-sim driver-hard
	-rm -rf $(BENCH_DIR) WORK
	-rm -f *.area *.timing *.report *.summary

realclean: distclean
	@echo "Realcleaning $(BENCHNAME) Suite..."
	-rm -f $(BENCHMARKS) $(BENCH_SYN)

# Clean common area:

common_clean:
	(cd $(COMMON_DIR); gmake clean)

common_realclean:
	(cd $(COMMON_DIR); gmake realclean)


# Clean interface area:

interface_clean:
	(cd $(INTERFACE_DIR); gmake clean)

interface_realclean:
	(cd $(INTERFACE_DIR); gmake realclean)


# Clean up driver area:

driver_clean:
	(cd $(DRIVER_DIR); gmake clean)

driver_realclean:
	(cd $(DRIVER_DIR); gmake realclean)


# Clean up everything:

all_clean: clean \
           interface_clean \
           common_clean \
           driver_clean

all_realclean: realclean \
               interface_realclean \
               common_realclean \
               driver_realclean

#---------------------------------------------------------------------
