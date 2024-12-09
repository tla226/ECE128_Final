`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 01:58:54 PM
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb;
    
    reg [4:0] N;
    reg [2:0] D;
    reg clk;
    reg rst;
    wire R, S;
    
    vending_machine uut(N, D, clk, rst, R, S);
    
    initial
        begin
            N = 5'b00000;
            D = 3'b000;
            clk = 1'b0;
            rst = 1'b1;
            
            // 5N
            #10 rst = 1'b0;
            #10 N = 5'b00001;
            #10 N=5'b00011;
            #10 N=5'b00111;
            #10 N=5'b01111;
            #10 N=5'b11111;
            #10 N = 5'b00000;
            #50 rst = 1'b1;
            
            // 3N 1D
            #10 rst = 1'b0;
            #10 N = 5'b00001;
            #10 N=5'b00011;
            #10 N=5'b00111;
            #10 D = 3'b001;
            #10 N = 5'b00000;
            D = 3'b000;
            #50 rst = 1'b1;
            
            // 2N 2D
            #10 rst = 1'b0;
            #10 N = 5'b00001;
            #10 N=5'b00011;
            #10 D = 3'b001;
            #10 D = 3'b011;
            #10 N = 5'b00000;
            D = 3'b000;
            #50 rst = 1'b1;
            
            // 4N 1D
            #10 rst = 1'b0;
            #10 N = 5'b00001;
            #10 N=5'b00011;
            #10 N = 5'b00111;
            #10 N=5'b01111;
            #10 D = 3'b001;
            #10 N = 5'b00000;
            D = 3'b000;
            #50 rst = 1'b1;
            
            // 3D
            #10 rst = 1'b0;
            #10 D = 3'b001;
            #10 D = 3'b011;
            #10 D = 3'b111;
            #10 D = 3'b000;
            D = 3'b000;
            #50;
        
        end
        
    always #5 clk = ~clk;
        
    
endmodule
