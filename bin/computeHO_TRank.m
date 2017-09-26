// magma -b n:=<N> p:=<P> bin/computeTRank.m

// 

// Preliminaries
//load "lib/findTransvection.m";
load "lib/findHigherOrderTransvections.m";
SetColumns(0);
SetAutoColumns(false);

n := StringToInteger(n);
p := StringToInteger(p);

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

CC := ConjugacyClasses(G);
chiPi := [ permutRepCharacter(G,n,p,i) : i in [1..#CC]];
oneDimReps := [];
for i in [1..#X] do
    if X[i][1] eq 1 then
	Append(~oneDimReps, X[i]);
    else
	break;
    end if;
end for;

C<i> := ComplexField(3);
seenIt := {};
nonZeroIP  := [];

header := [* "power", "rho", "dim", "innerProduct" *];
for t in higherOrderTransvectionIndices do
    mat := Matrix(GF(p), CC[t][3]);
    rk := Rank(IdentityMatrix(GF(p),n)-mat);
    Append(~header, Sprintf("CharRatioForRank:%o",rk));
end for;
header;

    
for power in [0..n] do
    
    chiPiPower := [chiPi[i]^power : i in [1..#chiPi]];
    chiPiPowerTimes1D := [* *];
    for oneD in [1..#oneDimReps] do
	vec := [chiPiPower[j]*oneDimReps[oneD][j] : j in [1..#CC]];
	Append(~chiPiPowerTimes1D, vec);
    end for;
    
    for rho in [1..#X] do
        if rho in seenIt then
	    continue;
        end if;
	for oneD in [1..#oneDimReps] do
            ip := weightedInnerProduct(G,chiPiPowerTimes1D[oneD],X[rho]);
            if ip ne 0 then
		Include(~seenIt, rho);
		
		dim := X[rho][1];
		charRatios := [C!X[rho][i]/dim : i in higherOrderTransvectionIndices];
		absCharRatios := [* Abs(x) : x in charRatios *];
		thisRow := [* power, rho,dim, ip *];
		thisRow := thisRow cat absCharRatios;
		Append(~nonZeroIP, thisRow);
  
            end if;  // if ip ne 0
	end for; // for oneD
    end for; // for rho
end for;  //for power

for nzIP in nonZeroIP do
    printf "%o\n", nzIP;
end for;

quit;

/*

for n in 4 6 8; do for p in 3 5; do magmanew -b n:=$n p:=$p bin/omegaXomega.m | perl -nale ' next if /Loading/; if ($.==2) {s/^\[\s+//} if (eof) {s/\]\s*$//}; s/\[\s*\*\s*//; s/\*\],?\s*/\n/; s/\s*$//; $text .= $_; END{print join ",", "rank", "index", "dim", "inner prod", "charRatio","Abs(charRatio)", "multiplicities"; print $text}'|perl -F, -nale 'print join("\t", @F[0..3,5]), "\t", join(",", @F[6..$#F]), "\t$F[4]";' > Tables/v3/Sp${n}_$p.withAbsCharRatio.txt& done; done                            

*/
        
