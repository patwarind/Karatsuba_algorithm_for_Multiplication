`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2022 18:15:59
// Design Name: 
// Module Name: KA_93bit
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

module KA_283bit(
    a,
    b,
    y
    );

input [282:0] a;
input [282:0] b;

input [564:0] y;


wire [141:0] a_mod_1; //142
wire [141:0] b_mod_1; //142
wire [282:0] y_mod_1;  //283

wire [141:0] a_mod_2; //142
wire [141:0] b_mod_2; //142
wire [282:0] y_mod_2; //283

wire [141:0] a_mod_3; //142
wire [141:0] b_mod_3; //142
wire [282:0] y_mod_3; //283

wire [282:0] B1_out1, B1_out2, B1_out3;

wire [566:0] y_modify;


KA_142bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_142bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_142bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[141:0], b_mod_1 = b[141:0];

assign a_mod_2 = {1'b0, a[282:142]}, b_mod_2 = {1'b0, b[282:142]};

assign a_mod_3 = a[141:0]^{1'b0, a[282:142]}, b_mod_3 = b[141:0]^{1'b0, b[282:142]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_283bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[564:0];

endmodule