# proj_buscross

A Vivado 2017.4 project that consists of a build to test the powlib crossbar on the Nexys DDR 4 board.

## Introduction


## Prerequisites

+ **Icarus Verilog**: This is the simulator, though others can be configured with enough experience with cocotb.
+ **Vivado 2017.4**: This is the electronic design automation tools used to build the design for the Digilent Nexys 4 DDR board.
    + **Digilent Nexys 4 DDR board file**: The Vivado project requires [a board file which can be found in a Digilent repo](https://github.com/Digilent/vivado-boards).
+ **Digilent Nexys 4 DDR board**: This is the board the design is targetting.

## File Structure

+ **cocotb**: Submodule that contains cocotb, a dependency of the simulations.
+ **hdl**: Contains the source specific to the project.
    + **behav**: Contains the sources related solely to simulation.
    + **both**: Contains the sources needed by both simulation and synthesis.
    + **synth**: Contains the sources solely needed by the physical build.
+ **simlib**: Contains the powlib simulation library, a dependency of the simulations.
+ **powlib**: Contains the powlib hardware description library. The powlib crossbar can be found here.
+ **tcf**: Contains the simulation test case files.
+ **proj**: Contains the vivado project folder.

## Design

The design will be developed in several steps. More steps will be introduced until all the features of the powlib crossbar are tested.

1. **block-ram-step**: This build will consists of a Xilinx Microblaze system connected to a powlib crossbar system.
