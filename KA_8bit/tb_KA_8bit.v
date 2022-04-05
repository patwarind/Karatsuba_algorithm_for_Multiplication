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

module tb_8bit(

    );


reg [7:0] a;
reg [7:0] b;

wire [14:0] y;

   
   
KA_8bit dut(a,b,y);
 
initial 
begin
#5;

a = 8'b10101011; b = 8'b11011110;
#10;

end 
 
    
endmodule

