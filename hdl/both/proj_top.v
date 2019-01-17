`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2019 12:42:22 AM
// Design Name: 
// Module Name: proj_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module proj_top(sys_clock,reset,GPIO_0_tri_io);

`include "powlib_std.vh"
`include "powlib_ip.vh" 
    
  localparam                                LEDW            = 16;
  localparam                                LITE_IDW        = 1;
  localparam                                LITE_ID         = 1'd0;
  localparam                                LITE_LEN        = 8'd0;
  localparam                                LITE_SIZE       = 3'd2;
  localparam                                LITE_BURST      = `AXI_INCRBT;
  localparam                                RAM_D           = 8;
  localparam                                RAM_S           = 0;
  localparam                                TOTAL_INTRS     = 3;
  localparam                                IPSAXI_OFFSET   = 0;
  localparam                                IPRAM0_OFFSET   = 1;
  localparam                                IPRAM1_OFFSET   = 2;
  localparam                                EAR             = 0;
  localparam                                EDBG            = 0;
  localparam                                B_BPD           = 4;
  localparam                                B_AW            = `POWLIB_BW*B_BPD;
  localparam                                B_DW            = `POWLIB_BW*B_BPD; 
  localparam                                B_BEW           = B_BPD;
  localparam                                B_OPW           = `POWLIB_OPW;
  localparam                                OFF_0           = 0;
  localparam                                OFF_1           = OFF_0+B_DW;
  localparam                                OFF_2           = OFF_1+B_BEW;
  localparam                                OFF_3           = OFF_2+B_OPW;
  localparam                                B_WW            = OFF_3;  
  localparam                                B_BASES         = {32'h44A10000,32'h44A00000,32'h50000000};
  localparam                                B_SIZES         = {32'h0000FFFF,32'h0000FFFF,32'h0000FFFF};  
    
  input wire                        sys_clock, reset;
  inout wire [LEDW-1:0]             GPIO_0_tri_io;
  
        wire [TOTAL_INTRS-1:0]      clks, rsts;
  
        // Bus Interface signals
        wire [B_AW*TOTAL_INTRS-1:0] wraddrs, rdaddrs;
        wire [B_WW*TOTAL_INTRS-1:0] wrdatapackeds, rddatapackeds;
        wire [TOTAL_INTRS-1:0]      wrvlds, wrrdys, rdvlds, rdrdys; 
  
        wire [B_AW-1:0]             wraddr[0:TOTAL_INTRS-1], rdaddr[0:TOTAL_INTRS-1];
        wire [B_WW-1:0]             wrdatapacked[0:TOTAL_INTRS-1], rddatapacked[0:TOTAL_INTRS-1];
        wire                        wrvld[0:TOTAL_INTRS-1], wrrdy[0:TOTAL_INTRS-1], rdvld[0:TOTAL_INTRS-1], rdrdy[0:TOTAL_INTRS-1];
        
        wire [B_AW-1:0]             awaddr, araddr;
        wire [B_BEW-1:0]            wstrb;
        wire [B_DW-1:0]             wdata, rdata;
        wire [`AXI_RESPW-1:0]       bresp, rresp;
        
        genvar                      i;  
    
  // Assign the same clk to all clock and reset inputs.
  for (i=0; i<TOTAL_INTRS; i=i+1) begin
    assign clks[i]                     = clk;
    assign rsts[i]                     = rst;
    assign wraddr[i]                   = wraddrs[B_AW*i+:B_AW];
    assign wrdatapacked[i]             = wrdatapackeds[B_WW*i+:B_WW];
    assign wrvld[i]                    = wrvlds[i];
    assign wrrdys[i]                   = wrrdy[i];
    assign rdaddrs[B_AW*i+:B_AW]       = rdaddr[i];
    assign rddatapackeds[B_WW*i+:B_WW] = rddatapacked[i];
    assign rdvlds[i]                   = rdvld[i];
    assign rdrdy[i]                    = rdrdys[i];
  end  
    
  // Instantiate the crossbar.
  powlib_buscross #(
    .EAR(EAR),.ID("XBAR"),.EDBG(EDBG),.B_WRS(TOTAL_INTRS),.B_RDS(TOTAL_INTRS),
    .B_AW(B_AW),.B_DW(B_WW),.B_BASES(B_BASES),.B_SIZES(B_SIZES))
  xbar_inst (
    .wrclks(clks),.wrrsts(rsts),.wrdatas(rddatapackeds),.wraddrs(rdaddrs),.wrvlds(rdvlds),.wrrdys(rdrdys),
    .rdclks(clks),.rdrsts(rsts),.rddatas(wrdatapackeds),.rdaddrs(wraddrs),.rdvlds(wrvlds),.rdrdys(wrrdys));  
    
  // Instantiate the IP Slave AXI to PLB.
  powlib_ipsaxi #(
    .ID("IPSAXI"),.EAR(EAR),.EDBG(EDBG),.B_BPD(B_BPD),.B_AW(B_AW),.IDW(LITE_IDW),.B_BASE(B_BASES[B_AW*IPSAXI_OFFSET+:B_AW]))
  ipsaxi_inst (
    .wraddr(wraddr[IPSAXI_OFFSET]),.wrdata(wrdatapacked[IPSAXI_OFFSET]),.wrvld(wrvld[IPSAXI_OFFSET]),.wrrdy(wrrdy[IPSAXI_OFFSET]),
    .rdaddr(rdaddr[IPSAXI_OFFSET]),.rddata(rddatapacked[IPSAXI_OFFSET]),.rdvld(rdvld[IPSAXI_OFFSET]),.rdrdy(rdrdy[IPSAXI_OFFSET]),
    .awid(LITE_ID),.awaddr(awaddr),.awlen(LITE_LEN),.awsize(LITE_SIZE),.awburst(LITE_BURST),.awvalid(awvalid),.awready(awready),
    .wdata(wdata),.wstrb(wstrb),.wlast(1'd1),.wvalid(wvalid),.wready(wready),
    .bresp(bresp),.bvalid(bvalid),.bready(bready),
    .arid(LITE_ID),.araddr(araddr),.arlen(LITE_LEN),.arsize(LITE_SIZE),.arburst(LITE_BURST),.arvalid(arvalid),.arready(arready),
    .rdata(rdata),.rresp(rresp),.rvalid(rvalid),.rready(rready),
    .clk(clk),.rst(rst));  

  // Instantiate the IP RAMs.
  powlib_ipram #(
    .ID("RAM0"),.EAR(EAR),.EDBG(EDBG),.IN_D(RAM_D),.IN_S(RAM_S),.B_SIZE(B_SIZES[B_AW*IPRAM0_OFFSET+:B_AW]),.B_BPD(B_BPD),.B_AW(B_AW))
  ram0_inst (
    .wraddr(wraddr[IPRAM0_OFFSET]),.wrdata(wrdatapacked[IPRAM0_OFFSET]),.wrvld(wrvld[IPRAM0_OFFSET]),.wrrdy(wrrdy[IPRAM0_OFFSET]),
    .rdaddr(rdaddr[IPRAM0_OFFSET]),.rddata(rddatapacked[IPRAM0_OFFSET]),.rdvld(rdvld[IPRAM0_OFFSET]),.rdrdy(rdrdy[IPRAM0_OFFSET]),
    .clk(clk),.rst(rst));  
  powlib_ipram #(
    .ID("RAM1"),.EAR(EAR),.EDBG(EDBG),.IN_D(RAM_D),.IN_S(RAM_S),.B_SIZE(B_SIZES[B_AW*IPRAM1_OFFSET+:B_AW]),.B_BPD(B_BPD),.B_AW(B_AW))
  ram1_inst (
    .wraddr(wraddr[IPRAM1_OFFSET]),.wrdata(wrdatapacked[IPRAM1_OFFSET]),.wrvld(wrvld[IPRAM1_OFFSET]),.wrrdy(wrrdy[IPRAM1_OFFSET]),
    .rdaddr(rdaddr[IPRAM1_OFFSET]),.rddata(rddatapacked[IPRAM1_OFFSET]),.rdvld(rdvld[IPRAM1_OFFSET]),.rdrdy(rdrdy[IPRAM1_OFFSET]),
    .clk(clk),.rst(rst));       

  // Board design instantiation.
  xilinx_ip_wrapper ip_wrapper_inst 
   (.GPIO_0_tri_io(GPIO_0_tri_io),
    .M01_AXI_0_araddr(araddr),
    .M01_AXI_0_arready(arready),
    .M01_AXI_0_arvalid(arvalid),
    .M01_AXI_0_awaddr(awaddr),
    .M01_AXI_0_awready(awready),
    .M01_AXI_0_awvalid(awvalid),
    .M01_AXI_0_bready(bready),
    .M01_AXI_0_bresp(bresp),
    .M01_AXI_0_bvalid(bvalid),
    .M01_AXI_0_rdata(rdata),
    .M01_AXI_0_rready(rready),
    .M01_AXI_0_rresp(rresp),
    .M01_AXI_0_rvalid(rvalid),
    .M01_AXI_0_wdata(wdata),
    .M01_AXI_0_wready(wready),
    .M01_AXI_0_wstrb(wstrb),
    .M01_AXI_0_wvalid(wvalid),
    .clk(clk),
    .reset(reset),
    .rst(rst),
    .sys_clock(sys_clock));    
    
endmodule
