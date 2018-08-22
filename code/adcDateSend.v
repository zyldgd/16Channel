/*
 * file   : adc_data_send.v 
 * author : zyl
 * date   : 2018-8-10
 * addr   : whu.edu.ionosphereLab
 */


module adc_data_send(
input    wire               clk,
input    wire               reset_n,
input    wire               en,
input    wire    [15: 0]    dataIN,
input    wire    [3 : 0]    sampleMode,

output   reg     [15: 0]    dataOUT,
output   reg                sync
);

parameter        [ 3: 0]     IDLE = 15;
parameter        [ 3: 0]     S0   = 0;
parameter        [ 3: 0]     S1   = 1;
parameter        [ 3: 0]     S2   = 2;
parameter        [ 3: 0]     S3   = 3;
parameter        [ 3: 0]     S4   = 4;
parameter        [ 3: 0]     S5   = 5;


reg              [ 3: 0]     curr_state = IDLE;
reg              [ 3: 0]     next_state = IDLE;
reg              [15: 0]     data = 0;
reg              [ 7: 0]     count = 0;
reg              [ 7: 0]     sampleNumReg=0; 



/******************** stateM_1***********************/
always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        curr_state <= IDLE;
        next_state <= IDLE;
        sync <= 0;
        dataOUT <= 0;
    end else begin
        curr_state <= next_state;
    end
end


/******************** stateM_2 ***********************/
always @(*) begin
    case (curr_state)
      IDLE:begin
        next_state = S0;
      end
      S0: begin
        next_state = S1;
      end
      S1: begin
        if (en) begin
            next_state = S2;
		  end
      end
      S2: begin
        if (!en || count>=sampleNumReg) begin
            next_state = S3;
        end
      end
      S3: begin
        next_state = S4;
      end
      S4: begin
        next_state = IDLE;
      end
		default: begin
        next_state = IDLE;    
      end
    endcase
end

/******************** stateM_3 ***********************/
always @(negedge clk or negedge reset_n) begin
    case (curr_state)
        IDLE: begin
        end
        /**********************   reset   *************************/
        S0: begin
            count <= 0;
            if (sampleMode == 0) begin
                sampleNumReg <= 16;
            end else if (sampleMode == 1) begin
                sampleNumReg <= 32;
            end else if (sampleMode == 2) begin
                sampleNumReg <= 64;
            end
            
        end
        S1: begin          
        end
        /**********************   sending   *************************/
        S2: begin
            sync <= 0;
            dataOUT <= dataIN;
            count   <= count+1;
        end
        /********************** sync signal *************************/
        S3: begin
            sync <= 1;
        end
        S4: begin
            sync <= 0;
        end
        default: begin
            
        end
    endcase
end
endmodule
