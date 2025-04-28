module logic_gates (
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    output Z
);

wire H,I,J,K,L,M,N;

or  (H,A,B);   //A|B
and (I,C,D);   //C&D
not (J,E);     //~E
or  (K,J,F);   //~E|F
not (L,H);     //~(a|B)
and (M,L,I);   //~(A|B)&(C&D)
and (N,G,K);   //(~E|F)&G)
or  (Z,M,N);   //(~(A|B)&(C&D))|((~E|F)&G)

//assign Z = (~(A|B)&(C&D))|((~E|F)&G);
endmodule