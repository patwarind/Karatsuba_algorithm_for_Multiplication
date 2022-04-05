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

module KA_93bit(
    clk
    );

input clk;
wire [92:0] a;
wire [92:0] b;

wire [184:0] y;


wire [46:0] a_mod_1; //47
wire [46:0] b_mod_1; //47
wire [92:0] y_mod_1;  //93

wire [46:0] a_mod_2; //47
wire [46:0] b_mod_2; //47
wire [92:0] y_mod_2; //93

wire [46:0] a_mod_3; //47
wire [46:0] b_mod_3; //47
wire [92:0] y_mod_3; //95

wire [92:0] B1_out1, B1_out2, B1_out3;

wire [186:0] y_modify;



//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
vio_0 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_in0(y),    // input wire [184 : 0] probe_in0
  .probe_out0(a),  // output wire [92 : 0] probe_out0
  .probe_out1(b)  // output wire [92 : 0] probe_out1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------


KA_47bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));
KA_47bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));
KA_47bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));

assign a_mod_1 = a[46:0], b_mod_1 = b[46:0];

assign a_mod_2 = {1'b0,a[92:47]}, b_mod_2 = {1'b0,b[92:47]};

assign a_mod_3 = a[46:0]^{1'b0,a[92:47]}, b_mod_3 = b[46:0]^{1'b0,b[92:47]};



assign B1_out1 = y_mod_1;

assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;

assign B1_out3 = y_mod_2;


overlap_module_93bit ov_mod (
        .B2_in1(B1_out1),
        .B2_in2(B1_out2),
        .B2_in3(B1_out3),
        .B2_out(y_modify)
        );

assign y = y_modify[184:0];

endmodule