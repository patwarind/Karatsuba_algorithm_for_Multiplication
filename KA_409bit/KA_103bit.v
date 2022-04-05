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


module KA_103bit(
    a,
    b,
    y
    );

input [102:0] a;
input [102:0] b;

output [204:0] y;


wire [51:0] a_mod_1; //52
wire [51:0] b_mod_1; //52
wire [102:0] y_mod_1;  //103

wire [51:0] a_mod_2; //52
wire [51:0] b_mod_2; //52
wire [102:0] y_mod_2; //103

wire [51:0] a_mod_3; //52
wire [51:0] b_mod_3; //52
wire [102:0] y_mod_3; //103

wire [102:0] B1_out1, B1_out2, B1_out3;

wire [206:0] y_modify;

KA_52bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_52bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_52bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[51:0], b_mod_1 = b[51:0];

assign a_mod_2 = {1'b0, a[102:52]}, b_mod_2 = {1'b0, b[102:52]};

assign a_mod_3 = a[51:0]^{1'b0, a[102:52]}, b_mod_3 = b[51:0]^{1'b0, b[102:52]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_103bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[204:0];

endmodule
