module test(
	input                 clk,
	input                 CLKOUT_n_25,  

	input        [15:0]   DATA_25,
	input        [15:0]   DATA_24,
	input        [15:0]   DATA_23,
	input                 RX1,
	output                TX1,

	output reg   [3:0]    sample_clk,
	output reg   [3:0]    led,
	output       [15:0]   DATA25_out,
	output       [15:0]   DATA24_out,
	output       [15:0]   DATA23_out
	);

	reg [15:0] data_reg25 = 0;
	reg [15:0] data_reg24 = 0;
	reg [15:0] data_reg23 = 0;

	reg [31:0] count = 0;

	wire      send;
	reg       signel = 0;
	reg [7:0] state  = 0;
	assign send = CLKOUT_n_25;

	always @(posedge clk_50) begin
		case(state)
			0: begin
					signel <= 0;
					if(send) begin
						state <= 1;
					end
				end
			1: begin
					signel <=1;
					state<=2;
				end
			2: begin
					signel <=0;
					if(IDLE) begin
						state <= 0;
					end
				end
			default:
				state<=0;
		endcase
	end
	 
	reg [7:0]       sendState=0; 
	reg [7:0]       sendHalfData;
	reg [15:0]      sendData;
	reg [15:0]      dataINtoFir;
   reg             sendSignle=0;
	wire [15:0]     dataINformFir;
	
	
	always @(posedge CLKOUT_n_25) begin
		count <= count +1;
		led <= count[26:23];
		dataINtoFir <= DATA_23;
		sendData <= dataINformFir;
		case(sendState)
			0:	begin 
					sendSignle <=0;
					if(count[21]) begin
					   sendHalfData <= sendData[7:0];
						sendState <=1;
					end
				end
			1: begin
					sendSignle <=1;
					sendState <=2;
				end
			2: begin
					sendSignle <=0;
					if(IDLE) begin
						sendHalfData <= sendData[15:8];
						sendState <=3;
					end
				end
			3: begin
					sendSignle <=1;					
					sendState <=4;
				end
			4: begin
					sendSignle <=0;
					if(IDLE)
						sendState <=5;
				end
			5: begin
					if(!count[21])
						sendState <=0;
				end	
			default: begin
					sendState <=0;
				end
		endcase
	end
	

//	always @(posedge clk_20) begin
//		count <= count +1;
//		led <= count[26:23];
//	end

	FIR fir1(
		.clk(clk_20),
		.din(dataINtoFir),
		.rfd(),
		.rdy(),
		.dout(dataINformFir)
	);

	pll it(
		.CLK_IN1(clk),
		.CLK_OUT1(clk_20),
		.CLK_OUT2(clk_50)
	);

	uart_tx i1 (
		 .clk        (clk_50),
		 .reset_n    (1),
		 .wrreq      (sendSignle),
		 .wdata      (sendHalfData),
		 ///.RX         (),
		 .TX         (TX1),
		 .IDLE       (IDLE)
	);
 
endmodule

