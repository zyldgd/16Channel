/*
 * file   : LTC220X_data_sampling.v
 * author : zyl
 * date   : 2018-8-22
 * addr   : whu.edu.ionosphereLab
 */

module LTC220X_data_sampling(
input                 clk,
input                 reset_n,
input  reg   [15:0]   DATA,
input                 CLKOUT_n, 
input                 CLKOUT_p 
);

reg   [15:0]      data_reg = 0;


always @(posedge CLKOUT_n ) begin
    data_reg <= DATA;
end




endmodule 
//end LTC220X_data_sampling