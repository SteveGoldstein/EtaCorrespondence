//

Rank_Dir := "/staff/sgoldstein/MAGMA/GLn/Ranks";
MAGMANEW := true;

ReadTensorRank := function(n,q)
      ranksFile := Sprintf("%o/GL%o-%o.ranks.mgm",Rank_Dir,  n, q);
      return eval Read(ranksFile);
end function;

