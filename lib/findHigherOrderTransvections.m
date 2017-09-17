// return index of the "generalized" transvection in GL(n) 

findHigherOrderTransvections := function(G,n,p);
      CC := ConjugacyClasses(G);
      Z := IntegerRing();
      if IsOdd(n) then
	  bMinus := (n-1)/2;
	  bPlus  := (n+1)/2;
      else
	  bMinus := n/2;
	  bPlus  := n/2;
      end if;
      
      // First build the matrices of interest;
      // For convenience, start with the identity;  we'll remove it at the end;
      IdMat := IdentityMatrix(GF(p),n);
      matOfInterest := [IdMat];

      ZeroMat := ZeroMatrix(GF(p), n, n);
      for i in [1..Z!bMinus] do
	  u := ZeroMat;
	  u[i][i+Z!bMinus] := 1;
	  Append(~matOfInterest, matOfInterest[#matOfInterest] +u);
      end for;

      if IsOdd(n) then
	  matPlus := [IdMat];
	  for i in [1..Z!bMinus] do
	      u := ZeroMat;
	      u[i][i+Z!bPlus] := 1;
	      Append(~matPlus, matPlus[#matPlus] +u);
	  end for;
	  Remove(~matPlus,1);
	  matOfInterest cat:= matPlus;
      end if;
      
      Remove(~matOfInterest, 1);
      matOfInterest;
      "";
      
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
