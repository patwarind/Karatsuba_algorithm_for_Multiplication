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


module KA_82bit(
    a,
    b,
    y
    );

input [81:0] a;
input [81:0] b;

output [162:0] y;


wire [40:0] a_mod_1; //41
wire [40:0] b_mod_1; //41
wire [80:0] y_mod_1;  //81

wire [40:0] a_mod_2; //41
wire [40:0] b_mod_2; //41
wire [80:0] y_mod_2; //81

wire [40:0] a_mod_3; //41
wire [40:0] b_mod_3; //41
wire [80:0] y_mod_3; //81

wire [80:0] B1_out1, B1_out2, B1_out3;

wire [162:0] y_modify;

KA_41bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_41bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_41bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[40:0], b_mod_1 = b[40:0];

assign a_mod_2 = a[81:41], b_mod_2 = b[81:41];

assign a_mod_3 = a[40:0]^a[81:41], b_mod_3 = b[40:0]^b[81:41];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_82bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[162:0];

endmodule
