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


module KA_163bit(
    a,
    b,
    y
    );

input [162:0] a;
input [162:0] b;

output [324:0] y;


wire [81:0] a_mod_1; //81
wire [81:0] b_mod_1; //81
wire [162:0] y_mod_1;  //162

wire [81:0] a_mod_2; //81
wire [81:0] b_mod_2; //81
wire [162:0] y_mod_2; //162

wire [81:0] a_mod_3; //81
wire [81:0] b_mod_3; //81
wire [162:0] y_mod_3; //162

wire [162:0] B1_out1, B1_out2, B1_out3;

wire [326:0] y_modify;

KA_82bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_82bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_82bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));


assign a_mod_1 = a[81:0], b_mod_1 = b[81:0];

assign a_mod_2 = {1'b0, a[162:82]}, b_mod_2 = {1'b0, b[162:82]};

assign a_mod_3 = a[81:0]^{1'b0, a[162:82]}, b_mod_3 = b[81:0]^{1'b0, b[162:82]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_163bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[324:0];

endmodule
