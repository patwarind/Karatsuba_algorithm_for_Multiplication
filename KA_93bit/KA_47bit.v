`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:02:03
// Design Name: 
// Module Name: KA_47bit
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


module KA_47bit(
    a,
    b,
    y
    );

input [46:0] a;
input [46:0] b;

output [92:0] y;


wire [23:0] a_mod_1; //23
wire [23:0] b_mod_1; //23
wire [46:0] y_mod_1;  //46

wire [23:0] a_mod_2; //23
wire [23:0] b_mod_2; //23
wire [46:0] y_mod_2; //46

wire [23:0] a_mod_3; //47
wire [23:0] b_mod_3; //47
wire [46:0] y_mod_3; //95

wire [46:0] B1_out1, B1_out2, B1_out3;

wire [94:0] y_modify;

KA_24bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_24bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_24bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[23:0], b_mod_1 = b[23:0];

assign a_mod_2 = {1'b0,a[46:24]}, b_mod_2 = {1'b0,b[46:24]};

assign a_mod_3 = a[23:0]^{1'b0,a[46:24]}, b_mod_3 = b[23:0]^{1'b0,b[46:24]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_47bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[92:0];

endmodule