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
    
    
module overlap_module_71bit(     
    B2_in1,                
    B2_in2,             
    B2_in3,   
    B2_out 
    );     


parameter n = 72;
    
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

assign B2_out[11] = B2_in1[11];

assign B2_out[12] = B2_in1[12];

assign B2_out[13] = B2_in1[13];

assign B2_out[14] = B2_in1[14];

assign B2_out[15] = B2_in1[15];

assign B2_out[16] = B2_in1[16];

assign B2_out[17] = B2_in1[17];

assign B2_out[18] = B2_in1[18];

assign B2_out[19] = B2_in1[19];

assign B2_out[20] = B2_in1[20];

assign B2_out[21] = B2_in1[21];

assign B2_out[22] = B2_in1[22];

assign B2_out[23] = B2_in1[23];

assign B2_out[24] = B2_in1[24];

assign B2_out[25] = B2_in1[25];

assign B2_out[26] = B2_in1[26];

assign B2_out[27] = B2_in1[27];

assign B2_out[28] = B2_in1[28];

assign B2_out[29] = B2_in1[29];

assign B2_out[30] = B2_in1[30];

assign B2_out[31] = B2_in1[31];

assign B2_out[32] = B2_in1[32];

assign B2_out[33] = B2_in1[33];

assign B2_out[34] = B2_in1[34];

assign B2_out[35] = B2_in1[35];

assign B2_out[36] = B2_in1[36]^ B2_in2[0];

assign B2_out[37] = B2_in1[37]^ B2_in2[1];

assign B2_out[38] = B2_in1[38]^ B2_in2[2];

assign B2_out[39] = B2_in1[39]^ B2_in2[3];

assign B2_out[40] = B2_in1[40]^ B2_in2[4];

assign B2_out[41] = B2_in1[41]^ B2_in2[5];

assign B2_out[42] = B2_in1[42]^ B2_in2[6];

assign B2_out[43] = B2_in1[43]^ B2_in2[7];

assign B2_out[44] = B2_in1[44]^ B2_in2[8];

assign B2_out[45] = B2_in1[45]^ B2_in2[9];

assign B2_out[46] = B2_in1[46]^ B2_in2[10];

assign B2_out[47] = B2_in1[47]^ B2_in2[11];

assign B2_out[48] = B2_in1[48]^ B2_in2[12];

assign B2_out[49] = B2_in1[49]^ B2_in2[13];

assign B2_out[50] = B2_in1[50]^ B2_in2[14];

assign B2_out[51] = B2_in1[51]^ B2_in2[15];

assign B2_out[52] = B2_in1[52]^ B2_in2[16];

assign B2_out[53] = B2_in1[53]^ B2_in2[17];

assign B2_out[54] = B2_in1[54]^ B2_in2[18];

assign B2_out[55] = B2_in1[55]^ B2_in2[19];

assign B2_out[56] = B2_in1[56]^ B2_in2[20];

assign B2_out[57] = B2_in1[57]^ B2_in2[21];

assign B2_out[58] = B2_in1[58]^ B2_in2[22];

assign B2_out[59] = B2_in1[59]^ B2_in2[23];

assign B2_out[60] = B2_in1[60]^ B2_in2[24];

assign B2_out[61] = B2_in1[61]^ B2_in2[25];

assign B2_out[62] = B2_in1[62]^ B2_in2[26];

assign B2_out[63] = B2_in1[63]^ B2_in2[27];

assign B2_out[64] = B2_in1[64]^ B2_in2[28];

assign B2_out[65] = B2_in1[65]^ B2_in2[29];

assign B2_out[66] = B2_in1[66]^ B2_in2[30];

assign B2_out[67] = B2_in1[67]^ B2_in2[31];

assign B2_out[68] = B2_in1[68]^ B2_in2[32];

assign B2_out[69] = B2_in1[69]^ B2_in2[33];

assign B2_out[70] = B2_in1[70]^ B2_in2[34];

assign B2_out[71] = B2_in2[35];

assign B2_out[72] = B2_in2[36]^B2_in3[0];

assign B2_out[73] = B2_in2[37]^B2_in3[1];

