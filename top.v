`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 16:42:23
// Design Name: 
// Module Name: top
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


module top(clk, rst_n);

input clk, rst_n;

wire [31:0] instr;
wire [4:0] control;
wire [31:0] A, B;
 wire [31:0] ALU_out;

reg [31:0] IF_ID;
reg [100:0] ID_EX;
reg [68:0] EX_WB;

IF S1 (.clk(clk), .rst_n(rst_n), .instr(instr));
ID S2 (.instr(IF_ID), .A(A), .B(B), .control(control), .en_write(EX_WB[35]), .write_data(EX_WB[31:0]), .des(EX_WB[41:37]), .clk(clk));
EX S3 (.A(ID_EX[68:37]), .B(ID_EX[36:5]), .ALU_out(ALU_out), .ALUOP(ID_EX[1:0]));

always @ (posedge clk) begin
    IF_ID <= instr;
    ID_EX <= {IF_ID, A, B, control};
    EX_WB <= {ID_EX[100:69], ID_EX[4:0], ALU_out};
end

endmodule
