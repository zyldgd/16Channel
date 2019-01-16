/*
File   : LTC2203.v
Date   : 2018-9-26
Author : zyl
Version: 1.4
Addr   : whu.edu.ionosphereLab
Descr  :
    LTC2203 interface 
    
*/



module LTC2203 #(parameter  FIR_EN = 0)(
    input   wire           CLK_20M,
    input   wire           CLK_50M,
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

    output  wire  [15:0]   DATA_OUT_U10,
    output  wire  [15:0]   DATA_OUT_U11,
    output  wire  [15:0]   DATA_OUT_U12,
    output  wire  [15:0]   DATA_OUT_U13,
    output  wire  [15:0]   DATA_OUT_U14,
    output  wire  [15:0]   DATA_OUT_U15,
    output  wire  [15:0]   DATA_OUT_U16,
    output  wire  [15:0]   DATA_OUT_U17,
    output  wire  [15:0]   DATA_OUT_U18,
    output  wire  [15:0]   DATA_OUT_U19,
    output  wire  [15:0]   DATA_OUT_U20,
    output  wire  [15:0]   DATA_OUT_U21,
    output  wire  [15:0]   DATA_OUT_U22,
    output  wire  [15:0]   DATA_OUT_U23,
    output  wire  [15:0]   DATA_OUT_U24,
    output  wire  [15:0]   DATA_OUT_U25
    );


    reg        [15:0]      DATA_IN_U10_reg=0;
    reg        [15:0]      DATA_IN_U11_reg=0;
    reg        [15:0]      DATA_IN_U12_reg=0;
    reg        [15:0]      DATA_IN_U13_reg=0;
    reg        [15:0]      DATA_IN_U14_reg=0;
    reg        [15:0]      DATA_IN_U15_reg=0;
    reg        [15:0]      DATA_IN_U16_reg=0;
    reg        [15:0]      DATA_IN_U17_reg=0;
    reg        [15:0]      DATA_IN_U18_reg=0;
    reg        [15:0]      DATA_IN_U19_reg=0;
    reg        [15:0]      DATA_IN_U20_reg=0;
    reg        [15:0]      DATA_IN_U21_reg=0;
    reg        [15:0]      DATA_IN_U22_reg=0;
    reg        [15:0]      DATA_IN_U23_reg=0;
    reg        [15:0]      DATA_IN_U24_reg=0;
    reg        [15:0]      DATA_IN_U25_reg=0;

    wire       [15:0]      DATA_OUT_U10_wire;
    wire       [15:0]      DATA_OUT_U11_wire;
    wire       [15:0]      DATA_OUT_U12_wire;
    wire       [15:0]      DATA_OUT_U13_wire;
    wire       [15:0]      DATA_OUT_U14_wire;
    wire       [15:0]      DATA_OUT_U15_wire;
    wire       [15:0]      DATA_OUT_U16_wire;
    wire       [15:0]      DATA_OUT_U17_wire;
    wire       [15:0]      DATA_OUT_U18_wire;
    wire       [15:0]      DATA_OUT_U19_wire;
    wire       [15:0]      DATA_OUT_U20_wire;
    wire       [15:0]      DATA_OUT_U21_wire;
    wire       [15:0]      DATA_OUT_U22_wire;
    wire       [15:0]      DATA_OUT_U23_wire;
    wire       [15:0]      DATA_OUT_U24_wire;
    wire       [15:0]      DATA_OUT_U25_wire;

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

    reg                    MEAN_EN = 0;
    assign                 DATA_OUT_U10 = MEAN_EN ? DATA_OUT_U10_wire : DATA_IN_U10_reg;
    assign                 DATA_OUT_U11 = MEAN_EN ? DATA_OUT_U11_wire : DATA_IN_U11_reg;
    assign                 DATA_OUT_U12 = MEAN_EN ? DATA_OUT_U12_wire : DATA_IN_U12_reg;
    assign                 DATA_OUT_U13 = MEAN_EN ? DATA_OUT_U13_wire : DATA_IN_U13_reg;
    assign                 DATA_OUT_U14 = MEAN_EN ? DATA_OUT_U14_wire : DATA_IN_U14_reg;
    assign                 DATA_OUT_U15 = MEAN_EN ? DATA_OUT_U15_wire : DATA_IN_U15_reg;
    assign                 DATA_OUT_U16 = MEAN_EN ? DATA_OUT_U16_wire : DATA_IN_U16_reg;
    assign                 DATA_OUT_U17 = MEAN_EN ? DATA_OUT_U17_wire : DATA_IN_U17_reg;
    assign                 DATA_OUT_U18 = MEAN_EN ? DATA_OUT_U18_wire : DATA_IN_U18_reg;
    assign                 DATA_OUT_U19 = MEAN_EN ? DATA_OUT_U19_wire : DATA_IN_U19_reg;
    assign                 DATA_OUT_U20 = MEAN_EN ? DATA_OUT_U20_wire : DATA_IN_U20_reg;
    assign                 DATA_OUT_U21 = MEAN_EN ? DATA_OUT_U21_wire : DATA_IN_U21_reg;
    assign                 DATA_OUT_U22 = MEAN_EN ? DATA_OUT_U22_wire : DATA_IN_U22_reg;
    assign                 DATA_OUT_U23 = MEAN_EN ? DATA_OUT_U23_wire : DATA_IN_U23_reg;
    assign                 DATA_OUT_U24 = MEAN_EN ? DATA_OUT_U24_wire : DATA_IN_U24_reg;
    assign                 DATA_OUT_U25 = MEAN_EN ? DATA_OUT_U25_wire : DATA_IN_U25_reg;


    always @(posedge CLK_U10) begin
        DATA_IN_U10_reg <= DATA_IN_U10;
    end

    always @(posedge CLK_U11) begin
        DATA_IN_U11_reg <= DATA_IN_U11;
    end

    always @(posedge CLK_U12) begin
        DATA_IN_U12_reg <= DATA_IN_U12;
    end

    always @(posedge CLK_U13) begin
        DATA_IN_U13_reg <= DATA_IN_U13;
    end

    always @(posedge CLK_U14) begin
        DATA_IN_U14_reg <= DATA_IN_U14;
    end

    always @(posedge CLK_U15) begin
        DATA_IN_U15_reg <= DATA_IN_U15;
    end

    always @(posedge CLK_U16) begin
        DATA_IN_U16_reg <= DATA_IN_U16;
    end

    always @(posedge CLK_U17) begin
        DATA_IN_U17_reg <= DATA_IN_U17;
    end

    always @(posedge CLK_U18) begin
        DATA_IN_U18_reg <= DATA_IN_U18;
    end

    always @(posedge CLK_U19) begin
        DATA_IN_U19_reg <= DATA_IN_U19;
    end

    always @(posedge CLK_U20) begin
        DATA_IN_U20_reg <= DATA_IN_U20;
    end

    always @(posedge CLK_U21) begin
        DATA_IN_U21_reg <= DATA_IN_U21;
    end

    always @(posedge CLK_U22) begin
        DATA_IN_U22_reg <= DATA_IN_U22;
    end

    always @(posedge CLK_U23) begin
        DATA_IN_U23_reg <= DATA_IN_U23;
    end

    always @(posedge CLK_U24) begin
        DATA_IN_U24_reg <= DATA_IN_U24;
    end

    always @(posedge CLK_U25) begin
        DATA_IN_U25_reg <= DATA_IN_U25;
    end


    MEAN mean_U10(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U10_reg),
        .DATA_OUT   (DATA_OUT_U10_wire)
    );

    MEAN mean_U11(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U11_reg),
        .DATA_OUT   (DATA_OUT_U11_wire)
    );
    
    MEAN mean_U12(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U12_reg),
        .DATA_OUT   (DATA_OUT_U12_wire)
    );

    MEAN mean_U13(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U13_reg),
        .DATA_OUT   (DATA_OUT_U13_wire)
    );
    
    MEAN mean_U14(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U14_reg),
        .DATA_OUT   (DATA_OUT_U14_wire)
    );

    MEAN mean_U15(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U15_reg),
        .DATA_OUT   (DATA_OUT_U15_wire)
    );

    MEAN mean_U16(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U16_reg),
        .DATA_OUT   (DATA_OUT_U16_wire)
    );

    MEAN mean_U17(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U17_reg),
        .DATA_OUT   (DATA_OUT_U17_wire)
    );

    MEAN mean_U18(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U18_reg),
        .DATA_OUT   (DATA_OUT_U18_wire)
    );

    MEAN mean_U19(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U19_reg),
        .DATA_OUT   (DATA_OUT_U19_wire)
    );

    MEAN mean_U20(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U20_reg),
        .DATA_OUT   (DATA_OUT_U20_wire)
    );

    MEAN mean_U21(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U21_reg),
        .DATA_OUT   (DATA_OUT_U21_wire)
    );

    MEAN mean_U22(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U22_reg),
        .DATA_OUT   (DATA_OUT_U22_wire)
    );

    MEAN mean_U23(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U23_reg),
        .DATA_OUT   (DATA_OUT_U23_wire)
    );

    MEAN mean_U24(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U24_reg),
        .DATA_OUT   (DATA_OUT_U24_wire)
    );

    MEAN mean_U25(
        .CLK        (CLK_20M),
        .RESET_n    (RESET_n),
        .DATA_IN    (DATA_IN_U25_reg),
        .DATA_OUT   (DATA_OUT_U25_wire)
    );



