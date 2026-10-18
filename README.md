# RTL-to-GDSII ASIC Design Flow

A complete digital ASIC implementation and verification flow using open-source EDA tools.

## EDA Toolstack
* **Simulation & Verification:** Verilator 5, Icarus Verilog, GTKWave
* **Logic Synthesis:** Yosys
* **Static Timing Analysis (STA):** OpenSTA
* **Physical Design (RTL-to-GDSII):** OpenLane / OpenROAD
* **Process Design Kit (PDK):** SkyWater 130nm (`sky130`)

---

## Roadmap & Progress

- [ ] **01_rtl_and_ip/** — RTL Design & IP Integration
  - [x] 2-input AND Gate (`and_gate/`)
  - [x] 4:1 Multiplexer (`mux4x1_gatelevel/`, `mux4x1_dataflow/`, `mux4x1_behavioral/`)
  - [ ] Adders & Arithmetic Units
  - [ ] Flip-Flops & Counters
  - [ ] UART Receiver IP
  - [ ] APB Bus Interface & APB-UART Bridge
  - [ ] Clock Gating & Reset Architectures

- [ ] **02_advanced_rtl_cdc/** — Advanced RTL & CDC/RDC Handling
  - [ ] Metastability demonstration without synchronizer
  - [ ] 2-stage Flip-Flop Synchronizer
  - [ ] Reset Domain Crossing (RDC) synchronization logic

- [ ] **03_synthesis_sta/** — RTL Synthesis & Static Timing Constraints
  - [ ] Technology mapping with Yosys
  - [ ] SDC timing constraints (`create_clock`, `set_input_delay`, etc.)
  - [ ] Area, timing, and power trade-offs
  - [ ] 16-bit ALU synthesis & netlist optimization

- [ ] **04_physical_awareness/** — Standard Cells, Liberty (.lib), LEF/DEF & Parasitics
  - [ ] Liberty file (.lib) characterization & timing arcs
  - [ ] Physical layout abstracts (LEF) and placement (DEF)
  - [ ] Parasitic extraction (SPEF) and RC delay impact
  - [ ] Setup and hold slack reports with OpenSTA

- [ ] **05_rtl_to_gdsii/** — Full Physical Design Flow
  - [ ] OpenLane automated flow execution
  - [ ] Floorplanning, power distribution network (PDN), and standard cell placement
  - [ ] Clock Tree Synthesis (CTS)
  - [ ] Global & Detailed Routing
  - [ ] Physical verification: DRC and LVS checks

- [ ] **06_riscv_axi_soc/** — RISC-V SoC Subsystem with AXI Interconnect
  - [ ] PicoRV32 core integration
  - [ ] AXI-Lite crossbar & interconnect
  - [ ] Memory-mapped UART peripheral
  - [ ] Firmware development in C / Assembly
  - [ ] Full subsystem waveform verification & OpenLane ASIC signoff

---

## Quickstart (Module 01 Labs)

To run simulation on any lab design:

```bash
cd 01_rtl_and_ip/<lab_name>
make sim    # Compiles with Verilator 5 and runs the testbench
make wave   # Opens GTKWave with generated .vcd waveforms
make clean  # Removes obj_dir and simulation logs
```
