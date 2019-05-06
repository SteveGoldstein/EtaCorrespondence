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
C<i> := ComplexField(5);

printf "rho,TensorRank";
for j in [1..#X] do
    printf ",ConjClass%o", j;
end for;
printf "\n";

for i in [1..#X] do
    rnk := TensorRank_n[i];

    charRatios := [C!X[i,j]/X[i,1] : j in [1..#X]];
    printf "%o,%o", i, rnk;
    for j in [1..#X] do
	printf ",%o", Abs(charRatios[j]);
    end for;
    printf "\n";
    //printf "%o, %o, %o\n",i, rnk, [Abs(charRatios[j]): j in [1..#X]] ;
    
end for;
quit;

