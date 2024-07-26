`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 16:31:12
// Design Name: 
// Module Name: EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX(A, B, ALU_out, ALUOP);
input [31:0] A, B;
input [1:0] ALUOP;
output reg [31:0] ALU_out;

always @ (*) begin
    case(ALUOP)
    2'd0 : ALU_out = A + B;
    2'd1 : ALU_out = A - B;
    2'd2 : ALU_out = ~(A & B);
    2'd3 : ALU_out = ~(A | B);
    endcase
end

endmodule
