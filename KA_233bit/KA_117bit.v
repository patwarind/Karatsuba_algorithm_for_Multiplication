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


module KA_117bit(
    a,
    b,
    y
    );

input [116:0] a;
input [116:0] b;

output [232:0] y;


wire [58:0] a_mod_1; //59
wire [58:0] b_mod_1; //59
wire [116:0] y_mod_1;  //117

wire [58:0] a_mod_2; //59
wire [58:0] b_mod_2; //59
wire [116:0] y_mod_2; //117

wire [58:0] a_mod_3; //59
wire [58:0] b_mod_3; //59
wire [116:0] y_mod_3; //117

wire [116:0] B1_out1, B1_out2, B1_out3;

wire [234:0] y_modify;

KA_59bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_59bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_59bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[58:0], b_mod_1 = b[58:0];

assign a_mod_2 = {1'b0, a[116:59]}, b_mod_2 = {1'b0, b[116:59]};

assign a_mod_3 = a[58:0]^{1'b0, a[116:59]}, b_mod_3 = b[58:0]^{1'b0, b[116:59]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_117bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[232:0];

endmodule
