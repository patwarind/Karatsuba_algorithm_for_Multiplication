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


module KA_409bit(
    a,
    b,
    y
    );

input [408:0] a;
input [408:0] b;

output [816:0] y;


wire [204:0] a_mod_1; //205
wire [204:0] b_mod_1; //205
wire [408:0] y_mod_1;  //409

wire [204:0] a_mod_2; //205
wire [204:0] b_mod_2; //205
wire [408:0] y_mod_2; //409

wire [204:0] a_mod_3; //205
wire [204:0] b_mod_3; //205
wire [408:0] y_mod_3; //409

wire [408:0] B1_out1, B1_out2, B1_out3;

wire [818:0] y_modify;

KA_205bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_205bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_205bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[204:0], b_mod_1 = b[204:0];

assign a_mod_2 = {1'b0, a[408:205]}, b_mod_2 = {1'b0, b[408:205]};

assign a_mod_3 = a[204:0]^{1'b0, a[408:205]}, b_mod_3 = b[204:0]^{1'b0, b[408:205]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_409bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[816:0];

endmodule
