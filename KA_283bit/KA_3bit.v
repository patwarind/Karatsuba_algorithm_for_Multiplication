`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 22:44:52
// Design Name: 
// Module Name: KA_3bit
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


module KA_3bit(
    a,
    b,
    y
    );

input [2:0] a;
input [2:0] b;

output [4:0] y;


wire [1:0] a_mod_1; //2
wire [1:0] b_mod_1; //2
wire [2:0] y_mod_1;  //3

wire [1:0] a_mod_2; //2
wire [1:0] b_mod_2; //2
wire [2:0] y_mod_2; //3

wire [1:0] a_mod_3; //2
wire [1:0] b_mod_3; //2
wire [2:0] y_mod_3; //3

wire [2:0] B1_out1, B1_out2, B1_out3;

wire [6:0] y_modify;

KA_2bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_2bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_2bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[1:0], b_mod_1 = b[1:0];

assign a_mod_2 = {1'b0,a[2:2]}, b_mod_2 = {1'b0,b[2:2]};

assign a_mod_3 = a[1:0]^{1'b0,a[2:2]}, b_mod_3 = b[1:0]^{1'b0,b[2:2]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_3bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[4:0];

endmodule
