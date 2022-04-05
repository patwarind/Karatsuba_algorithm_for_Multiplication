`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:51:57
// Design Name: 
// Module Name: KA_2bit
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

module KA_2bit(
    a, 
    b, 
    y
    );
    
input [1:0] a;
input [1:0] b;

output [2:0] y;

reg [2:0] y;

always @(a,b)
begin
    y[0] = (a[0] & b[0]);
    y[2] = (a[1] & b[1]);
    y[1] = (y[0] ^ y[2]) ^ ((a[0] ^ a[1]) & (b[0] ^ b[1]));
end
    
endmodule


