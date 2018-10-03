// magma -b n:=<N> k:=<K> p:=<P> bin/EtaCorresp.m

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
if n eq k then
    GLk := GLn;
else
    GLk := ReadGL(k,p);
end if;

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
//chi_omega := Chi_omega_First(NullCounts, Determins, n,k,p);
chi_omega := Chi_omega(CCn, CCk, n,k,p);
chi_Eta := Chi_Eta( Y, chi_omega, #GLk, CCk);
// "\n", Transpose(chi_Eta), "\n";

// header
"";
"rho", "chi", "rnk(rho)","rnk(chi)";

for i in [1..#X] do
    for j in [1..NumberOfColumns(chi_Eta)] do
	chi_EtaColumn := [ chi_Eta[l][j] : l in [1..NumberOfRows(chi_Eta)]];
	xTabRow := [X[i,l] : l in [1..#X]]; 
	ip := weightedInnerProduct(#GLn, CCn, xTabRow, chi_EtaColumn);
	//ip := weightedInnerProduct(#GLn, CCn, chi_EtaColumn, xTabRow);
	if ip ne 0 then
	    i,j,"\t",TensorRank_n[i], TensorRank_k[j];
	end if;
    end for;
end for;
"";


quit;
        
/*

to do:
1.  use SetOutputFile and file:=...
2.  write k in output
3.  iterate over k;

*/
