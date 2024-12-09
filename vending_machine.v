`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 01:32:48 PM
// Design Name: 
// Module Name: vending_machine
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

module vending_machine(
        input [4:0]N,
        input [2:0]D,
        input clk,rst,
        output reg R,S
    );
    
    parameter s0=0, s5=1, s10=2, s15=3, s20=4, s25=5, s30=6;
    
    reg [2:0] PS, NS;
    
    always @ (posedge clk or posedge rst)
        begin
        
            if(rst) begin
                PS <= s0;
                end
            else 
                PS <= NS;
        end
        
    always @ (*)
    begin
    
    R = 0;
    S = 0;
    //NS = s0;
        case(PS)
            s0 : begin
                
                R <= 0;
                S <= 0;
                if(N[0])
                    NS = s5;
                else if(D[0])
                    NS = s10;
            end
            s5 : begin
            
                if(N[1])
                    NS = s10;
                else if(D[0])
                    NS = s15;
            end
            s10 : begin
              
                if(N[2])
                    NS = s15;
                else if(N[0]&N[1]&D[0])
                    NS = s20;
                else if(D[0]&D[1])
                NS = s20;
            end
            s15 : begin
             
                if(N[3])
                    NS = s20;
                else if(D[0]&N[0]&N[1]&~N[2])
                    NS = s20;
                else if(D[0]&N[0]&N[1]&N[2])
                    NS = s25;
                else if(D[1])
                    NS = s25;
            end
            s20 : begin

                if(N[4])
                    NS = s25;
                else if(D[0]&N[0]&N[1]&N[2]&~N[3])
                    NS = s25;
                else if(D[0]&N[0]&N[1]&D[1]&~N[2]&~N[3])
                    NS = s30;
                else if(N[0]&N[1]&N[2]&N[3]&D[0]&~D[1])
                    NS = s30;
                else if(D[2])
                    NS = s30;
            end
            s25 : begin
              
                NS = s0;
            end
            s30 : begin
            
                    NS = s0;
            end
            default : NS = s0;
        endcase
        case(PS)
            s0 : begin
                S<=0;
                R<=0;
            end
            s5 : begin
                S<=0;
                R<=0;
            end
            s10 : begin
                S<=0;
                R<=0;
            end
            s15 : begin
                S<=0;
                R<=0;
            end
            s20 : begin
                S<=0;
                R<=0;
            end
            s25 : begin
                    S<=1;
                    R<=0;
                    end
            s30 : begin
                    S<=1;
                    R<=1;
                 end
            default : begin
                    S<=0;
                    R<=0;
                end
        endcase
    end
    
    
endmodule
