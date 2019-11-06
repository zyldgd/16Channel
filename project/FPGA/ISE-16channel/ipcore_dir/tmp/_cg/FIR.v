/*******************************************************************************
*     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.              *
*                                                                              *
*     This file contains confidential and proprietary information              *
*     of Xilinx, Inc. and is protected under U.S. and                          *
*     international copyright and other intellectual property                  *
*     laws.                                                                    *
*                                                                              *
*     DISCLAIMER                                                               *
*     This disclaimer is not a license and does not grant any                  *
*     rights to the materials distributed herewith. Except as                  *
*     otherwise provided in a valid license issued to you by                   *
*     Xilinx, and to the maximum extent permitted by applicable                *
*     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                  *
*     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES              *
*     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING                *
*     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                   *
*     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and                 *
*     (2) Xilinx shall not be liable (whether in contract or tort,             *
*     including negligence, or under any other theory of                       *
*     liability) for any loss or damage of any kind or nature                  *
*     related to, arising under or in connection with these                    *
*     materials, including for any direct, or any indirect,                    *
*     special, incidental, or consequential loss or damage                     *
*     (including loss of data, profits, goodwill, or any type of               *
*     loss or damage suffered as a result of any action brought                *
*     by a third party) even if such damage or loss was                        *
*     reasonably foreseeable or Xilinx had been advised of the                 *
*     possibility of the same.                                                 *
*                                                                              *
*     CRITICAL APPLICATIONS                                                    *
*     Xilinx products are not designed or intended to be fail-                 *
*     safe, or for use in any application requiring fail-safe                  *
*     performance, such as life-support or safety devices or                   *
*     systems, Class III medical devices, nuclear facilities,                  *
*     applications related to the deployment of airbags, or any                *
*     other applications that could lead to death, personal                    *
*     injury, or severe property or environmental damage                       *
*     (individually and collectively, "Critical                                *
*     Applications"). Customer assumes the sole risk and                       *
*     liability of any use of Xilinx products in Critical                      *
*     Applications, subject only to applicable laws and                        *
*     regulations governing limitations on product liability.                  *
*                                                                              *
*     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS                 *
*     PART OF THIS FILE AT ALL TIMES.                                          *
*******************************************************************************/

//  Generated from component ID: xilinx.com:ip:fir_compiler:5.0


// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file FIR.v when simulating
// the core, FIR. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module FIR(
	clk,
	rfd,
	rdy,
	din_1,
	din_2,
	din_3,
	din_4,
	din_5,
	din_6,
	din_7,
	din_8,
	din_9,
	din_10,
	din_11,
	din_12,
	din_13,
	din_14,
	din_15,
	din_16,
	dout_1,
	dout_2,
	dout_3,
	dout_4,
	dout_5,
	dout_6,
	dout_7,
	dout_8,
	dout_9,
	dout_10,
	dout_11,
	dout_12,
	dout_13,
	dout_14,
	dout_15,
	dout_16);


input clk;
output rfd;
output rdy;
input [15 : 0] din_1;
input [15 : 0] din_2;
input [15 : 0] din_3;
input [15 : 0] din_4;
input [15 : 0] din_5;
input [15 : 0] din_6;
input [15 : 0] din_7;
input [15 : 0] din_8;
input [15 : 0] din_9;
input [15 : 0] din_10;
input [15 : 0] din_11;
input [15 : 0] din_12;
input [15 : 0] din_13;
input [15 : 0] din_14;
input [15 : 0] din_15;
input [15 : 0] din_16;
output [15 : 0] dout_1;
output [15 : 0] dout_2;
output [15 : 0] dout_3;
output [15 : 0] dout_4;
output [15 : 0] dout_5;
output [15 : 0] dout_6;
output [15 : 0] dout_7;
output [15 : 0] dout_8;
output [15 : 0] dout_9;
output [15 : 0] dout_10;
output [15 : 0] dout_11;
output [15 : 0] dout_12;
output [15 : 0] dout_13;
output [15 : 0] dout_14;
output [15 : 0] dout_15;
output [15 : 0] dout_16;

