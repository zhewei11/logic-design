module FA(
    input  A,
    input  B,
    input  Cin,
    output sum,
    output cout
);

//sum  = A ^ B ^ Cin
//cout = (A & B) | (B & Cin) | (A & Cin)

wire w1,w2,w3;

xor (sum,A,B,Cin);

and (w1,A,B);
and (w2,B,Cin);
and (w3,A,Cin);
or  (cout,w1,w2,w3);
    
endmodule