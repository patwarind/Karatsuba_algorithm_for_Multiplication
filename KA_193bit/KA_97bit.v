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


module KA_97bit(
    a,
    b,
    y
    );

input [96:0] a;
input [96:0] b;

output [192:0] y;


wire [48:0] a_mod_1; //49
wire [48:0] b_mod_1; //49
wire [96:0] y_mod_1;  //97

wire [48:0] a_mod_2; //49
wire [48:0] b_mod_2; //49
wire [96:0] y_mod_2; //97

wire [48:0] a_mod_3; //49
wire [48:0] b_mod_3; //49
wire [96:0] y_mod_3; //97

wire [96:0] B1_out1, B1_out2, B1_out3;

wire [194:0] y_modify;

KA_49bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_49bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_49bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[48:0], b_mod_1 = b[48:0];

assign a_mod_2 = {1'b0, a[96:49]}, b_mod_2 = {1'b0, b[96:49]};

assign a_mod_3 = a[48:0]^{1'b0, a[96:49]}, b_mod_3 = b[48:0]^{1'b0, b[96:49]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_97bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[192:0];

endmodule
