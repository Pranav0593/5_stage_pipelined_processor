`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 15:14:36
// Design Name: 
// Module Name: tb_pipe
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


module tb_pipe;

top DUT (clk, rst_n);

reg clk, rst_n;

always #5 clk = ~clk;

initial begin

    $dumpfile("tb_pipe.vcd");
    $dumpvars;
    clk = 0;
    rst_n = 0;
    #5 rst_n = 1;
    #100 $finish;
end

endmodule
