//Find all eigenvalues for the representative of each conjugacy class
//  Tricky part:  you need a field extension the contain all the ev's.
EigenvaluesForCCRep := function(CC,m,p)

    extDeg := 1;
    for i in [1..m] do
	extDeg := LCM(extDeg,i);
    end for;

    CCReps := [ CC[i][3]: i in [1..#CC]];
    CCReps_InExt := [ Matrix(ext<GF(p)| extDeg >, m,m,
			    [CCReps[i][j,k]:j,k in [1..m]])
		     : i in [1..#CC]
		   ];
    // This gives a tuple: <eigenvalue, multiplicity>
    EVs := [Eigenvalues(CCReps_InExt[i]) : i in [1..#CC]];

    // Now turn it into a flat list;
    EVs_flat := [];
    for i in [1..#CC] do
	ev_CC := EVs[i];
	evList_CC :=[];
	for ev in ev_CC do
	    multiplicity := ev[2];
	    value := ev[1];
	    for k in [1..multiplicity] do
		Append(~evList_CC, value);
	    end for; // multiplicity
	end for;  //for all eigenvalues for the ith conj class;
	Append(~EVs_flat,evList_CC); 
    end for;  //all evs

    return EVs_flat;
end function;

//
TensorProductEV := function(EVlist_n, EVlist_k, F)
    Determins := ZeroMatrix(F, #EVlist_n, #EVlist_k);
    NullCounts := ZeroMatrix(IntegerRing(),#EVlist_n, #EVlist_k);
    
    for i in [1..#EVlist_n] do
	// ith conj class in GLn
	evList_n := EVlist_n[i];
	for j in [1..#EVlist_k] do
	    // jth conj class in GLk
	    evList_k := EVlist_k[j];
	    product := 1;
	    nullCount := 0;
	    // loop through all pairs a_i, b_j and their inverses;
	    for ev_n in evList_n do
		for ev_k in evList_k do
		    val := ev_n*ev_k - 1;
		    val_inverse := 1/ev_n * 1/ev_k - 1;
		    if val eq 0 then
			nullCount +:= 1;
		    else
			product *:= val;
		    end if;

		    if val_inverse eq 0 then
			nullCount +:= 1;
		    else
			product *:= val_inverse;
		    end if;
		    
		end for; //ev_k
	    end for; // ev_n
	    NullCounts[i][j] := nullCount;
	    Determins[i][j] := product;
	end for; // j (EVlist_k)
	//Append(~NullCounts, nullCount);
	//Append(~Determins, product);
    end for; // i (EVlist_n)
    return NullCounts, Determins;
end function;
