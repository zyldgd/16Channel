/*
 * file    : MEAN.v
 * author  : zyl
 * date    : 2018-8-25
 * version : 1.0
 * addr    : whu.edu.ionosphereLab
 * descrp  : 
 *       @parm   AMOUNT   : [1,50]
 *       @output DATA_OUT : average of DATA   
 */


module MEAN(parameter AMOUNT = 10)(
    input   wire          CLK,
    input   wire          RESET_n,
    input   wire  [15:0]  DATA_IN,

    output  reg   [15:0]  DATA_OUT
    );

    reg  signed   [31:0]  AVERAGE = 0;
    reg  signed   [31:0]  SUM=0;
    reg           [15:0]  DATA[50:0];
    reg           [ 7:0]  NUM=0;
    integer               i;

    assign DATA_OUT = {AVERAGE[31],AVERAGE[14:0]};

    always @(posedge CLK) begin
        if (!RESET_n) begin
            SUM <= 0;
            NUM <= 0;
        end else begin
            DATA <= DATA[NUM];
            for(i=0;i<AMOUNT;i=i+1) begin
                SUM <= SUM + DATA[i]
            end
            AVERAGE <= SUM/AMOUNT;
            NUM <= COUNT<AMOUNT ? (NUM+1) : 0;         
        end
    end


endmodule