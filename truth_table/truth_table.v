module truth_table (
    input A,
    input B,
    input C,
    output X,
    output Y);

    wire w1,w2,w3,w4,w5,w6;
//X
//(~A & (B | ~C)) | (B & ~C)
not (w1,A);
not (w2,C);
or  (w3,B,w2);
and (w4,w1,w3);
and (w5,B,w2);
or  (X,w4,w5);

//Y
//(A ^ B ^ C)
xor (Y,A,B,C);


endmodule