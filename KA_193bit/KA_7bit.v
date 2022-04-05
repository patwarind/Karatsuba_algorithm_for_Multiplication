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


module KA_7bit(
    a,
    b,
    y
    );

input [6:0] a;
input [6:0] b;

output [12:0] y;


wire [3:0] a_mod_1; //4
wire [3:0] b_mod_1; //4
wire [6:0] y_mod_1;  //7

wire [3:0] a_mod_2; //4
wire [3:0] b_mod_2; //4
wire [6:0] y_mod_2; //7

wire [3:0] a_mod_3; //4
wire [3:0] b_mod_3; //4
wire [6:0] y_mod_3; //7

wire [6:0] B1_out1, B1_out2, B1_out3;

wire [14:0] y_modify;

KA_4bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_4bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_4bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[3:0], b_mod_1 = b[3:0];

assign a_mod_2 = {1'b0, a[6:4]}, b_mod_2 = {1'b0, b[6:4]};

assign a_mod_3 = a[3:0]^{1'b0, a[6:4]}, b_mod_3 = b[3:0]^{1'b0, b[6:4]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_7bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[12:0];

endmodule
