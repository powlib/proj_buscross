//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Feb  5 07:29:31 2019
//Host        : MININT-EE5P02Q running 64-bit major release  (build 9200)
//Command     : generate_target xilinx_ip_wrapper.bd
//Design      : xilinx_ip_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xilinx_ip_wrapper
   (GPIO_0_tri_io,
    M01_AXI_0_araddr,
    M01_AXI_0_arburst,
    M01_AXI_0_arcache,
    M01_AXI_0_arid,
    M01_AXI_0_arlen,
    M01_AXI_0_arlock,
    M01_AXI_0_arprot,
    M01_AXI_0_arqos,
    M01_AXI_0_arready,
    M01_AXI_0_arregion,
    M01_AXI_0_arsize,
    M01_AXI_0_arvalid,
    M01_AXI_0_awaddr,
    M01_AXI_0_awburst,
    M01_AXI_0_awcache,
    M01_AXI_0_awid,
    M01_AXI_0_awlen,
    M01_AXI_0_awlock,
    M01_AXI_0_awprot,
    M01_AXI_0_awqos,
    M01_AXI_0_awready,
    M01_AXI_0_awregion,
    M01_AXI_0_awsize,
    M01_AXI_0_awvalid,
    M01_AXI_0_bid,
    M01_AXI_0_bready,
    M01_AXI_0_bresp,
    M01_AXI_0_bvalid,
    M01_AXI_0_rdata,
    M01_AXI_0_rid,
    M01_AXI_0_rlast,
    M01_AXI_0_rready,
    M01_AXI_0_rresp,
    M01_AXI_0_rvalid,
    M01_AXI_0_wdata,
    M01_AXI_0_wlast,
    M01_AXI_0_wready,
    M01_AXI_0_wstrb,
    M01_AXI_0_wvalid,
    clk,
    reset,
    rst,
    sys_clock);
  inout [15:0]GPIO_0_tri_io;
  output [31:0]M01_AXI_0_araddr;
  output [1:0]M01_AXI_0_arburst;
  output [3:0]M01_AXI_0_arcache;
  output [0:0]M01_AXI_0_arid;
  output [7:0]M01_AXI_0_arlen;
  output [0:0]M01_AXI_0_arlock;
  output [2:0]M01_AXI_0_arprot;
  output [3:0]M01_AXI_0_arqos;
  input M01_AXI_0_arready;
  output [3:0]M01_AXI_0_arregion;
  output [2:0]M01_AXI_0_arsize;
  output M01_AXI_0_arvalid;
  output [31:0]M01_AXI_0_awaddr;
  output [1:0]M01_AXI_0_awburst;
  output [3:0]M01_AXI_0_awcache;
  output [0:0]M01_AXI_0_awid;
  output [7:0]M01_AXI_0_awlen;
  output [0:0]M01_AXI_0_awlock;
  output [2:0]M01_AXI_0_awprot;
  output [3:0]M01_AXI_0_awqos;
  input M01_AXI_0_awready;
  output [3:0]M01_AXI_0_awregion;
  output [2:0]M01_AXI_0_awsize;
  output M01_AXI_0_awvalid;
  input [0:0]M01_AXI_0_bid;
  output M01_AXI_0_bready;
  input [1:0]M01_AXI_0_bresp;
  input M01_AXI_0_bvalid;
  input [31:0]M01_AXI_0_rdata;
  input [0:0]M01_AXI_0_rid;
  input M01_AXI_0_rlast;
  output M01_AXI_0_rready;
  input [1:0]M01_AXI_0_rresp;
  input M01_AXI_0_rvalid;
  output [31:0]M01_AXI_0_wdata;
  output M01_AXI_0_wlast;
  input M01_AXI_0_wready;
  output [3:0]M01_AXI_0_wstrb;
  output M01_AXI_0_wvalid;
  output clk;
  input reset;
  output rst;
  input sys_clock;

  wire [0:0]GPIO_0_tri_i_0;
  wire [1:1]GPIO_0_tri_i_1;
  wire [10:10]GPIO_0_tri_i_10;
  wire [11:11]GPIO_0_tri_i_11;
  wire [12:12]GPIO_0_tri_i_12;
  wire [13:13]GPIO_0_tri_i_13;
  wire [14:14]GPIO_0_tri_i_14;
  wire [15:15]GPIO_0_tri_i_15;
  wire [2:2]GPIO_0_tri_i_2;
  wire [3:3]GPIO_0_tri_i_3;
  wire [4:4]GPIO_0_tri_i_4;
  wire [5:5]GPIO_0_tri_i_5;
  wire [6:6]GPIO_0_tri_i_6;
  wire [7:7]GPIO_0_tri_i_7;
  wire [8:8]GPIO_0_tri_i_8;
  wire [9:9]GPIO_0_tri_i_9;
  wire [0:0]GPIO_0_tri_io_0;
  wire [1:1]GPIO_0_tri_io_1;
  wire [10:10]GPIO_0_tri_io_10;
  wire [11:11]GPIO_0_tri_io_11;
  wire [12:12]GPIO_0_tri_io_12;
  wire [13:13]GPIO_0_tri_io_13;
  wire [14:14]GPIO_0_tri_io_14;
  wire [15:15]GPIO_0_tri_io_15;
  wire [2:2]GPIO_0_tri_io_2;
  wire [3:3]GPIO_0_tri_io_3;
  wire [4:4]GPIO_0_tri_io_4;
  wire [5:5]GPIO_0_tri_io_5;
  wire [6:6]GPIO_0_tri_io_6;
  wire [7:7]GPIO_0_tri_io_7;
  wire [8:8]GPIO_0_tri_io_8;
  wire [9:9]GPIO_0_tri_io_9;
  wire [0:0]GPIO_0_tri_o_0;
  wire [1:1]GPIO_0_tri_o_1;
  wire [10:10]GPIO_0_tri_o_10;
  wire [11:11]GPIO_0_tri_o_11;
  wire [12:12]GPIO_0_tri_o_12;
  wire [13:13]GPIO_0_tri_o_13;
  wire [14:14]GPIO_0_tri_o_14;
  wire [15:15]GPIO_0_tri_o_15;
  wire [2:2]GPIO_0_tri_o_2;
  wire [3:3]GPIO_0_tri_o_3;
  wire [4:4]GPIO_0_tri_o_4;
  wire [5:5]GPIO_0_tri_o_5;
  wire [6:6]GPIO_0_tri_o_6;
  wire [7:7]GPIO_0_tri_o_7;
  wire [8:8]GPIO_0_tri_o_8;
  wire [9:9]GPIO_0_tri_o_9;
  wire [0:0]GPIO_0_tri_t_0;
  wire [1:1]GPIO_0_tri_t_1;
  wire [10:10]GPIO_0_tri_t_10;
  wire [11:11]GPIO_0_tri_t_11;
  wire [12:12]GPIO_0_tri_t_12;
  wire [13:13]GPIO_0_tri_t_13;
  wire [14:14]GPIO_0_tri_t_14;
  wire [15:15]GPIO_0_tri_t_15;
  wire [2:2]GPIO_0_tri_t_2;
  wire [3:3]GPIO_0_tri_t_3;
  wire [4:4]GPIO_0_tri_t_4;
  wire [5:5]GPIO_0_tri_t_5;
  wire [6:6]GPIO_0_tri_t_6;
  wire [7:7]GPIO_0_tri_t_7;
  wire [8:8]GPIO_0_tri_t_8;
  wire [9:9]GPIO_0_tri_t_9;
  wire [31:0]M01_AXI_0_araddr;
  wire [1:0]M01_AXI_0_arburst;
  wire [3:0]M01_AXI_0_arcache;
  wire [0:0]M01_AXI_0_arid;
  wire [7:0]M01_AXI_0_arlen;
  wire [0:0]M01_AXI_0_arlock;
  wire [2:0]M01_AXI_0_arprot;
  wire [3:0]M01_AXI_0_arqos;
  wire M01_AXI_0_arready;
  wire [3:0]M01_AXI_0_arregion;
  wire [2:0]M01_AXI_0_arsize;
  wire M01_AXI_0_arvalid;
  wire [31:0]M01_AXI_0_awaddr;
  wire [1:0]M01_AXI_0_awburst;
  wire [3:0]M01_AXI_0_awcache;
  wire [0:0]M01_AXI_0_awid;
  wire [7:0]M01_AXI_0_awlen;
  wire [0:0]M01_AXI_0_awlock;
  wire [2:0]M01_AXI_0_awprot;
  wire [3:0]M01_AXI_0_awqos;
  wire M01_AXI_0_awready;
  wire [3:0]M01_AXI_0_awregion;
  wire [2:0]M01_AXI_0_awsize;
  wire M01_AXI_0_awvalid;
  wire [0:0]M01_AXI_0_bid;
  wire M01_AXI_0_bready;
  wire [1:0]M01_AXI_0_bresp;
  wire M01_AXI_0_bvalid;
  wire [31:0]M01_AXI_0_rdata;
  wire [0:0]M01_AXI_0_rid;
  wire M01_AXI_0_rlast;
  wire M01_AXI_0_rready;
  wire [1:0]M01_AXI_0_rresp;
  wire M01_AXI_0_rvalid;
  wire [31:0]M01_AXI_0_wdata;
  wire M01_AXI_0_wlast;
  wire M01_AXI_0_wready;
  wire [3:0]M01_AXI_0_wstrb;
  wire M01_AXI_0_wvalid;
  wire clk;
  wire reset;
  wire rst;
  wire sys_clock;

  IOBUF GPIO_0_tri_iobuf_0
       (.I(GPIO_0_tri_o_0),
        .IO(GPIO_0_tri_io[0]),
        .O(GPIO_0_tri_i_0),
        .T(GPIO_0_tri_t_0));
  IOBUF GPIO_0_tri_iobuf_1
       (.I(GPIO_0_tri_o_1),
        .IO(GPIO_0_tri_io[1]),
        .O(GPIO_0_tri_i_1),
        .T(GPIO_0_tri_t_1));
  IOBUF GPIO_0_tri_iobuf_10
       (.I(GPIO_0_tri_o_10),
        .IO(GPIO_0_tri_io[10]),
        .O(GPIO_0_tri_i_10),
        .T(GPIO_0_tri_t_10));
  IOBUF GPIO_0_tri_iobuf_11
       (.I(GPIO_0_tri_o_11),
        .IO(GPIO_0_tri_io[11]),
        .O(GPIO_0_tri_i_11),
        .T(GPIO_0_tri_t_11));
  IOBUF GPIO_0_tri_iobuf_12
       (.I(GPIO_0_tri_o_12),
        .IO(GPIO_0_tri_io[12]),
        .O(GPIO_0_tri_i_12),
        .T(GPIO_0_tri_t_12));
  IOBUF GPIO_0_tri_iobuf_13
       (.I(GPIO_0_tri_o_13),
        .IO(GPIO_0_tri_io[13]),
        .O(GPIO_0_tri_i_13),
        .T(GPIO_0_tri_t_13));
  IOBUF GPIO_0_tri_iobuf_14
       (.I(GPIO_0_tri_o_14),
        .IO(GPIO_0_tri_io[14]),
        .O(GPIO_0_tri_i_14),
        .T(GPIO_0_tri_t_14));
  IOBUF GPIO_0_tri_iobuf_15
       (.I(GPIO_0_tri_o_15),
        .IO(GPIO_0_tri_io[15]),
        .O(GPIO_0_tri_i_15),
        .T(GPIO_0_tri_t_15));
  IOBUF GPIO_0_tri_iobuf_2
       (.I(GPIO_0_tri_o_2),
        .IO(GPIO_0_tri_io[2]),
        .O(GPIO_0_tri_i_2),
        .T(GPIO_0_tri_t_2));
  IOBUF GPIO_0_tri_iobuf_3
       (.I(GPIO_0_tri_o_3),
        .IO(GPIO_0_tri_io[3]),
        .O(GPIO_0_tri_i_3),
        .T(GPIO_0_tri_t_3));
  IOBUF GPIO_0_tri_iobuf_4
       (.I(GPIO_0_tri_o_4),
        .IO(GPIO_0_tri_io[4]),
        .O(GPIO_0_tri_i_4),
        .T(GPIO_0_tri_t_4));
  IOBUF GPIO_0_tri_iobuf_5
       (.I(GPIO_0_tri_o_5),
        .IO(GPIO_0_tri_io[5]),
        .O(GPIO_0_tri_i_5),
        .T(GPIO_0_tri_t_5));
  IOBUF GPIO_0_tri_iobuf_6
       (.I(GPIO_0_tri_o_6),
        .IO(GPIO_0_tri_io[6]),
        .O(GPIO_0_tri_i_6),
        .T(GPIO_0_tri_t_6));
  IOBUF GPIO_0_tri_iobuf_7
       (.I(GPIO_0_tri_o_7),
        .IO(GPIO_0_tri_io[7]),
        .O(GPIO_0_tri_i_7),
        .T(GPIO_0_tri_t_7));
  IOBUF GPIO_0_tri_iobuf_8
       (.I(GPIO_0_tri_o_8),
        .IO(GPIO_0_tri_io[8]),
        .O(GPIO_0_tri_i_8),
        .T(GPIO_0_tri_t_8));
  IOBUF GPIO_0_tri_iobuf_9
       (.I(GPIO_0_tri_o_9),
        .IO(GPIO_0_tri_io[9]),
        .O(GPIO_0_tri_i_9),
        .T(GPIO_0_tri_t_9));
  xilinx_ip xilinx_ip_i
       (.GPIO_0_tri_i({GPIO_0_tri_i_15,GPIO_0_tri_i_14,GPIO_0_tri_i_13,GPIO_0_tri_i_12,GPIO_0_tri_i_11,GPIO_0_tri_i_10,GPIO_0_tri_i_9,GPIO_0_tri_i_8,GPIO_0_tri_i_7,GPIO_0_tri_i_6,GPIO_0_tri_i_5,GPIO_0_tri_i_4,GPIO_0_tri_i_3,GPIO_0_tri_i_2,GPIO_0_tri_i_1,GPIO_0_tri_i_0}),
        .GPIO_0_tri_o({GPIO_0_tri_o_15,GPIO_0_tri_o_14,GPIO_0_tri_o_13,GPIO_0_tri_o_12,GPIO_0_tri_o_11,GPIO_0_tri_o_10,GPIO_0_tri_o_9,GPIO_0_tri_o_8,GPIO_0_tri_o_7,GPIO_0_tri_o_6,GPIO_0_tri_o_5,GPIO_0_tri_o_4,GPIO_0_tri_o_3,GPIO_0_tri_o_2,GPIO_0_tri_o_1,GPIO_0_tri_o_0}),
        .GPIO_0_tri_t({GPIO_0_tri_t_15,GPIO_0_tri_t_14,GPIO_0_tri_t_13,GPIO_0_tri_t_12,GPIO_0_tri_t_11,GPIO_0_tri_t_10,GPIO_0_tri_t_9,GPIO_0_tri_t_8,GPIO_0_tri_t_7,GPIO_0_tri_t_6,GPIO_0_tri_t_5,GPIO_0_tri_t_4,GPIO_0_tri_t_3,GPIO_0_tri_t_2,GPIO_0_tri_t_1,GPIO_0_tri_t_0}),
        .M01_AXI_0_araddr(M01_AXI_0_araddr),
        .M01_AXI_0_arburst(M01_AXI_0_arburst),
        .M01_AXI_0_arcache(M01_AXI_0_arcache),
        .M01_AXI_0_arid(M01_AXI_0_arid),
        .M01_AXI_0_arlen(M01_AXI_0_arlen),
        .M01_AXI_0_arlock(M01_AXI_0_arlock),
        .M01_AXI_0_arprot(M01_AXI_0_arprot),
        .M01_AXI_0_arqos(M01_AXI_0_arqos),
        .M01_AXI_0_arready(M01_AXI_0_arready),
        .M01_AXI_0_arregion(M01_AXI_0_arregion),
        .M01_AXI_0_arsize(M01_AXI_0_arsize),
        .M01_AXI_0_arvalid(M01_AXI_0_arvalid),
        .M01_AXI_0_awaddr(M01_AXI_0_awaddr),
        .M01_AXI_0_awburst(M01_AXI_0_awburst),
        .M01_AXI_0_awcache(M01_AXI_0_awcache),
        .M01_AXI_0_awid(M01_AXI_0_awid),
        .M01_AXI_0_awlen(M01_AXI_0_awlen),
        .M01_AXI_0_awlock(M01_AXI_0_awlock),
        .M01_AXI_0_awprot(M01_AXI_0_awprot),
        .M01_AXI_0_awqos(M01_AXI_0_awqos),
        .M01_AXI_0_awready(M01_AXI_0_awready),
        .M01_AXI_0_awregion(M01_AXI_0_awregion),
        .M01_AXI_0_awsize(M01_AXI_0_awsize),
        .M01_AXI_0_awvalid(M01_AXI_0_awvalid),
        .M01_AXI_0_bid(M01_AXI_0_bid),
        .M01_AXI_0_bready(M01_AXI_0_bready),
        .M01_AXI_0_bresp(M01_AXI_0_bresp),
        .M01_AXI_0_bvalid(M01_AXI_0_bvalid),
        .M01_AXI_0_rdata(M01_AXI_0_rdata),
        .M01_AXI_0_rid(M01_AXI_0_rid),
        .M01_AXI_0_rlast(M01_AXI_0_rlast),
        .M01_AXI_0_rready(M01_AXI_0_rready),
        .M01_AXI_0_rresp(M01_AXI_0_rresp),
        .M01_AXI_0_rvalid(M01_AXI_0_rvalid),
        .M01_AXI_0_wdata(M01_AXI_0_wdata),
        .M01_AXI_0_wlast(M01_AXI_0_wlast),
        .M01_AXI_0_wready(M01_AXI_0_wready),
        .M01_AXI_0_wstrb(M01_AXI_0_wstrb),
        .M01_AXI_0_wvalid(M01_AXI_0_wvalid),
        .clk(clk),
        .reset(reset),
        .rst(rst),
        .sys_clock(sys_clock));
endmodule
