// return index of the transvection in GL(n) 

findTransvection := function(G,n,p);
      CC := ConjugacyClasses(G);
      
      IdMat := Matrix(GF(p),Identity(G));
      for i in [1..#CC] do;
          CCrep := CC[i][3];
	  repMat := Matrix(GF(p), CCrep);
	  rk := Rank(IdMat-repMat);

	  if rk eq 1 then
	      ev := Eigenvalues(repMat);
	      if ev eq { <1,n> } then
		  return i;
	      end if;
	  end if;
      end for;

end function;
