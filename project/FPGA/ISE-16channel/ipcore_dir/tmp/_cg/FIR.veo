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


// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
FIR YourInstanceName (
	.clk(clk), // input clk
	.rfd(rfd), // output rfd
	.rdy(rdy), // output rdy
	.din_1(din_1), // input [15 : 0] din_1
	.din_2(din_2), // input [15 : 0] din_2
	.din_3(din_3), // input [15 : 0] din_3
	.din_4(din_4), // input [15 : 0] din_4
	.din_5(din_5), // input [15 : 0] din_5
	.din_6(din_6), // input [15 : 0] din_6
	.din_7(din_7), // input [15 : 0] din_7
	.din_8(din_8), // input [15 : 0] din_8
	.din_9(din_9), // input [15 : 0] din_9
	.din_10(din_10), // input [15 : 0] din_10
	.din_11(din_11), // input [15 : 0] din_11
	.din_12(din_12), // input [15 : 0] din_12
	.din_13(din_13), // input [15 : 0] din_13
	.din_14(din_14), // input [15 : 0] din_14
	.din_15(din_15), // input [15 : 0] din_15
	.din_16(din_16), // input [15 : 0] din_16
	.dout_1(dout_1), // output [15 : 0] dout_1
	.dout_2(dout_2), // output [15 : 0] dout_2
	.dout_3(dout_3), // output [15 : 0] dout_3
	.dout_4(dout_4), // output [15 : 0] dout_4
	.dout_5(dout_5), // output [15 : 0] dout_5
	.dout_6(dout_6), // output [15 : 0] dout_6
	.dout_7(dout_7), // output [15 : 0] dout_7
	.dout_8(dout_8), // output [15 : 0] dout_8
	.dout_9(dout_9), // output [15 : 0] dout_9
	.dout_10(dout_10), // output [15 : 0] dout_10
	.dout_11(dout_11), // output [15 : 0] dout_11
	.dout_12(dout_12), // output [15 : 0] dout_12
	.dout_13(dout_13), // output [15 : 0] dout_13
	.dout_14(dout_14), // output [15 : 0] dout_14
	.dout_15(dout_15), // output [15 : 0] dout_15
	.dout_16(dout_16)); // output [15 : 0] dout_16

// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file FIR.v when simulating
// the core, FIR. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

