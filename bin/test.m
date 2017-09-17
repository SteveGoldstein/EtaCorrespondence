n := StringToInteger(n);
p := StringToInteger(p);

load "lib/findHigherOrderTransvections.m";
findHigherOrderTransvections(GL(n,p),n,p);

quit;