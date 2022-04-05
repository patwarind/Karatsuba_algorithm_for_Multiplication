`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 18:15:59
// Design Name: 
// Module Name: KA_93bit
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

module KA_142bit(
    a,
    b,
    y
    );

input [141:0] a;
input [141:0] b;

input [282:0] y;


wire [70:0] a_mod_1; //71
wire [70:0] b_mod_1; //71
wire [140:0] y_mod_1;  //141

wire [70:0] a_mod_2; //71
wire [70:0] b_mod_2; //71
wire [140:0] y_mod_2; //141

wire [70:0] a_mod_3; //71
wire [70:0] b_mod_3; //71
wire [140:0] y_mod_3; //141

wire [140:0] B1_out1, B1_out2, B1_out3;

wire [282:0] y_modify;


KA_71bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_71bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_71bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[70:0], b_mod_1 = b[70:0];

assign a_mod_2 = a[141:71], b_mod_2 = b[141:71];

assign a_mod_3 = a[70:0]^a[141:71], b_mod_3 = b[70:0]^b[141:71];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_142bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[282:0];

endmodule