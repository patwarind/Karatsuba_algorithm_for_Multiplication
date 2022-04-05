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

module KA_66bit(
    a,
    b,
    y
    );

input [65:0] a;
input [65:0] b;

input [130:0] y;


wire [32:0] a_mod_1; //33
wire [32:0] b_mod_1; //33
wire [64:0] y_mod_1;  //65

wire [32:0] a_mod_2; //33
wire [32:0] b_mod_2; //33
wire [64:0] y_mod_2; //65

wire [32:0] a_mod_3; //33
wire [32:0] b_mod_3; //33
wire [64:0] y_mod_3; //65

wire [64:0] B1_out1, B1_out2, B1_out3;

wire [130:0] y_modify;


KA_33bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_33bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_33bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[32:0], b_mod_1 = b[32:0];

assign a_mod_2 = a[65:33], b_mod_2 = b[65:33];

assign a_mod_3 = a[32:0]^a[65:33], b_mod_3 = b[32:0]^b[65:33];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_66bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[130:0];

endmodule