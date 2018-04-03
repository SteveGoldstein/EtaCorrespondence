// magma -b n:=<N> p:=<P> bin/computeTensorRank.m

// 

// Preliminaries
SetColumns(0);
SetAutoColumns(false);

n := StringToInteger(n);
p := StringToInteger(p);

G := ReadGL(n,p);
X := CharacterTable(G);



//
permutRepCharacter := function (G,n,p,index)
    ;
    CC := ConjugacyClasses(G);
    ClassRep := CC[index][3];
    ClassRepMat := Matrix(GF(p), ClassRep);
    exponent := n - Rank(IdentityMatrix(GF(p),n) - ClassRepMat);
    return p^exponent-1;					

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

header := [* "TensorRank", "rho", "dim", "innerProduct" *];
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
		thisRow := [* power,rho,dim,ip *];
		Append(~nonZeroIP, thisRow);
		break;
            end if;  // if ip ne 0
	end for; // for oneD
    end for; // for rho
end for;  //for power

for nzIP in nonZeroIP do
    printf "%o\n", nzIP;
end for;

quit;

/*

*/
        
