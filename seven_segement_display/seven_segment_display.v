module seven_segment_display (
    input  [3:0] num,    //[d,c,b,a]
    output [6:0] dis //[g,f,e,d,c,b,a]
);
    wire na,nb,nc,nd;

    not(na,num[0]);//~a
    not(nb,num[1]);//~b
    not(nc,num[2]);//~c
    not(nd,num[3]);//~d

    wire a,b,c,d;
    or(a,num[0],0);
    or(b,num[1],0);
    or(c,num[2],0);
    or(d,num[3],0);

    //a
    wire a1, a4, a6, aB, aD;
    and(a1,  a, nb, nc, nd);
    and(a4, na, nb,  c, nd);
    and(a6, na,  b,  c, nd);
    and(aB,  a,  b, nc,  d);
    and(aD,  a, nb,  c,  d);

    or(dis[0],a1, a4, a6, aB, aD);


    //b
    wire b5,b6,bB,bC,bE,bF;
    and(b5,  a, nb,  c, nd);
    and(b6, na,  b,  c, nd);
    and(bB,  a,  b, nc,  d);
    and(bC, na, nb,  c,  d);
    and(bE, na,  b,  c,  d);
    and(bF,  a,  b,  c,  d);

    or(dis[1],b5,b6,bB,bC,bE,bF);                              


    //c
    wire c2,cC,cE,cF;
    and(c2, na,  b, nc, nd);
    and(cC, na, nb,  c,  d);
    and(cE, na,  b,  c,  d);
    and(cF,  a,  b,  c,  d);

    or(dis[2],c2,cC,cE,cF); 
    

    //d
    wire d1,d4,d7,d9,dA,dF;
    and(d1,  a, nb, nc, nd);
    and(d4, na, nb,  c, nd);
    and(d7,  a,  b,  c, nd);
    and(d9,  a, nb, nc,  d);
    and(dA, na,  b, nc,  d);
    and(dF,  a,  b,  c,  d);

    or(dis[3],d1,d4,d7,d9,dA,dF);


    //e
    wire e1,e3,e4,e5,e7,e9;
    and(e1,  a, nb, nc, nd);
    and(e3,  a,  b, nc, nd);
    and(e4, na, nb,  c, nd);
    and(e5,  a, nb,  c, nd);
    and(e7,  a,  b,  c, nd);
    and(e9,  a, nb, nc,  d);

    or(dis[4],e1,e3,e4,e5,e7,e9);


    //f
    wire f1,f2,f3,f7,fD;   
    and(f1,  a, nb, nc, nd);
    and(f2, na,  b, nc, nd);
    and(f3,  a,  b, nc, nd);
    and(f7,  a,  b,  c, nd);
    and(fD,  a, nb,  c,  d);

    or(dis[5],f1,f2,f3,f7,fD);
    

    //g
    wire g0,g1,g7,gC;
    and(g0, na, nb, nc, nd);
    and(g1,  a, nb, nc, nd);
    and(g7,  a,  b,  c, nd);
    and(gC, na, nb,  c,  d);

    or(dis[6],g0,g1,g7,gC);

endmodule