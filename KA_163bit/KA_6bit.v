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


module KA_6bit(
    a,
    b,
    y
    );

input [5:0] a;
input [5:0] b;

output [10:0] y;


wire [2:0] a_mod_1; //3
wire [2:0] b_mod_1; //3
wire [4:0] y_mod_1;  //5

wire [2:0] a_mod_2; //3
wire [2:0] b_mod_2; //3
wire [4:0] y_mod_2; //5

wire [2:0] a_mod_3; //3
wire [2:0] b_mod_3; //3
wire [4:0] y_mod_3; //5

wire [4:0] B1_out1, B1_out2, B1_out3;

wire [10:0] y_modify;

KA_3bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_3bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_3bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[2:0], b_mod_1 = b[2:0];

assign a_mod_2 = a[5:3], b_mod_2 = b[5:3];

assign a_mod_3 = a[2:0]^a[5:3], b_mod_3 = b[2:0]^b[5:3];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_6bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[10:0];

endmodule
