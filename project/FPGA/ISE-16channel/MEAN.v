/*
 * file    : MEAN.v
 * author  : zyl
 * date    : 2018-8-25
 * version : 1.0
 * addr    : whu.edu.ionosphereLab
 * descrp  : 
 *       @parm   AMOUNT   : [1,50]
 *       @output DATA_OUT : average of DATA   



module MEAN #(parameter AMOUNT = 20)(
    input   wire          CLK,
    input   wire          RESET_n,
    input   wire signed [15:0]  DATA_IN,

    output  wire [15:0]  DATA_OUT
    );

    reg  signed   [31:0]  AVERAGE = 0;
    reg  signed   [31:0]  SUM=0;
    reg  signed   [15:0]  DATA[19:0];
    reg           [ 7:0]  NUM=0;
    integer               i;

	 
    assign DATA_OUT = {AVERAGE[31],AVERAGE[14:0]};

    always @(posedge CLK) begin
        if (!RESET_n) begin
            SUM <= 0;
            NUM <= 0;
        end else begin
            DATA[NUM] <= DATA_IN;
            //for(i=0;i<AMOUNT;i=i+1)
            //    SUM <= SUM + DATA[i];
				SUM <= (DATA[0] + DATA[1] + DATA[2] + DATA[3] + DATA[4] + DATA[5] + DATA[6] + DATA[7] + DATA[8] + DATA[9] + DATA[10] + DATA[11] + DATA[12] + DATA[13] + DATA[14] + DATA[15] + DATA[16] + DATA[17] + DATA[18] + DATA[19]);
            AVERAGE <= SUM/AMOUNT;
				if(NUM<19) begin
					NUM <= NUM + 1;
				end else begin
					NUM <= 0;
				end       
        end
    end
endmodule
 */
 
 
 module MEAN #(parameter AMOUNT = 25)(
    input   wire          CLK,
    input   wire          RESET_n,
    input   wire signed [15:0]  DATA_IN,

    output  wire signed [15:0]  DATA_OUT
    );
	 
    wire signed   [15:0]  DATA_OUT_wire;
    reg  signed   [15:0]  DATA_raw[24:0];
	 wire signed   [15:0]  DATA_mid[ 4:0];
	 reg  signed   [15:0]  DATA[19:0];
    reg           [ 7:0]  NUM=0;
    reg  signed   [31:0]  AVERAGE = 0;
    reg  signed   [31:0]  SUM=0;

	 
    assign DATA_OUT = {AVERAGE[31],AVERAGE[14:0]};

    always @(posedge CLK) begin
        if (!RESET_n) begin
            NUM <= 0;
        end else begin
            DATA_raw[NUM] <= DATA_IN;
				DATA[NUM] <= DATA_OUT_wire;
				SUM <= (DATA[0] + DATA[1] + DATA[2] + DATA[3] + DATA[4] + DATA[5] + DATA[6] + DATA[7] + DATA[8] + DATA[9] + DATA[10] + DATA[11] + DATA[12] + DATA[13] + DATA[14] + DATA[15] + DATA[16] + DATA[17] + DATA[18] + DATA[19]);
            AVERAGE <= SUM/20;
				
            if(NUM<24) begin
					NUM <= NUM + 1;
				end else begin
					NUM <= 0;
				end       
        end
    end


MIDLE_5 m1(
	.CLK          (CLK),
	.DATA_IN1     (DATA_raw[0]),
	.DATA_IN2     (DATA_raw[1]),
	.DATA_IN3     (DATA_raw[2]),
	.DATA_IN4     (DATA_raw[3]),
	.DATA_IN5     (DATA_raw[4]),
	.DATA_OUT     (DATA_mid[0])
	);

MIDLE_5 m2(
	.CLK          (CLK),
	.DATA_IN1     (DATA_raw[5]),
	.DATA_IN2     (DATA_raw[6]),
	.DATA_IN3     (DATA_raw[7]),
	.DATA_IN4     (DATA_raw[8]),
	.DATA_IN5     (DATA_raw[9]),
	.DATA_OUT     (DATA_mid[1])
	);
	
MIDLE_5 m3(
	.CLK          (CLK),
	.DATA_IN1     (DATA_raw[10]),
	.DATA_IN2     (DATA_raw[11]),
	.DATA_IN3     (DATA_raw[12]),
	.DATA_IN4     (DATA_raw[13]),
	.DATA_IN5     (DATA_raw[14]),
	.DATA_OUT     (DATA_mid[2])
	);

MIDLE_5 m4(
	.CLK          (CLK),
	.DATA_IN1     (DATA_raw[15]),
	.DATA_IN2     (DATA_raw[16]),
	.DATA_IN3     (DATA_raw[17]),
	.DATA_IN4     (DATA_raw[18]),
	.DATA_IN5     (DATA_raw[19]),
	.DATA_OUT     (DATA_mid[3])
	);
	
MIDLE_5 m5(
	.CLK          (CLK),
	.DATA_IN1     (DATA_raw[20]),
	.DATA_IN2     (DATA_raw[21]),
	.DATA_IN3     (DATA_raw[22]),
	.DATA_IN4     (DATA_raw[23]),
	.DATA_IN5     (DATA_raw[24]),
	.DATA_OUT     (DATA_mid[4])
	);
	
MIDLE_5 m6(
	.CLK          (CLK),
	.DATA_IN1     (DATA_mid[0]),
	.DATA_IN2     (DATA_mid[1]),
	.DATA_IN3     (DATA_mid[2]),
	.DATA_IN4     (DATA_mid[3]),
	.DATA_IN5     (DATA_mid[4]),
	.DATA_OUT     (DATA_OUT_wire) // DATA_OUT_wire  Î´¹ý¾ùÖµÂË²¨
	); 
	
	
endmodule
