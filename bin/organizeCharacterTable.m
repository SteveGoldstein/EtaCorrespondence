// magma -b n:=<N>  p:=<P> bin/organizeCharacterTable.m

// Preliminaries
load "lib/ReadTensorRank.m";

SetColumns(0);
SetAutoColumns(false);

n := StringToInteger(n);
p := StringToInteger(p);

GLn   := ReadGL(n,p);

X := CharacterTable(GLn);
TensorRank_n := ReadTensorRank(n,p);
C<i> := ComplexField(3);

for i in [1..#X] do
    rnk := TensorRank_n[i];

    charRatios := [C!X[i,j]/X[i,1] : j in [1..#X]];
    printf "%o, %o, %o\n",i, rnk, [charRatios[j]: j in [1..#X]] ;
    
end for;
quit;

