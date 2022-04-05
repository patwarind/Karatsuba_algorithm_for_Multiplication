n = 410

file1 = open("KA_overlap_mod_stat.txt","w")



index_main = []

for i in range(0, 2*n-1):
    index_main.append(i)


index_submod_1 = []
for j in range(0, n-1):
    index_submod_1.append([j,j])


index_submod_2 = []
for l in range(int(n/2), int(3*n/2-1)):
    index_submod_2.append([l,int(l-n/2)])



index_submod_3 = []
for k in range(n, 2*n-1):
    index_submod_3.append([k,k-n])



file1.writelines("`timescale 1ns / 1ps \n\
//////////////////////////////////////////////////////////////////////////////////  \n\
// Company:    \n \
// Engineer:   \n \
//  \
// Create Date: 25.01.2022 23:34:48 \n\
// Design Name:     \n\
// Module Name: overlap_module \n \
// Project Name:    \n\
// Target Devices:  \n\
// Tool Versions:   \n\
// Description: \n\
//              \n\
// Dependencies:   \n \
//  \n\
// Revision:       \n \
// Revision 0.01 - File Created \n\
// Additional Comments: \n\
//  \n\
//////////////////////////////////////////////////////////////////////////////////  \n\
    \n\
    \n\
module overlap_module_"+str(n)+"bit(     \n\
    B2_in1,                \n\
    B2_in2,             \n\
    B2_in3,   \n\
    B2_out \n\
    );     \n\n\n\
parameter n = \
"+str(n)+";") 


file1.writelines("\n\
    \n\
input [n-2:0] B2_in1;   \n\
input [n-2:0] B2_in2;    \n\
input [n-2:0] B2_in3;    \n\
\n\
output [2*n-2:0] B2_out;  \n\
    \n\n\n\
")


for a in index_main:
    flag = 0

    file1.writelines("assign B2_out["+str(a)+"] = ")

    for p in range(0, len(index_submod_1)):
        if (a==index_submod_1[p][0]):
            file1.write("B2_in1["+str(index_submod_1[p][1])+"]")
            flag +=1

    for q in range(0, len(index_submod_2)):
        if (a==index_submod_2[q][0]):            
            if (flag==0):
                file1.write("B2_in2["+str(index_submod_2[q][1])+"]")
            else:
                file1.write("^ B2_in2["+str(index_submod_2[q][1])+"]")
            flag +=1

    for r in range(0, len(index_submod_3)):
        if (a==index_submod_3[r][0]):            
            if (flag==0):
                file1.write("B2_in3["+str(index_submod_3[r][1])+"]")
            else:
                file1.write("^B2_in3["+str(index_submod_3[r][1])+"]")
            flag +=1
        
    file1.write(";\n\n")

file1.write("endmodule")

file1.close()


