// magma -b n:=<N> k:=<K> p:=<P> bin/EtaCorresp.m

// 

// Preliminaries
load "lib/ReadTensorRank.m";
load "lib/TensorEigenvalues.m";
load "lib/FactorsForChi.m";

SetColumns(0);
SetAutoColumns(false);

n := StringToInteger(n);
k := StringToInteger(k);
p := StringToInteger(p);

GLn   := ReadGL(n,p);
GLk := ReadGL(k,p);

X := CharacterTable(GLn);
Y := CharacterTable(GLk);

TensorRank_n := ReadTensorRank(n,p);
TensorRank_k := ReadTensorRank(k,p);

CCn := GLn`Classes;
CCk := GLk`Classes;

ev_n := EigenvaluesForCCRep(CCn, n, p);
ev_k := EigenvaluesForCCRep(CCk, k, p);

// Compute determinants for tensor product;
NullCounts, Determins := TensorProductEV(ev_n, ev_k, GF(p));
chi_omega := Chi_omega(NullCounts, Determins, n,k,p);
chi_Eta := Chi_Eta( Y, chi_omega, #GLk, CCk);

Parent(chi_omega);
Type(chi_omega);
Parent(chi_Eta);
Type (chi_Eta);


eps := 10^-10;
for i in [1..#X] do
    for j in [1..NumberOfColumns(chi_Eta)] do
	chi_EtaColumn := [ chi_Eta[l][j] : l in [1..NumberOfRows(chi_Eta)]];
	c := chi_EtaColumn;
	x := [ComplexField()!X[i,l] : l in [1..#X]]; 
	ip := weightedInnerProduct(#GLn, CCn, x, chi_EtaColumn);
	//ip := weightedInnerProduct(#GLn, CCn, X[i], chi_EtaColumn);
	if Abs(ip) gt eps then
	    i , " and ", j, "are nonzero: tensor ranks", TensorRank_n[i], TensorRank_k[j];

	    if i eq 7 and j eq 1 then

		Parent([X[i,l] : l in [1..#X]]);
		Type([X[i,l] : l in [1..#X]]);
		Universe([X[i,l] : l in [1..#X]]); 

		"chi_EtaColumn", c;
		"X", [X[i,l]: l in [1..#X]];
	    end if;
	    if i eq 7 and j eq 2 then

		Parent([X[i,l] : l in [1..#X]]);
		Type([X[i,l] : l in [1..#X]]);
		Universe([X[i,l] : l in [1..#X]]); 


		"chi_EtaColumn", c;
		"X", [X[i,l]: l in [1..#X]];
	    end if;

	end if;
    end for;
end for;


/*

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

*/

quit;

/*

*/
        
