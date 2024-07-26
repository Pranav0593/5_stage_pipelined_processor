`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 15:36:49
// Design Name: 
// Module Name: IF
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


module IF(clk, rst_n, instr, ifstop, pc_count);
input clk, rst_n, ifstop;

output reg [31:0] instr;
output reg [1:0] pc_count;

reg [7:0] instr_mem [0:23];
initial begin
    instr_mem[0] = 8'h00;
    instr_mem[1] = 8'h03;
    instr_mem[2] = 8'h88;
    instr_mem[3] = 8'h23;
    
    instr_mem[4] = 8'h00;
    instr_mem[5] = 8'h02;
    instr_mem[6] = 8'h94;
    instr_mem[7] = 8'h86;
    
    instr_mem[8] = 8'h00;
    instr_mem[9] = 8'h02;
    instr_mem[10] = 8'h20;
    instr_mem[11] = 8'hE9;
    
    instr_mem[12] = 8'h00;
    instr_mem[13] = 8'h03;
    instr_mem[14] = 8'h2D;
    instr_mem[15] = 8'h4C;
    
end

reg [31:0] PC; 

always @(posedge clk or negedge rst_n) begin
if(ifstop)begin
 PC<=32'd0;
pc_count =2'd0;
end
else begin
    if(!rst_n) begin 
        PC <= 32'd0;
        pc_count =2'd0;
        end
    else begin
    PC <= PC+4;
    pc_count <= pc_count+1;
    end
end
end
always @ (*) begin
    instr = {instr_mem[PC], instr_mem[PC+1], instr_mem[PC+2], instr_mem[PC+3]};    
end

endmodule
