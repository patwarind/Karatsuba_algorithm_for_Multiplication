`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2022 18:19:10
// Design Name: 
// Module Name: tb_4bit
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

module tb_4bit(

    );


reg [3:0] a;
reg [3:0] b;

wire [6:0] y;

   
   
KA_4bit dut(a,b,y);
 
initial 
begin
#5;

a = 13; b = 10;
#10;

end 
 
    
endmodule

