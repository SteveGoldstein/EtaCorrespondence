// magma -b n:=<N> p:=<P> file:=<XtableFile> bin/saveXTables.m

//Simple script to save the character tables of GLn;

load "../../lib/save_group.m";

SetColumns(0);
SetAutoColumns(false);

n := StringToInteger(n);
p := StringToInteger(p);


G := GL(n,p);
X := CharacterTable(G);

SaveGroup(G, file);

quit;

/*

## do the feasible XTables for p=3,5,7;
p=3; for n in {2..7}; do magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m >& xtab_gl$n-$p.err & done

p=5; for n in {2..5}; do magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m >& xtab_gl$n-$p.err & done

p=7; for n in {2..4}; do magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m >& xtab_gl$n-$p.err & done

## do the remaining feasible for n=2 and n=3
n=2; for p in 11 13 17 19 23 29 31 37 41; do magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m >& xtab_gl$n-$p.err & done

n=3; for p in 11 13 17 19; do magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m >& xtab_gl$n-$p.err & done





 n=3; for p in 17 19; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable.nohup/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.nohup.err & done
n=4; for p in 7; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable.nohup/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.nohup.err & done

n=3; for p in 23; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.err & done


n=3; for p in 23; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.err & done
n=4; for p in 11; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.err & done
n=6; for p in 5; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.err & done
n=7; for p in 5; do nohup magma -b n:=$n p:=$p file:=~/MAGMA/CharacterTable/xtab_gl$n-${p}_af.db bin/saveXTables.m &> xtab_gl$n-$p.err & done

*/
