`include "FA.v"

module adder4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] sum_e3,
    output       overflow
);

wire [3:0] carry_wire;
wire [3:0] carry_wire_e3;
wire [3:0] sum;

FA FA1(.A(A[0]), .B(B[0]), .Cin(1'b0), .sum(sum[0]), .cout(carry_wire[0]));
FA FA2(.A(A[1]), .B(B[1]), .Cin(carry_wire[0]), .sum(sum[1]), .cout(carry_wire[1]));
FA FA3(.A(A[2]), .B(B[2]), .Cin(carry_wire[1]), .sum(sum[2]), .cout(carry_wire[2]));
FA FA4(.A(A[3]), .B(B[3]), .Cin(carry_wire[2]), .sum(sum[3]), .cout(carry_wire[3]));

FA FA5(.A(sum[0]), .B(1'b1), .Cin(1'b0), .sum(sum_e3[0]), .cout(carry_wire_e3[0]));
FA FA6(.A(sum[1]), .B(1'b1), .Cin(carry_wire_e3[0]), .sum(sum_e3[1]), .cout(carry_wire_e3[1]));
FA FA7(.A(sum[2]), .B(1'b0), .Cin(carry_wire_e3[1]), .sum(sum_e3[2]), .cout(carry_wire_e3[2]));
FA FA8(.A(sum[3]), .B(1'b0), .Cin(carry_wire_e3[2]), .sum(sum_e3[3]), .cout(carry_wire_e3[3]));

wire w1, w2, w3, w4, w5;

not(w1, sum_e3[3]);
not(w2, sum[3]);
not(w3, 1'b0);

and(w4, sum[3], 1'b0,w1);
and(w5, w3, sum_e3[3]);
or(overflow, w4, w5);



endmodule