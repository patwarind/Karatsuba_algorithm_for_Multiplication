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

module tb_32bit(

    );


reg [31:0] a;
reg [31:0] b;

wire [62:0] y;

   
   
KA_32bit dut(a,b,y);
 
initial 
begin
#5;

a = 32'b10101011101010111010101110101011; b = 32'b11011110110111101101111011011110;
#10;

end 
 
    
endmodule