/*

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

    wire       [15:0]      DATA_MEAN_OUT_U10;
    wire       [15:0]      DATA_MEAN_OUT_U11;
    wire       [15:0]      DATA_MEAN_OUT_U12;
    wire       [15:0]      DATA_MEAN_OUT_U13;
    wire       [15:0]      DATA_MEAN_OUT_U14;
    wire       [15:0]      DATA_MEAN_OUT_U15;
    wire       [15:0]      DATA_MEAN_OUT_U16;
    wire       [15:0]      DATA_MEAN_OUT_U17;
    wire       [15:0]      DATA_MEAN_OUT_U18;
    wire       [15:0]      DATA_MEAN_OUT_U19;
    wire       [15:0]      DATA_MEAN_OUT_U20;
    wire       [15:0]      DATA_MEAN_OUT_U21;
    wire       [15:0]      DATA_MEAN_OUT_U22;
    wire       [15:0]      DATA_MEAN_OUT_U23;
    wire       [15:0]      DATA_MEAN_OUT_U24;
    wire       [15:0]      DATA_MEAN_OUT_U25;

    always @(posedge CLK_20M) begin
        if (MEAN_EN) begin
            DATA_OUT_U10 <= DATA_MEAN_OUT_U10;
            DATA_OUT_U11 <= DATA_MEAN_OUT_U11;
            DATA_OUT_U12 <= DATA_MEAN_OUT_U12;
            DATA_OUT_U13 <= DATA_MEAN_OUT_U13;
            DATA_OUT_U14 <= DATA_MEAN_OUT_U14;
            DATA_OUT_U15 <= DATA_MEAN_OUT_U15;
            DATA_OUT_U16 <= DATA_MEAN_OUT_U16;
            DATA_OUT_U17 <= DATA_MEAN_OUT_U17;
            DATA_OUT_U18 <= DATA_MEAN_OUT_U18;
            DATA_OUT_U19 <= DATA_MEAN_OUT_U19;
            DATA_OUT_U20 <= DATA_MEAN_OUT_U20;
            DATA_OUT_U21 <= DATA_MEAN_OUT_U21;
            DATA_OUT_U22 <= DATA_MEAN_OUT_U22;
            DATA_OUT_U23 <= DATA_MEAN_OUT_U23;
            DATA_OUT_U24 <= DATA_MEAN_OUT_U24;
            DATA_OUT_U25 <= DATA_MEAN_OUT_U25;
        end else if (FIR_EN) begin
            DATA_OUT_U10 <= DATA_FIR_OUT_U10;
            DATA_OUT_U11 <= DATA_FIR_OUT_U11;
            DATA_OUT_U12 <= DATA_FIR_OUT_U12;
            DATA_OUT_U13 <= DATA_FIR_OUT_U13;
            DATA_OUT_U14 <= DATA_FIR_OUT_U14;
            DATA_OUT_U15 <= DATA_FIR_OUT_U15;
            DATA_OUT_U16 <= DATA_FIR_OUT_U16;
            DATA_OUT_U17 <= DATA_FIR_OUT_U17;
            DATA_OUT_U18 <= DATA_FIR_OUT_U18;
            DATA_OUT_U19 <= DATA_FIR_OUT_U19;
            DATA_OUT_U20 <= DATA_FIR_OUT_U20;
            DATA_OUT_U21 <= DATA_FIR_OUT_U21;
            DATA_OUT_U22 <= DATA_FIR_OUT_U22;
            DATA_OUT_U23 <= DATA_FIR_OUT_U23;
            DATA_OUT_U24 <= DATA_FIR_OUT_U24;
            DATA_OUT_U25 <= DATA_FIR_OUT_U25;
        end else begin
            DATA_OUT_U10 <= DATA_IN_U10;
            DATA_OUT_U11 <= DATA_IN_U11;
            DATA_OUT_U12 <= DATA_IN_U12;
            DATA_OUT_U13 <= DATA_IN_U13;
            DATA_OUT_U14 <= DATA_IN_U14;
            DATA_OUT_U15 <= DATA_IN_U15;
            DATA_OUT_U16 <= DATA_IN_U16;
            DATA_OUT_U17 <= DATA_IN_U17;
            DATA_OUT_U18 <= DATA_IN_U18;
            DATA_OUT_U19 <= DATA_IN_U19;
            DATA_OUT_U20 <= DATA_IN_U20;
            DATA_OUT_U21 <= DATA_IN_U21;
            DATA_OUT_U22 <= DATA_IN_U22;
            DATA_OUT_U23 <= DATA_IN_U23;
            DATA_OUT_U24 <= DATA_IN_U24;
            DATA_OUT_U25 <= DATA_IN_U25;
        end
    end
*/
   
/*

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