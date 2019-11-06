module MIDLE_5(
    input  wire                  CLK,
    input  wire  signed [15:0]   DATA_IN1,
    input  wire  signed [15:0]   DATA_IN2,
    input  wire  signed [15:0]   DATA_IN3,
    input  wire  signed [15:0]   DATA_IN4,
    input  wire  signed [15:0]   DATA_IN5,
    output reg   signed [15:0]   DATA_OUT     
    );

always @(posedge CLK ) begin

// 1
// 2345
// 23 45
// 24 35 
// 25 34

    if ((DATA_IN2 <= DATA_IN1 && DATA_IN3 <= DATA_IN1 && DATA_IN1 <= DATA_IN4 && DATA_IN1 <= DATA_IN5) || 
        (DATA_IN2 <= DATA_IN1 && DATA_IN4 <= DATA_IN1 && DATA_IN1 <= DATA_IN3 && DATA_IN1 <= DATA_IN5) ||
        (DATA_IN2 <= DATA_IN1 && DATA_IN5 <= DATA_IN1 && DATA_IN1 <= DATA_IN3 && DATA_IN1 <= DATA_IN4)) begin
        DATA_OUT <= DATA_IN1;
    end 

// 2
// 1345
// 13 45
// 14 35
// 15 34

    if ((DATA_IN1 <= DATA_IN2 && DATA_IN3 <= DATA_IN2 && DATA_IN2 <= DATA_IN4 && DATA_IN2 <= DATA_IN5) || 
        (DATA_IN1 <= DATA_IN2 && DATA_IN4 <= DATA_IN2 && DATA_IN2 <= DATA_IN3 && DATA_IN2 <= DATA_IN5) ||
        (DATA_IN1 <= DATA_IN2 && DATA_IN5 <= DATA_IN2 && DATA_IN2 <= DATA_IN3 && DATA_IN2 <= DATA_IN4)) begin
        DATA_OUT <= DATA_IN2;
    end

// 3
// 1245
// 12 45
// 14 25
// 15 24

    if ((DATA_IN1 <= DATA_IN3 && DATA_IN2 <= DATA_IN3 && DATA_IN3 <= DATA_IN4 && DATA_IN3 <= DATA_IN5) || 
        (DATA_IN1 <= DATA_IN3 && DATA_IN4 <= DATA_IN3 && DATA_IN3 <= DATA_IN2 && DATA_IN3 <= DATA_IN5) ||
        (DATA_IN1 <= DATA_IN3 && DATA_IN5 <= DATA_IN3 && DATA_IN3 <= DATA_IN2 && DATA_IN3 <= DATA_IN4)) begin
        DATA_OUT <= DATA_IN3;
    end

// 4
// 1235
// 12 35
// 13 25
// 15 23

    if ((DATA_IN1 <= DATA_IN4 && DATA_IN2 <= DATA_IN4 && DATA_IN4 <= DATA_IN3 && DATA_IN4 <= DATA_IN5) || 
        (DATA_IN1 <= DATA_IN4 && DATA_IN3 <= DATA_IN4 && DATA_IN4 <= DATA_IN2 && DATA_IN4 <= DATA_IN5) ||
        (DATA_IN1 <= DATA_IN4 && DATA_IN5 <= DATA_IN4 && DATA_IN4 <= DATA_IN2 && DATA_IN4 <= DATA_IN3)) begin
        DATA_OUT <= DATA_IN4;
	// end else begin
	//     DATA_OUT <= DATA_IN5;
    end

// 5
// 1234
// 12 34
// 13 24
// 14 23
/*    else begin
        DATA_OUT <= DATA_IN5;
    end
*/	 
    if ((DATA_IN1 <= DATA_IN5 && DATA_IN2 <= DATA_IN5 && DATA_IN5 <= DATA_IN3 && DATA_IN5 <= DATA_IN4) || 
        (DATA_IN1 <= DATA_IN5 && DATA_IN3 <= DATA_IN5 && DATA_IN5 <= DATA_IN2 && DATA_IN5 <= DATA_IN4) ||
        (DATA_IN1 <= DATA_IN5 && DATA_IN4 <= DATA_IN5 && DATA_IN5 <= DATA_IN2 && DATA_IN5 <= DATA_IN3)) begin
        DATA_OUT <= DATA_IN5;
    end

end


endmodule