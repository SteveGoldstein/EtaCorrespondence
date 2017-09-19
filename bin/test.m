n := StringToInteger(n);
p := StringToInteger(p);

load "lib/findHigherOrderTransvections.m";
G := GL(n,p);
CC := ConjugacyClasses(G);
T := findHigherOrderTransvections(G,n,p);

for t in T do
    mat := Matrix(GF(p), CC[t][3]);
    rk := Rank(IdentityMatrix(GF(p),n)-mat);
    t, rk;
end for;

quit;
