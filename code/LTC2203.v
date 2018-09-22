/*
File   : LTC2203.v
Date   : 2018-9-20
Author : zyl
Addr   : whu.edu.ionosphereLab
Descr  :
    LTC2203 interface 
    
*/

`define enable_fir = 1;

module LTC2203(
    input   wire           CLK,
    input   wire           RESET_n,

    input   wire           CLKOUT_U10_n,
    input   wire           CLKOUT_U11_n,
    input   wire           CLKOUT_U12_n,
    input   wire           CLKOUT_U13_n,
    input   wire           CLKOUT_U14_n,
    input   wire           CLKOUT_U15_n,
    input   wire           CLKOUT_U16_n,
    input   wire           CLKOUT_U17_n,
    input   wire           CLKOUT_U18_n,
    input   wire           CLKOUT_U19_n,
    input   wire           CLKOUT_U20_n,
    input   wire           CLKOUT_U21_n,
    input   wire           CLKOUT_U22_n,
    input   wire           CLKOUT_U23_n,
    input   wire           CLKOUT_U24_n,
    input   wire           CLKOUT_U25_n,

    input   wire           CLKOUT_U10_p,
    input   wire           CLKOUT_U11_p,
    input   wire           CLKOUT_U12_p,
    input   wire           CLKOUT_U13_p,
    input   wire           CLKOUT_U14_p,
    input   wire           CLKOUT_U15_p,
    input   wire           CLKOUT_U16_p,
    input   wire           CLKOUT_U17_p,
    input   wire           CLKOUT_U18_p,
    input   wire           CLKOUT_U19_p,
    input   wire           CLKOUT_U20_p,
    input   wire           CLKOUT_U21_p,
    input   wire           CLKOUT_U22_p,
    input   wire           CLKOUT_U23_p,
    input   wire           CLKOUT_U24_p,
    input   wire           CLKOUT_U25_p,

    input   wire  [15:0]   DATA_IN_U10,
    input   wire  [15:0]   DATA_IN_U11,
    input   wire  [15:0]   DATA_IN_U12,
    input   wire  [15:0]   DATA_IN_U13,
    input   wire  [15:0]   DATA_IN_U14,
    input   wire  [15:0]   DATA_IN_U15,
    input   wire  [15:0]   DATA_IN_U16,
    input   wire  [15:0]   DATA_IN_U17,
    input   wire  [15:0]   DATA_IN_U18,
    input   wire  [15:0]   DATA_IN_U19,
    input   wire  [15:0]   DATA_IN_U20,
    input   wire  [15:0]   DATA_IN_U21,
    input   wire  [15:0]   DATA_IN_U22,
    input   wire  [15:0]   DATA_IN_U23,
    input   wire  [15:0]   DATA_IN_U24,
    input   wire  [15:0]   DATA_IN_U25,

    output  reg   [15:0]   DATA_OUT_U10,
    output  reg   [15:0]   DATA_OUT_U11,
    output  reg   [15:0]   DATA_OUT_U12,
    output  reg   [15:0]   DATA_OUT_U13,
    output  reg   [15:0]   DATA_OUT_U14,
    output  reg   [15:0]   DATA_OUT_U15,
    output  reg   [15:0]   DATA_OUT_U16,
    output  reg   [15:0]   DATA_OUT_U17,
    output  reg   [15:0]   DATA_OUT_U18,
    output  reg   [15:0]   DATA_OUT_U19,
    output  reg   [15:0]   DATA_OUT_U20,
    output  reg   [15:0]   DATA_OUT_U21,
    output  reg   [15:0]   DATA_OUT_U22,
    output  reg   [15:0]   DATA_OUT_U23,
    output  reg   [15:0]   DATA_OUT_U24,
    output  reg   [15:0]   DATA_OUT_U25
    );

    parameter              FIR_EN = enable_fir;

    wire                   CLK_U10;
    wire                   CLK_U11;
    wire                   CLK_U12;
    wire                   CLK_U13;
    wire                   CLK_U14;
    wire                   CLK_U15;
    wire                   CLK_U16;
    wire                   CLK_U17;
    wire                   CLK_U18;
    wire                   CLK_U19;
    wire                   CLK_U20;
    wire                   CLK_U21;
    wire                   CLK_U22;
    wire                   CLK_U23;
    wire                   CLK_U24;
    wire                   CLK_U25;

    wire       [15:0]      DATA_FIR_OUT_U10;
    wire       [15:0]      DATA_FIR_OUT_U11;
    wire       [15:0]      DATA_FIR_OUT_U12;
    wire       [15:0]      DATA_FIR_OUT_U13;
    wire       [15:0]      DATA_FIR_OUT_U14;
    wire       [15:0]      DATA_FIR_OUT_U15;
    wire       [15:0]      DATA_FIR_OUT_U16;
    wire       [15:0]      DATA_FIR_OUT_U17;
    wire       [15:0]      DATA_FIR_OUT_U18;
    wire       [15:0]      DATA_FIR_OUT_U19;
    wire       [15:0]      DATA_FIR_OUT_U20;
    wire       [15:0]      DATA_FIR_OUT_U21;
    wire       [15:0]      DATA_FIR_OUT_U22;
    wire       [15:0]      DATA_FIR_OUT_U23;
    wire       [15:0]      DATA_FIR_OUT_U24;
    wire       [15:0]      DATA_FIR_OUT_U25;

    assign                 CLK_U10 = CLKOUT_U10_n;
    assign                 CLK_U11 = CLKOUT_U11_n;
    assign                 CLK_U12 = CLKOUT_U12_n;
    assign                 CLK_U13 = CLKOUT_U13_n;
    assign                 CLK_U14 = CLKOUT_U14_n;
    assign                 CLK_U15 = CLKOUT_U15_n;
    assign                 CLK_U16 = CLKOUT_U16_n;
    assign                 CLK_U17 = CLKOUT_U17_n;
    assign                 CLK_U18 = CLKOUT_U18_n;
    assign                 CLK_U19 = CLKOUT_U19_n;
    assign                 CLK_U20 = CLKOUT_U20_n;
    assign                 CLK_U21 = CLKOUT_U21_n;
    assign                 CLK_U22 = CLKOUT_U22_n;
    assign                 CLK_U23 = CLKOUT_U23_n;
    assign                 CLK_U24 = CLKOUT_U24_n;
    assign                 CLK_U25 = CLKOUT_U25_n;
    

    always @(posedge CLK_U10) begin
        DATA_OUT_U10 <= FIR_EN ? DATA_FIR_OUT_U10 : DATA_IN_U10;
    end

    always @(posedge CLK_U11) begin
        DATA_OUT_U11 <= FIR_EN ? DATA_FIR_OUT_U11 : DATA_IN_U11;
    end

    always @(posedge CLK_U12) begin
        DATA_OUT_U12 <= FIR_EN ? DATA_FIR_OUT_U12 : DATA_IN_U12;
    end
    
    always @(posedge CLK_U13) begin
        DATA_OUT_U13 <= FIR_EN ? DATA_FIR_OUT_U13 : DATA_IN_U13;
    end

    always @(posedge CLK_U14) begin
        DATA_OUT_U14 <= FIR_EN ? DATA_FIR_OUT_U14 : DATA_IN_U14;
    end

    always @(posedge CLK_U15) begin
        DATA_OUT_U15 <= FIR_EN ? DATA_FIR_OUT_U15 : DATA_IN_U15;
    end

    always @(posedge CLK_U16) begin
        DATA_OUT_U16 <= FIR_EN ? DATA_FIR_OUT_U16 : DATA_IN_U16;
    end

    always @(posedge CLK_U17) begin
        DATA_OUT_U17 <= FIR_EN ? DATA_FIR_OUT_U17 : DATA_IN_U17;
    end

    always @(posedge CLK_U18) begin
        DATA_OUT_U18 <= FIR_EN ? DATA_FIR_OUT_U18 : DATA_IN_U18;
    end

    always @(posedge CLK_U19) begin
        DATA_OUT_U19 <= FIR_EN ? DATA_FIR_OUT_U19 : DATA_IN_U19;
    end

    always @(posedge CLK_U20) begin
        DATA_OUT_U20 <= FIR_EN ? DATA_FIR_OUT_U20 : DATA_IN_U20;
    end

    always @(posedge CLK_U21) begin
        DATA_OUT_U21 <= FIR_EN ? DATA_FIR_OUT_U21 : DATA_IN_U21;
    end

    always @(posedge CLK_U22) begin
        DATA_OUT_U22 <= FIR_EN ? DATA_FIR_OUT_U22 : DATA_IN_U22;
    end

    always @(posedge CLK_U23) begin
        DATA_OUT_U23 <= FIR_EN ? DATA_FIR_OUT_U23 : DATA_IN_U23;
    end

    always @(posedge CLK_U24) begin
        DATA_OUT_U24 <= FIR_EN ? DATA_FIR_OUT_U24 : DATA_IN_U24;
    end

    always @(posedge CLK_U25) begin
        DATA_OUT_U25 <= FIR_EN ? DATA_FIR_OUT_U25 : DATA_IN_U25;
    end

/*
	FIR fir_U10(
		.clk(CLK),
		.din(DATA_IN_U10),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U10)
	);

    FIR fir_U11(
		.clk(CLK),
		.din(DATA_IN_U11),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U11)
	);

    FIR fir_U12(
		.clk(CLK),
		.din(DATA_IN_U12),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U12)
	);

    FIR fir_U13(
		.clk(CLK),
		.din(DATA_IN_U13),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U13)
	);

    FIR fir_U14(
		.clk(CLK),
		.din(DATA_IN_U14),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U14)
	);

    FIR fir_U15(
		.clk(CLK),
		.din(DATA_IN_U15),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U15)
	);

    FIR fir_U16(
		.clk(CLK),
		.din(DATA_IN_U16),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U16)
	);

    FIR fir_U17(
		.clk(CLK),
		.din(DATA_IN_U17),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U17)
	);

    FIR fir_U18(
		.clk(CLK),
		.din(DATA_IN_U18),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U18)
	);

    FIR fir_U19(
		.clk(CLK),
		.din(DATA_IN_U19),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U19)
	);

    FIR fir_U20(
		.clk(CLK),
		.din(DATA_IN_U20),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U20)
	);

    FIR fir_U21(
		.clk(CLK),
		.din(DATA_IN_U21),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U21)
	);

    FIR fir_U22(
		.clk(CLK),
		.din(DATA_IN_U22),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U22)
	);

    FIR fir_U23(
		.clk(CLK),
		.din(DATA_IN_U23),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U23)
	);

    FIR fir_U24(
		.clk(CLK),
		.din(DATA_IN_U24),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U24)
	);

    FIR fir_U25(
		.clk(CLK),
		.din(DATA_IN_U25),
		.rfd(),
		.rdy(),
		.dout(DATA_FIR_OUT_U25)
	);
*/
endmodule // LTC2203