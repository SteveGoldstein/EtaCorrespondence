// magma -b n:=<N> p:=<P> bin/computeTRank.m

// 

// Preliminaries
//load "lib/findTransvection.m";
load "lib/findHigherOrderTransvections.m";

n := 2;
p := 5;

G := GL(n,p);
X := CharacterTable(G);

//transvectionIndex := findTransvection(G, n, p);
higherOrderTransvectionIndices := findHigherOrderTransvections(G, n, p);

//
permutRepCharacter := function (G,n,p,index)
    ;
    CC := ConjugacyClasses(G);
    ClassRep := CC[index][3];
    ClassRepMat := Matrix(GF(p), ClassRep);
    exponent := n - Rank(IdentityMatrix(GF(p),n) - ClassRepMat);
    return p^exponent;					

end function;


// Compute inner product of rows of the character table, weighted
//    by the number of elements in the conjugacy classes;
//    or more generally --
weightedInnerProduct := function (G,x,y);
   CC := ConjugacyClasses(G);
   sum := &+ [ x[i] * ComplexConjugate(y[i])*CC[i][2] : i in [1..#CC]];
   return sum/#G;
end function;


SetColumns(0);
SetAutoColumns(false);

//sumOfRank1 := &+[X[i] : i in [2..5] ];
chiPi := [ permutRepCharacter(G,n,p,i) : i in [1..#X]];

seenIt := {};
nonZeroIP  := [];
    
C<i> := ComplexField(3);
for transvectionIndex in higherOrderTransvectionIndices do
    seenIt := {};
    nonZeroIP  := [];

    for power in [0..n] do

	for rho in [1..#X] do
            if rho in seenIt then
		continue;
            end if;
	chiPiPower := [chiPi[i]^power : i in [1..#chiPi]];
        ip := weightedInnerProduct(G,chiPiPower,X[rho]);
        if ip ne 0 then;
            Include(~seenIt, rho);
	    
            dim := X[rho][1];
            charValue := X[rho][transvectionIndex];
            charRatio := charValue/dim;
            Append(~nonZeroIP,
                   [* power,rho,dim,ip,C!charRatio,Abs(C!charRatio) *]

                  );
        end if;
	end for;
    end for;

    printf "%o\n", nonZeroIP;
end for;

quit;

/*

for n in 4 6 8; do for p in 3 5; do magmanew -b n:=$n p:=$p bin/omegaXomega.m | perl -nale ' next if /Loading/; if ($.==2) {s/^\[\s+//} if (eof) {s/\]\s*$//}; s/\[\s*\*\s*//; s/\*\],?\s*/\n/; s/\s*$//; $text .= $_; END{print join ",", "rank", "index", "dim", "inner prod", "charRatio","Abs(charRatio)", "multiplicities"; print $text}'|perl -F, -nale 'print join("\t", @F[0..3,5]), "\t", join(",", @F[6..$#F]), "\t$F[4]";' > Tables/v3/Sp${n}_$p.withAbsCharRatio.txt& done; done                            

*/
        
