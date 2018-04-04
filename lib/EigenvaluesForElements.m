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

