# Default to verilog
TOPLEVEL_LANG ?= verilog

WPWD=$(shell sh -c 'pwd -W')
PWD=$(shell pwd)
PROJ=$(PWD)/..
COCOTB=$(PROJ)/cocotb/
SIM=icarus

$(info [$(CUSTOM_SIM_DEPS)])

ifeq ($(OS),Msys)
WPWD=$(shell sh -c 'pwd -W')
PYTHONPATH := $(PROJ)/simlib;$(PYTHONPATH)
else
WPWD=$(shell pwd)
PYTHONPATH := $(PROJ)/simlib:$(PYTHONPATH)
endif

ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES = $(PROJ)/powlib/*.v $(PROJ)/hdl/behav/*.v $(PROJ)/hdl/both/*.v $(PWD)/*.v
    COMPILE_ARGS = -g 2001 -I $(PROJ)/powlib/     
    TOPLEVEL = test_proj
else
    $(error "A valid value (verilog) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG)")
endif

MODULE=test_proj

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

