`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:37:41
// Design Name: 
// Module Name: KA_6bit
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


module KA_52bit(
    a,
    b,
    y
    );

input [51:0] a;
input [51:0] b;

output [102:0] y;


wire [25:0] a_mod_1; //26
wire [25:0] b_mod_1; //26
wire [50:0] y_mod_1;  //51

wire [25:0] a_mod_2; //26
wire [25:0] b_mod_2; //26
wire [50:0] y_mod_2; //51

wire [25:0] a_mod_3; //26
wire [25:0] b_mod_3; //26
wire [50:0] y_mod_3; //51

wire [50:0] B1_out1, B1_out2, B1_out3;

wire [102:0] y_modify;

KA_26bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_26bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_26bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[25:0], b_mod_1 = b[25:0];

assign a_mod_2 = a[51:26], b_mod_2 = b[51:26];

assign a_mod_3 = a[25:0]^a[51:26], b_mod_3 = b[25:0]^b[51:26];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_52bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[102:0];

endmodule