assign B2_out[74] = B2_in2[38]^B2_in3[2];

assign B2_out[75] = B2_in2[39]^B2_in3[3];

assign B2_out[76] = B2_in2[40]^B2_in3[4];

assign B2_out[77] = B2_in2[41]^B2_in3[5];

assign B2_out[78] = B2_in2[42]^B2_in3[6];

assign B2_out[79] = B2_in2[43]^B2_in3[7];

assign B2_out[80] = B2_in2[44]^B2_in3[8];

assign B2_out[81] = B2_in2[45]^B2_in3[9];

assign B2_out[82] = B2_in2[46]^B2_in3[10];

assign B2_out[83] = B2_in2[47]^B2_in3[11];

assign B2_out[84] = B2_in2[48]^B2_in3[12];

assign B2_out[85] = B2_in2[49]^B2_in3[13];

assign B2_out[86] = B2_in2[50]^B2_in3[14];

assign B2_out[87] = B2_in2[51]^B2_in3[15];

assign B2_out[88] = B2_in2[52]^B2_in3[16];

assign B2_out[89] = B2_in2[53]^B2_in3[17];

assign B2_out[90] = B2_in2[54]^B2_in3[18];

assign B2_out[91] = B2_in2[55]^B2_in3[19];

assign B2_out[92] = B2_in2[56]^B2_in3[20];

assign B2_out[93] = B2_in2[57]^B2_in3[21];

assign B2_out[94] = B2_in2[58]^B2_in3[22];

assign B2_out[95] = B2_in2[59]^B2_in3[23];

assign B2_out[96] = B2_in2[60]^B2_in3[24];

assign B2_out[97] = B2_in2[61]^B2_in3[25];

assign B2_out[98] = B2_in2[62]^B2_in3[26];

assign B2_out[99] = B2_in2[63]^B2_in3[27];

assign B2_out[100] = B2_in2[64]^B2_in3[28];

assign B2_out[101] = B2_in2[65]^B2_in3[29];

assign B2_out[102] = B2_in2[66]^B2_in3[30];

assign B2_out[103] = B2_in2[67]^B2_in3[31];

assign B2_out[104] = B2_in2[68]^B2_in3[32];

assign B2_out[105] = B2_in2[69]^B2_in3[33];

assign B2_out[106] = B2_in2[70]^B2_in3[34];

assign B2_out[107] = B2_in3[35];

assign B2_out[108] = B2_in3[36];

assign B2_out[109] = B2_in3[37];

assign B2_out[110] = B2_in3[38];

assign B2_out[111] = B2_in3[39];

assign B2_out[112] = B2_in3[40];

assign B2_out[113] = B2_in3[41];

assign B2_out[114] = B2_in3[42];

assign B2_out[115] = B2_in3[43];

assign B2_out[116] = B2_in3[44];

assign B2_out[117] = B2_in3[45];

assign B2_out[118] = B2_in3[46];

assign B2_out[119] = B2_in3[47];

assign B2_out[120] = B2_in3[48];

assign B2_out[121] = B2_in3[49];

assign B2_out[122] = B2_in3[50];

assign B2_out[123] = B2_in3[51];

assign B2_out[124] = B2_in3[52];

assign B2_out[125] = B2_in3[53];

assign B2_out[126] = B2_in3[54];

assign B2_out[127] = B2_in3[55];

assign B2_out[128] = B2_in3[56];

assign B2_out[129] = B2_in3[57];

assign B2_out[130] = B2_in3[58];

assign B2_out[131] = B2_in3[59];

assign B2_out[132] = B2_in3[60];

assign B2_out[133] = B2_in3[61];

assign B2_out[134] = B2_in3[62];

assign B2_out[135] = B2_in3[63];

assign B2_out[136] = B2_in3[64];

assign B2_out[137] = B2_in3[65];

assign B2_out[138] = B2_in3[66];

assign B2_out[139] = B2_in3[67];

assign B2_out[140] = B2_in3[68];

assign B2_out[141] = B2_in3[69];

assign B2_out[142] = B2_in3[70];

endmodule