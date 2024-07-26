`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 15:28:10
// Design Name: 
// Module Name: cntrl_pipe
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


module cntrl_pipe(opcode, pc_count, enable_ab, enable_c, ifstop, ALUOP);
input [16:0] opcode;
output reg enable_ab, enable_c, ifstop;
output reg [1:0] ALUOP;
input [1:0] pc_count;

always @(*) begin
enable_ab=1'b1;enable_c=1'b1;
if(pc_count == 4) ifstop=1'b0;
else ifstop =1'b0;

    case(opcode)
        17'd5:begin 
            ALUOP= 2'b00;
        end
        17'd6: begin
        ALUOP=2'b01;
        end
        17'd7: begin
        ALUOP=2'b10;
        end
        17'd4: begin
        ALUOP=2'b11;
        end
        endcase
end
endmodule
