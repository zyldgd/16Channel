/*
File   : DATA_TRANS.v
Date   : 2018-9-20
Author : zyl
Addr   : whu.edu.ionosphereLab
Descr  :
    send a serial of data from 16 channels
    data in low first 
*/

module DATA_TRANS(
    input   wire               CLK_50M,
    input   wire               RESET_n,

    input   wire   [15:0]      DATA_IN_U10,
    input   wire   [15:0]      DATA_IN_U11,
    input   wire   [15:0]      DATA_IN_U12,
    input   wire   [15:0]      DATA_IN_U13,
    input   wire   [15:0]      DATA_IN_U14,
    input   wire   [15:0]      DATA_IN_U15,
    input   wire   [15:0]      DATA_IN_U16,
    input   wire   [15:0]      DATA_IN_U17,
    input   wire   [15:0]      DATA_IN_U18,
    input   wire   [15:0]      DATA_IN_U19,
    input   wire   [15:0]      DATA_IN_U20,
    input   wire   [15:0]      DATA_IN_U21,
    input   wire   [15:0]      DATA_IN_U22,
    input   wire   [15:0]      DATA_IN_U23,
    input   wire   [15:0]      DATA_IN_U24,
    input   wire   [15:0]      DATA_IN_U25,

    input   wire               RX,
    output  wire               TX
    );
    
 
    reg             [ 7:0]     CHANNEL;
    reg             [15:0]     DATA[15:0];  // 缓存 
	 reg             [ 7:0]     DATA_RX;
    wire            [ 7:0]     DATA_RX_reg;
	 
    reg             [ 7:0]     STATE;
    reg                        SEND_REQ;
    reg             [ 7:0]     SEND_DATA;


    always @(posedge CLK_50M) begin
        if (!RESET_n) begin
            STATE <= 0;
            SEND_REQ <= 0;
        end else begin
            case (STATE)
                0: begin
                    CHANNEL <= 0;
                    STATE <= 1;
                    SEND_REQ <= 0;
                end
                1: begin
							if(DATA_RX == 8'hFF) begin
							  DATA[0] <= DATA_IN_U10; 
							  DATA[1] <= DATA_IN_U11;
							  DATA[2] <= DATA_IN_U12;
							  DATA[3] <= DATA_IN_U13;
							  DATA[4] <= DATA_IN_U14;
							  DATA[5] <= DATA_IN_U15;
							  DATA[6] <= DATA_IN_U16;
							  DATA[7] <= DATA_IN_U17;
							  DATA[8] <= DATA_IN_U18;
							  DATA[9] <= DATA_IN_U19;
							  DATA[10] <= DATA_IN_U20;
							  DATA[11] <= DATA_IN_U21;
							  DATA[12] <= DATA_IN_U22;
							  DATA[13] <= DATA_IN_U23;
							  DATA[14] <= DATA_IN_U24;
							  DATA[15] <= DATA_IN_U25;
							  STATE <= 2;
						  end
                end
                2: begin
                    if (CHANNEL <= 15) begin
                        SEND_DATA <= DATA[CHANNEL][7:0];
                        STATE <= 3;
                    end else begin
                        if(DATA_RX == 8'h00)
									STATE <= 0;
                    end
                end
                3: begin
                    SEND_REQ <= 1;
                    STATE <= 4;
                end
                4: begin
                    SEND_REQ <= 0;
                    STATE <= 5;
                end
                5: begin
                    if (IDLE) begin
                        SEND_DATA <= DATA[CHANNEL][15:8];
                        STATE <= 6;
                    end
                end
                6: begin
                    SEND_REQ <= 1;
                    STATE <= 7;
                end
                7: begin
                    SEND_REQ <= 0;
                    STATE <= 8;
                end
                8: begin
                    if (IDLE) begin
                        CHANNEL <= CHANNEL+1;
                        STATE <= 2;
                    end
                end
                default: 
                    STATE <= 0;
            endcase
        end
    end
	 
	 always @(posedge CLK_50M) begin
			if(VALID)
				DATA_RX[7:0] <= DATA_RX_reg[7:0];
	 end
	 
	 
	UART_RX i2(
	     .CLK        (CLK_50M),
        .RESET_n    (RESET_n),
        .RX         (RX),
        .DATA_OUT   (DATA_RX_reg),
        .VALID      (VALID)
	); 

    uart_tx i1 (
        .clk        (CLK_50M),
        .reset_n    (RESET_n),
        .wrreq      (SEND_REQ),
        .wdata      (SEND_DATA),
        .RX         (),
        .TX         (TX),
        .IDLE       (IDLE)
    );
 

endmodule // DATA_TRANS