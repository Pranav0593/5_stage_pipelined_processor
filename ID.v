`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 15:59:04
// Design Name: 
// Module Name: ID
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


module ID(instr, A,B,control, en_write, write_data, des,clk);
input [31:0] instr;
input clk;
input en_write;
input [31:0] write_data;
input [4:0] des;
output [31:0] A,B;
output [4:0] control;
wire[1:0] ALUOP;

cntrl_pipe M1 (.opcode(instr[31:15]), .enable_ab(enable_ab), .enable_c(enable_c), .ifstop(ifstop), .ALUOP(ALUOP));
assign control = {enable_ab, enable_c, ifstop, ALUOP};
register_pipe R (.clk(clk), .rs(instr[14:10]), .rt(instr[9:5]), .rd(des), .A(A), .B(B), .enable_ab(enable_ab), .enable_c(en_write), .write_data(write_data));

endmodule
