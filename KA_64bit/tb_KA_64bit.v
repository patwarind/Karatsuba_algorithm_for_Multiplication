`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2022 18:19:10
// Design Name: 
// Module Name: tb_8bit
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

module tb_64bit(

    );


reg [63:0] a;
reg [63:0] b;

wire [126:0] y;

   
   
KA_64bit dut(a,b,y);
 
initial 
begin
#5;

a = 64'b1010101110101011101010111010101110101011101010111010101110101011; 
b = 64'b1101111011011110110111101101111011011110110111101101111011011110;
#10;

end 
 
    
endmodule

