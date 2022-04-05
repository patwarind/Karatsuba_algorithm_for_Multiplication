`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:15:50
// Design Name: 
// Module Name: KA_24bit
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


module KA_24bit(
    a,
    b,
    y
    );

input [23:0] a;
input [23:0] b;

output [46:0] y;


wire [11:0] a_mod_1; //12
wire [11:0] b_mod_1; //12
wire [22:0] y_mod_1;  //23

wire [11:0] a_mod_2; //12
wire [11:0] b_mod_2; //12
wire [22:0] y_mod_2; //23

wire [11:0] a_mod_3; //12
wire [11:0] b_mod_3; //12
wire [22:0] y_mod_3; //23

wire [22:0] B1_out1, B1_out2, B1_out3;

wire [46:0] y_modify;

KA_12bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_12bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_12bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[11:0], b_mod_1 = b[11:0];

assign a_mod_2 = a[23:12], b_mod_2 = b[23:12];

assign a_mod_3 = a[23:0]^a[23:12], b_mod_3 = b[23:0]^b[23:12];



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_24bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[46:0];

endmodule
