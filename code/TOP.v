/*
File   : TOP.v
Date   : 2018-9-20
Author : zyl
Addr   : whu.edu.ionosphereLab
Descr  :
    top 
    
*/

module TOP(
 	input                  CLK,
    //input                  RESET_n,
    
    output reg   [3:0]     LED,

	input                  RX1,
	output                 TX1,

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
    input   wire  [15:0]   DATA_IN_U25
	);
	
    wire          [15:0]   DATA_OUT_U10;
    wire          [15:0]   DATA_OUT_U11;
    wire          [15:0]   DATA_OUT_U12;
    wire          [15:0]   DATA_OUT_U13;
    wire          [15:0]   DATA_OUT_U14;
    wire          [15:0]   DATA_OUT_U15;
    wire          [15:0]   DATA_OUT_U16;
    wire          [15:0]   DATA_OUT_U17;
    wire          [15:0]   DATA_OUT_U18;
    wire          [15:0]   DATA_OUT_U19;
    wire          [15:0]   DATA_OUT_U20;
    wire          [15:0]   DATA_OUT_U21;
    wire          [15:0]   DATA_OUT_U22;
    wire          [15:0]   DATA_OUT_U23;
    wire          [15:0]   DATA_OUT_U24;
    wire          [15:0]   DATA_OUT_U25;
	
	reg RESET_n  = 1;

	
	reg [31:0] count = 0;
	always @(posedge CLK_20M) begin
		count <= count+1;
		LED <= count[26:23];
	end



	pll ins1(
		.CLK_IN1        (CLK),
		.CLK_OUT1       (CLK_20M),
		.CLK_OUT2       (CLK_50M)
	);
	


    DATA_TRANS ins2(
        .CLK_50M        (CLK_50M),
        .RESET_n        (RESET_n),

        .DATA_IN_U10    (DATA_OUT_U10),
        .DATA_IN_U11    (DATA_OUT_U11),
        .DATA_IN_U12    (DATA_OUT_U12),
        .DATA_IN_U13    (DATA_OUT_U13),
        .DATA_IN_U14    (DATA_OUT_U14),
        .DATA_IN_U15    (DATA_OUT_U15),
        .DATA_IN_U16    (DATA_OUT_U16),
        .DATA_IN_U17    (DATA_OUT_U17),
        .DATA_IN_U18    (DATA_OUT_U18),
        .DATA_IN_U19    (DATA_OUT_U19),
        .DATA_IN_U20    (DATA_OUT_U20),
        .DATA_IN_U21    (DATA_OUT_U21),
        .DATA_IN_U22    (DATA_OUT_U22),
        .DATA_IN_U23    (DATA_OUT_U23),
        .DATA_IN_U24    (DATA_OUT_U24),
        .DATA_IN_U25    (DATA_OUT_U25),

        .RX             (RX1),
        .TX             (TX1)
    );


    LTC2203 ins3(
        .CLK            (CLK_50M),
        .RESET_n        (RESET_n),

        .CLKOUT_U10_n   (CLKOUT_U10_n),
        .CLKOUT_U11_n   (CLKOUT_U11_n),
        .CLKOUT_U12_n   (CLKOUT_U12_n),
        .CLKOUT_U13_n   (CLKOUT_U13_n),
        .CLKOUT_U14_n   (CLKOUT_U14_n),
        .CLKOUT_U15_n   (CLKOUT_U15_n),
        .CLKOUT_U16_n   (CLKOUT_U16_n),
        .CLKOUT_U17_n   (CLKOUT_U17_n),
        .CLKOUT_U18_n   (CLKOUT_U18_n),
        .CLKOUT_U19_n   (CLKOUT_U19_n),
        .CLKOUT_U20_n   (CLKOUT_U20_n),
        .CLKOUT_U21_n   (CLKOUT_U21_n),
        .CLKOUT_U22_n   (CLKOUT_U22_n),
        .CLKOUT_U23_n   (CLKOUT_U23_n),
        .CLKOUT_U24_n   (CLKOUT_U24_n),
        .CLKOUT_U25_n   (CLKOUT_U25_n),

        .CLKOUT_U10_p   (CLKOUT_U10_p),
        .CLKOUT_U11_p   (CLKOUT_U11_p),
        .CLKOUT_U12_p   (CLKOUT_U12_p),
        .CLKOUT_U13_p   (CLKOUT_U13_p),
        .CLKOUT_U14_p   (CLKOUT_U14_p),
        .CLKOUT_U15_p   (CLKOUT_U15_p),
        .CLKOUT_U16_p   (CLKOUT_U16_p),
        .CLKOUT_U17_p   (CLKOUT_U17_p),
        .CLKOUT_U18_p   (CLKOUT_U18_p),
        .CLKOUT_U19_p   (CLKOUT_U19_p),
        .CLKOUT_U20_p   (CLKOUT_U20_p),
        .CLKOUT_U21_p   (CLKOUT_U21_p),
        .CLKOUT_U22_p   (CLKOUT_U22_p),
        .CLKOUT_U23_p   (CLKOUT_U23_p),
        .CLKOUT_U24_p   (CLKOUT_U24_p),
        .CLKOUT_U25_p   (CLKOUT_U25_p),

        .DATA_IN_U10    (DATA_IN_U10),
        .DATA_IN_U11    (DATA_IN_U11),
        .DATA_IN_U12    (DATA_IN_U12),
        .DATA_IN_U13    (DATA_IN_U13),
        .DATA_IN_U14    (DATA_IN_U14),
        .DATA_IN_U15    (DATA_IN_U15),
        .DATA_IN_U16    (DATA_IN_U16),
        .DATA_IN_U17    (DATA_IN_U17),
        .DATA_IN_U18    (DATA_IN_U18),
        .DATA_IN_U19    (DATA_IN_U19),
        .DATA_IN_U20    (DATA_IN_U20),
        .DATA_IN_U21    (DATA_IN_U21),
        .DATA_IN_U22    (DATA_IN_U22),
        .DATA_IN_U23    (DATA_IN_U23),
        .DATA_IN_U24    (DATA_IN_U24),
        .DATA_IN_U25    (DATA_IN_U25),

        .DATA_OUT_U10   (DATA_OUT_U10),
        .DATA_OUT_U11   (DATA_OUT_U11),
        .DATA_OUT_U12   (DATA_OUT_U12),
        .DATA_OUT_U13   (DATA_OUT_U13),
        .DATA_OUT_U14   (DATA_OUT_U14),
        .DATA_OUT_U15   (DATA_OUT_U15),
        .DATA_OUT_U16   (DATA_OUT_U16),
        .DATA_OUT_U17   (DATA_OUT_U17),
        .DATA_OUT_U18   (DATA_OUT_U18),
        .DATA_OUT_U19   (DATA_OUT_U19),
        .DATA_OUT_U20   (DATA_OUT_U20),
        .DATA_OUT_U21   (DATA_OUT_U21),
        .DATA_OUT_U22   (DATA_OUT_U22),
        .DATA_OUT_U23   (DATA_OUT_U23),
        .DATA_OUT_U24   (DATA_OUT_U24),
        .DATA_OUT_U25   (DATA_OUT_U25)
    );
    

endmodule

