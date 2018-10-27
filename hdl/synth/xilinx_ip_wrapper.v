//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
//Date        : Fri Oct 26 20:55:34 2018
//Host        : andrewandrepowell-desktop running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target xilinx_ip_wrapper.bd
//Design      : xilinx_ip_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xilinx_ip_wrapper
   (M01_AXI_0_araddr,
    M01_AXI_0_arprot,
    M01_AXI_0_arready,
    M01_AXI_0_arvalid,
    M01_AXI_0_awaddr,
    M01_AXI_0_awprot,
    M01_AXI_0_awready,
    M01_AXI_0_awvalid,
    M01_AXI_0_bready,
    M01_AXI_0_bresp,
    M01_AXI_0_bvalid,
    M01_AXI_0_rdata,
    M01_AXI_0_rready,
    M01_AXI_0_rresp,
    M01_AXI_0_rvalid,
    M01_AXI_0_wdata,
    M01_AXI_0_wready,
    M01_AXI_0_wstrb,
    M01_AXI_0_wvalid,
    clk_in1_0,
    clk_out1_0,
    reset_0);
  output [31:0]M01_AXI_0_araddr;
  output [2:0]M01_AXI_0_arprot;
  input M01_AXI_0_arready;
  output M01_AXI_0_arvalid;
  output [31:0]M01_AXI_0_awaddr;
  output [2:0]M01_AXI_0_awprot;
  input M01_AXI_0_awready;
  output M01_AXI_0_awvalid;
  output M01_AXI_0_bready;
  input [1:0]M01_AXI_0_bresp;
  input M01_AXI_0_bvalid;
  input [31:0]M01_AXI_0_rdata;
  output M01_AXI_0_rready;
  input [1:0]M01_AXI_0_rresp;
  input M01_AXI_0_rvalid;
  output [31:0]M01_AXI_0_wdata;
  input M01_AXI_0_wready;
  output [3:0]M01_AXI_0_wstrb;
  output M01_AXI_0_wvalid;
  input clk_in1_0;
  output clk_out1_0;
  input reset_0;

  wire [31:0]M01_AXI_0_araddr;
  wire [2:0]M01_AXI_0_arprot;
  wire M01_AXI_0_arready;
  wire M01_AXI_0_arvalid;
  wire [31:0]M01_AXI_0_awaddr;
  wire [2:0]M01_AXI_0_awprot;
  wire M01_AXI_0_awready;
  wire M01_AXI_0_awvalid;
  wire M01_AXI_0_bready;
  wire [1:0]M01_AXI_0_bresp;
  wire M01_AXI_0_bvalid;
  wire [31:0]M01_AXI_0_rdata;
  wire M01_AXI_0_rready;
  wire [1:0]M01_AXI_0_rresp;
  wire M01_AXI_0_rvalid;
  wire [31:0]M01_AXI_0_wdata;
  wire M01_AXI_0_wready;
  wire [3:0]M01_AXI_0_wstrb;
  wire M01_AXI_0_wvalid;
  wire clk_in1_0;
  wire clk_out1_0;
  wire reset_0;

  xilinx_ip xilinx_ip_i
       (.M01_AXI_0_araddr(M01_AXI_0_araddr),
        .M01_AXI_0_arprot(M01_AXI_0_arprot),
        .M01_AXI_0_arready(M01_AXI_0_arready),
        .M01_AXI_0_arvalid(M01_AXI_0_arvalid),
        .M01_AXI_0_awaddr(M01_AXI_0_awaddr),
        .M01_AXI_0_awprot(M01_AXI_0_awprot),
        .M01_AXI_0_awready(M01_AXI_0_awready),
        .M01_AXI_0_awvalid(M01_AXI_0_awvalid),
        .M01_AXI_0_bready(M01_AXI_0_bready),
        .M01_AXI_0_bresp(M01_AXI_0_bresp),
        .M01_AXI_0_bvalid(M01_AXI_0_bvalid),
        .M01_AXI_0_rdata(M01_AXI_0_rdata),
        .M01_AXI_0_rready(M01_AXI_0_rready),
        .M01_AXI_0_rresp(M01_AXI_0_rresp),
        .M01_AXI_0_rvalid(M01_AXI_0_rvalid),
        .M01_AXI_0_wdata(M01_AXI_0_wdata),
        .M01_AXI_0_wready(M01_AXI_0_wready),
        .M01_AXI_0_wstrb(M01_AXI_0_wstrb),
        .M01_AXI_0_wvalid(M01_AXI_0_wvalid),
        .clk_in1_0(clk_in1_0),
        .clk_out1_0(clk_out1_0),
        .reset_0(reset_0));
endmodule
