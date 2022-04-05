`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////  
// Company:    
 // Engineer:   
 //  // Create Date: 25.01.2022 23:34:48 
// Design Name:     
// Module Name: overlap_module 
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
    
    
module overlap_module_21bit(     
    B2_in1,                
    B2_in2,             
    B2_in3,   
    B2_out 
    );     


parameter n = 22;
    
input [n-2:0] B2_in1;   
input [n-2:0] B2_in2;    
input [n-2:0] B2_in3;    

output [2*n-2:0] B2_out;  
    


assign B2_out[0] = B2_in1[0];

assign B2_out[1] = B2_in1[1];

assign B2_out[2] = B2_in1[2];

assign B2_out[3] = B2_in1[3];

assign B2_out[4] = B2_in1[4];

assign B2_out[5] = B2_in1[5];

assign B2_out[6] = B2_in1[6];

assign B2_out[7] = B2_in1[7];

assign B2_out[8] = B2_in1[8];

assign B2_out[9] = B2_in1[9];

assign B2_out[10] = B2_in1[10];

assign B2_out[11] = B2_in1[11]^ B2_in2[0];

assign B2_out[12] = B2_in1[12]^ B2_in2[1];

assign B2_out[13] = B2_in1[13]^ B2_in2[2];

assign B2_out[14] = B2_in1[14]^ B2_in2[3];

assign B2_out[15] = B2_in1[15]^ B2_in2[4];

assign B2_out[16] = B2_in1[16]^ B2_in2[5];

assign B2_out[17] = B2_in1[17]^ B2_in2[6];

assign B2_out[18] = B2_in1[18]^ B2_in2[7];

assign B2_out[19] = B2_in1[19]^ B2_in2[8];

assign B2_out[20] = B2_in1[20]^ B2_in2[9];

assign B2_out[21] = B2_in2[10];

assign B2_out[22] = B2_in2[11]^B2_in3[0];

assign B2_out[23] = B2_in2[12]^B2_in3[1];

assign B2_out[24] = B2_in2[13]^B2_in3[2];

assign B2_out[25] = B2_in2[14]^B2_in3[3];

assign B2_out[26] = B2_in2[15]^B2_in3[4];

assign B2_out[27] = B2_in2[16]^B2_in3[5];

assign B2_out[28] = B2_in2[17]^B2_in3[6];

assign B2_out[29] = B2_in2[18]^B2_in3[7];

assign B2_out[30] = B2_in2[19]^B2_in3[8];

assign B2_out[31] = B2_in2[20]^B2_in3[9];

assign B2_out[32] = B2_in3[10];

assign B2_out[33] = B2_in3[11];

assign B2_out[34] = B2_in3[12];

assign B2_out[35] = B2_in3[13];

assign B2_out[36] = B2_in3[14];

assign B2_out[37] = B2_in3[15];

assign B2_out[38] = B2_in3[16];

assign B2_out[39] = B2_in3[17];

assign B2_out[40] = B2_in3[18];

assign B2_out[41] = B2_in3[19];

assign B2_out[42] = B2_in3[20];

endmodule