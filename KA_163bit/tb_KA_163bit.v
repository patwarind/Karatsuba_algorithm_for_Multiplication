`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 23:04:23
// Design Name: 
// Module Name: tb_KA_93bit
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

module tb_KA_163bit(

    );


reg [162:0] a;
reg [162:0] b;

wire [324:0] y;

   
   
KA_163bit dut(a,b,y);
 
initial 
begin
#5;

a = 163'b10010011101110010011101110010011101110010011101110010011101110010011101110010011; 
b = 163'b10100010110100010110100010110100010110100010110100010110100010110100010110100010;
#10;

end 
 
    
endmodule