// synthesis translate_off

      FIR_COMPILER_V5_0 #(
		.ACCUM_WIDTH(34),
		.ALLOW_APPROX(0),
		.CHAN_IN_ADV(0),
		.CHAN_SEL_WIDTH(1),
		.CLOCK_FREQ(20000000),
		.COEF_MEMTYPE(0),
		.COEF_RELOAD(0),
		.COEF_TYPE(0),
		.COEF_WIDTH(16),
		.COL_CONFIG("48,44,36"),
		.COL_MODE(1),
		.COL_PIPE_LEN(4),
		.C_COMPONENT_NAME("FIR"),
		.C_FAMILY("spartan6"),
		.C_HAS_CE(0),
		.C_HAS_DATA_VALID(0),
		.C_HAS_ND(0),
		.C_HAS_SCLR(0),
		.C_LATENCY(143),
		.C_MEM_INIT_FILE("FIR.mif"),
		.C_OPTIMIZATION(1),
		.C_XDEVICEFAMILY("spartan6"),
		.DATAPATH_MEMTYPE(0),
		.DATA_MEMTYPE(0),
		.DATA_TYPE(0),
		.DATA_WIDTH(16),
		.DECIM_RATE(1),
		.FILTER_ARCH(1),
		.FILTER_SEL_WIDTH(1),
		.FILTER_TYPE(0),
		.INTERP_RATE(1),
		.IPBUFF_MEMTYPE(0),
		.NEG_SYMMETRY(0),
		.NUM_CHANNELS(1),
		.NUM_FILTS(1),
		.NUM_PATHS(16),
		.NUM_TAPS(128),
		.ODD_SYMMETRY(0),
		.OPBUFF_MEMTYPE(0),
		.OUTPUT_REG(1),
		.OUTPUT_WIDTH(16),
		.RATE_CHANGE_TYPE(0),
		.ROUND_MODE(1),
		.SAMPLE_FREQ(20000000),
		.SCLR_DETERMINISTIC(0),
		.SYMMETRY(0),
		.ZERO_PACKING_FACTOR(1))
	inst (
		.CLK(clk),
		.RFD(rfd),
		.RDY(rdy),
		.DIN_1(din_1),
		.DIN_2(din_2),
		.DIN_3(din_3),
		.DIN_4(din_4),
		.DIN_5(din_5),
		.DIN_6(din_6),
		.DIN_7(din_7),
		.DIN_8(din_8),
		.DIN_9(din_9),
		.DIN_10(din_10),
		.DIN_11(din_11),
		.DIN_12(din_12),
		.DIN_13(din_13),
		.DIN_14(din_14),
		.DIN_15(din_15),
		.DIN_16(din_16),
		.DOUT_1(dout_1),
		.DOUT_2(dout_2),
		.DOUT_3(dout_3),
		.DOUT_4(dout_4),
		.DOUT_5(dout_5),
		.DOUT_6(dout_6),
		.DOUT_7(dout_7),
		.DOUT_8(dout_8),
		.DOUT_9(dout_9),
		.DOUT_10(dout_10),
		.DOUT_11(dout_11),
		.DOUT_12(dout_12),
		.DOUT_13(dout_13),
		.DOUT_14(dout_14),
		.DOUT_15(dout_15),
		.DOUT_16(dout_16),
		.SCLR(),
		.CE(),
		.ND(),
		.FILTER_SEL(),
		.COEF_LD(),
		.COEF_WE(),
		.COEF_DIN(),
		.COEF_FILTER_SEL(),
		.DATA_VALID(),
		.CHAN_IN(),
		.CHAN_OUT(),
		.DIN(),
		.DOUT(),
		.DOUT_I(),
		.DOUT_Q(),
		.DOUT_I_1(),
		.DOUT_Q_1(),
		.DOUT_I_2(),
		.DOUT_Q_2(),
		.DOUT_I_3(),
		.DOUT_Q_3(),
		.DOUT_I_4(),
		.DOUT_Q_4(),
		.DOUT_I_5(),
		.DOUT_Q_5(),
		.DOUT_I_6(),
		.DOUT_Q_6(),
		.DOUT_I_7(),
		.DOUT_Q_7(),
		.DOUT_I_8(),
		.DOUT_Q_8(),
		.DOUT_I_9(),
		.DOUT_Q_9(),
		.DOUT_I_10(),
		.DOUT_Q_10(),
		.DOUT_I_11(),
		.DOUT_Q_11(),
		.DOUT_I_12(),
		.DOUT_Q_12(),
		.DOUT_I_13(),
		.DOUT_Q_13(),
		.DOUT_I_14(),
		.DOUT_Q_14(),
		.DOUT_I_15(),
		.DOUT_Q_15(),
		.DOUT_I_16(),
		.DOUT_Q_16());


// synthesis translate_on

endmodule

