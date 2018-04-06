//  FactorsForChi
//   compute various values needed for evaluating characters




// Determine G (actually G^2)
// G = sqrt(p) if G congruent 1 mod 4;
// G = i* sqrt(p) if G congruent 3 mod 4;
G_squared := function(p)
    if p mod 4 eq 1 then
	G_squared := p;
    else
	G_squared := -p;
    end if;
    return G_squared;
end function;

// Construct the set of squares mod p
SquaresMod_p := function(p)
    squares := {i*i mod p : i in [0..p-1]};
    return squares;
end function;


LegendreSymbol := function(detQ,p)
    if detQ in SquaresMod_p(p) then
	return 1;
    else
	return -1;
    end if;
end function;

//NullCounts, Determins := TensorProductEV(ev_n, ev_k, GF(p));
Chi_omega := function(NullCounts, Determins, n,k,p)
    r := NumberOfRows(NullCounts);
    c := NumberOfColumns(NullCounts);
    chi_omega := ZeroMatrix(IntegerRing(), r, c);
    
    G_sq := G_squared(p);    
    for i in [1..r] do
	for j in [1..c] do
	    nullRank := NullCounts[i][j];
	    detQ := Determins[i][j];
	    legSym := LegendreSymbol(detQ,p);

	    chi_omega[i][j] := p^nullRank * G_sq^((2*n*k - nullRank)/2) * legSym/p^(n*k);
	    
	end for; // for j=1..c
    end for; //for i=1..r
    return chi_omega;
end function;

// Compute inner product of rows of the character table, weighted
//    by the number of elements in the conjugacy classes;
//    or more generally --
weightedInnerProduct := function (orderG,CC,x,y);
   //CC := ConjugacyClasses(G);
   sum := &+ [ x[i] * ComplexConjugate(y[i])*CC[i][2] : i in [1..#CC]];
   return sum/orderG;
end function;


// Chi_Eta(nu)(g) = innerproduct(chi_nu dot chi_omega(g, dot);
// todo:   figure out how to do this calculation in a smaller field
//   extension that contains weighted inner product (i.e. the char tables)
//
//  how?  try putting the values into a struct [* *] and then
//  coercising at the end?
//  or maybe it doesn't need coercing.
Chi_Eta := function( Xtab_H, chi_omega, order_H, CC_H)
    r := NumberOfRows(chi_omega);
    c := #Xtab_H;  

    Chi_Eta := ZeroMatrix(ComplexField(), r,c);
    for i in [1..r] do
	for j in [1..c] do
	    Chi_Eta[i][j] := weightedInnerProduct(order_H, CC_H, chi_omega[i], Xtab_H[j]);
	end for;  
    end for;

    return Chi_Eta;
end function;


