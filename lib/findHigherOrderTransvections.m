// return index of the "generalized" transvection in GL(n) 

findHigherOrderTransvections := function(G,n,p);
      CC := ConjugacyClasses(G);

      // First build the matrices of interest;
      // For convenience, start with the identity;  we'll remove it at the end;
      IdMat := IdentityMatrix(GF(p),n);
      matOfInterest := [IdMat];

      ZeroMat := ZeroMatrix(GF(p), n, n);
      for i in [1..n-1] do
	  u := ZeroMat;
	  u[i][i+1] := 1;
	  Append(~matOfInterest, matOfInterest[#matOfInterest] +u);
      end for;

      Remove(~matOfInterest, 1);

      eltOfInterest := [G!M : M in matOfInterest];
      
      // now find the conjugacy classes for each of the matrices;
      ccIndexOfInterest := [];
      for i in [1..#CC] do
	  ev := Eigenvalues(CC[i][3]);
	  if ev ne {<1,n>} then
	      // The only candidates have n eigenvalues with value 1;
	      continue;
	  end if;
	  
	  for j in [1..#eltOfInterest] do

	      if IsConjugate(G, eltOfInterest[j], CC[i][3]) then
		  Append(~ccIndexOfInterest, i);
		  //eltOfInterest[j], CC[i][3],i;
		  Remove(~eltOfInterest, j);
		  break;
	      end if;
	  end for;  // for j in ..
      end for; // for i in ..
      return ccIndexOfInterest;
end function;
