# proj_buscross

A Vivado 2017.4 project that consists of a build to test the powlib crossbar on the Nexys DDR 4 board.

## Introduction

The purpose of this project is to perform a simple test of the powlib crossbar on hardware. 

## Prerequisites

+ **Icarus Verilog**: This is the simulator, though others can be configured with enough experience with cocotb.
+ **Vivado 2017.4**: This is the electronic design automation tools used to build the design for the Digilent Nexys 4 DDR board.
    + **Digilent Nexys 4 DDR board file**: The Vivado project requires [a board file which can be found in a Digilent repo](https://github.com/Digilent/vivado-boards).
+ **Digilent Nexys 4 DDR board**: This is the board the design is targetting.

## Downloading Repository

It is recommended the repository is cloned, since the submodules are not included with a download. The following is the git command.

```
git clone https://github.com/powlib/proj_buscross.git --recursive
```

## File Structure

+ **cocotb**: Submodule that contains cocotb, a dependency of the simulations.
+ **hdl**: Contains the source specific to the project.
    + **behav**: Contains the sources related solely to simulation.
        + **xilinx_ip_wrapper_behav.v**: Functional model of the Microblaze system, generated in Vivado. 
    + **both**: Contains the sources needed by both simulation and synthesis.
        + **proj_top.v**: Top-level verilog module.
    + **synth**: Contains the sources solely needed by the physical build.
        + **xilinx_ip/xilinx_ip.bd**: Block design. Opened with Vivado 2017.4. This block design contains the Microblaze systemt that interfaces with the crossbar.
        + **xilinx_ip_wrapper.v**: Wrapper of the block design.
+ **sdk**: Contains the SDK 2017.4 workspace, where all the software that runs on the Microblze is located. After SDK is configured with this folder as the workspace, the projects should be imported into the workspace. An error may appear regarding the creation of the hardware platform, but this message can be ignored.
    + **proj_app_0**: Application project. Contains the top-level software that runs on the Microblaze. The main.c file describes the operation of the Microblaze. Depends on the board support package.
    + **standalone_bsp_0**: Board support package. Contains the drivers necessary to run the application project. Depends on the hardware platform.
    + **proj_top_hw_platform_0**: Hardware platform. Contains the hardware description---generated from the block design in Vivado---and the bitstream---built from the entire design in Vivado.
+ **simlib**: Contains the powlib simulation library, a dependency of the simulations.
+ **powlib**: Contains the powlib hardware description library. The powlib crossbar can be found here.
+ **tcf**: Contains the simulation test case files.
    + **test_proj.py**: Test case file. Drives the functional model of the Microblaze system in simulation, and waits until the design either returns a success or times out. Simply run make in the tcf folder to execute the test, assuming Icarus Verilog or another cocotb-valid simulator is configured.
+ **proj**: Contains the vivado project folder.
    + **proj.xpr**: Vivado project file. Open this in Vivado 2017.4 to view and build the project. Before the full design---proj_top is top---can be built, the block design should be generated with Out of context per Block Design and the application project should be compiled to create the ELF.

## Design

The design will be developed in several steps. More steps will be introduced until all the features of the powlib crossbar are tested.

1. [x] **block-ram-step**: This build consists of a Xilinx Microblaze system connected to a powlib crossbar system.
2. [x] **dma-step**: DMA is included in order to verify burst transactions.
3. [x] **software-step**: Software is developed to write some fake data into a RAM connected to the crossbar. The DMA is used to copy the data from the original RAM to another one. The data from both RAMs are read and compared with each other.
4. [ ] **asynchronous-step**: Extra RAMs on different clock domains are connected to the crossbar.
5. [ ] **software-extended-step**: Software is extended such that it performs a comprehensive test that includes the extra RAMs added in step 4.
