# ==============================================================================
# Makefile: Verilator Simulation Flow
# ==============================================================================

TOP       ?= mux4x1_dataflow_tb
RTL_SRCS  ?= $(wildcard rtl/*.v)
TB_SRCS   ?= $(wildcard tb/*.v)
WAVE_FILE ?= mux4x1_dataflow_dump.vcd

.PHONY: all sim build wave clean

all: sim

# Step 1: Compile with Verilator 5
build:
	verilator --binary -Wall $(RTL_SRCS) $(TB_SRCS) --top $(TOP) --timing --trace

# Step 2: Run simulation executable
sim: build
	./obj_dir/V$(TOP)

# Step 3: View waveforms in GTKWave
wave:
	gtkwave $(WAVE_FILE) &

# Clean build artifacts
clean:
	rm -rf obj_dir *.vcd *.fst
