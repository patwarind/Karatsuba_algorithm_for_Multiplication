`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:50:06
// Design Name: 
// Module Name: overlap_module_3bit
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


module overlap_module_3bit(     
    B2_in1,                
    B2_in2,             
    B2_in3,   
    B2_out 
    );     


parameter n = 4;
    
input [n-2:0] B2_in1;   
input [n-2:0] B2_in2;    
input [n-2:0] B2_in3;    

output [2*n-2:0] B2_out;  
    


assign B2_out[0] = B2_in1[0];

assign B2_out[1] = B2_in1[1];

assign B2_out[2] = B2_in1[2]^ B2_in2[0];

assign B2_out[3] = B2_in2[1];

assign B2_out[4] = B2_in2[2]^B2_in3[0];

assign B2_out[5] = B2_in3[1];

assign B2_out[6] = B2_in3[2];

endmodule