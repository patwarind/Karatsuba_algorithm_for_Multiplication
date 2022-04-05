n = 64

file1 = open("KA_topmodule_stat_gen.txt","w")


file1.write("`timescale 1ns / 1ps \n\
//////////////////////////////////////////////////////////////////////////////////\n\
// Company: \n\
// Engineer: \n\
// \n\
// Create Date: 25.01.2022 19:05:02\n\
// Design Name: \n\
// Module Name: KA_"+str(n)+"bit\n\
// Project Name: \n\
// Target Devices:\n\
// Tool Versions: \n\
// Description: \n\
// \n\
// Dependencies: \n\
// \n\
// Revision:\n\
// Revision 0.01 - File Created\n\
// Additional Comments:\n\
// \n\
//////////////////////////////////////////////////////////////////////////////////\n\
\n\
\n\
module KA_"+str(n)+"bit(\n\
    a,\n\
    b,\n\
    y\n\
    );\n\
\n\
parameter n = "+str(n)+";\n\
input [n-1:0] a;\n\
input [n-1:0] b;\n\n\
output [2*n-2:0] y;\n\n\n\
\
\
\
wire [(n/2)-1:0] a_mod_1;\n\
wire [(n/2)-1:0] b_mod_1;\n\
wire [n-2:0] y_mod_1;\n\n\
\
\
wire [(n/2)-1:0] a_mod_2;\n\
wire [(n/2)-1:0] b_mod_2;\n\
wire [n-2:0] y_mod_2;\n\n\
\
\
wire [(n/2)-1:0] a_mod_3;\n\
wire [(n/2)-1:0] b_mod_3;\n\
wire [n-2:0] y_mod_3;\n\n\
\
\
wire [n-2:0] B1_out1, B1_out2, B1_out3;\n\n\n\
\
KA_"+str(int(n/2))+"bit bit_mod_1 (.y(y_mod_1), .a(a_mod_1), .b(b_mod_1));\n\
KA_"+str(int(n/2))+"bit bit_mod_2 (.y(y_mod_2), .a(a_mod_2), .b(b_mod_2));\n\
KA_"+str(int(n/2))+"bit bit_mod_3 (.y(y_mod_3), .a(a_mod_3), .b(b_mod_3));\n\n\
\
assign a_mod_1 = a["+str(int(n/2)-1)+":0], b_mod_1 = b["+str(int(n/2)-1)+":0];\n\n\
\
assign a_mod_2 = a["+str(n-1)+":"+str(int(n/2))+"], b_mod_2 = b["+str(n-1)+":"+str(int(n/2))+"];\n\n\
\
assign a_mod_3 = a["+str(int(n/2)-1)+":0]^a["+str(n-1)+":"+str(int(n/2))+"], b_mod_3 = b["+str(int(n/2)-1)+":0]^b["+str(n-1)+":"+str(int(n/2))+"];\n\
\n\
\n\
\n\
assign B1_out1 = y_mod_1;\n\
\n\
assign B1_out2 = y_mod_1 ^ y_mod_2 ^ y_mod_3 ;\n\
\n\
assign B1_out3 = y_mod_2;\n\
\n\
\n\
overlap_module_"+str(n)+"bit ov_mod (\n\
        .B2_in1(B1_out1),\n\
        .B2_in2(B1_out2),\n\
        .B2_in3(B1_out3),\n\
        .B2_out(y)\n\
        );\n\
\n\
\n\
endmodule\
")

file1.close()



