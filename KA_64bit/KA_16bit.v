`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2022 19:05:02
// Design Name: 
// Module Name: KA_16bit
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


module KA_16bit(
    a,
    b,
    y
    );

parameter n = 16;
input [n-1:0] a;
input [n-1:0] b;

output [2*n-2:0] y;


wire [(n/2)-1:0] a_mod_1;
wire [(n/2)-1:0] b_mod_1;
wire [n-2:0] y_mod_1;

wire [(n/2)-1:0] a_mod_2;
wire [(n/2)-1:0] b_mod_2;
wire [n-2:0] y_mod_2;

wire [(n/2)-1:0] a_mod_3;
wire [(n/2)-1:0] b_mod_3;
wire [n-2:0] y_mod_3;

wire [n-2:0] B1_out1, B1_out2, B1_out3;


KA_8bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_8bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_8bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[7:0], b_mod_1 = b[7:0];

assign a_mod_2 = a[15:8], b_mod_2 = b[15:8];

assign a_mod_3 = a[7:0]^a[15:8], b_mod_3 = b[7:0]^b[15:8];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_16bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y)
        );


endmodule