#!/bin/bash

nohup magma -b n:=2 p:=11 bin/computeTensorRank.m |bin/parse.pl -q 11 > Ranks/GL2-11.ranks &
nohup magma -b n:=2 p:=13 bin/computeTensorRank.m |bin/parse.pl -q 13 > Ranks/GL2-13.ranks &
nohup magma -b n:=2 p:=17 bin/computeTensorRank.m |bin/parse.pl -q 17 > Ranks/GL2-17.ranks &
nohup magma -b n:=2 p:=19 bin/computeTensorRank.m |bin/parse.pl -q 19 > Ranks/GL2-19.ranks &
nohup magma -b n:=2 p:=23 bin/computeTensorRank.m |bin/parse.pl -q 23 > Ranks/GL2-23.ranks &
nohup magma -b n:=2 p:=29 bin/computeTensorRank.m |bin/parse.pl -q 29 > Ranks/GL2-29.ranks &
nohup magma -b n:=2 p:=31 bin/computeTensorRank.m |bin/parse.pl -q 31 > Ranks/GL2-31.ranks &
nohup magma -b n:=2 p:=37 bin/computeTensorRank.m |bin/parse.pl -q 37 > Ranks/GL2-37.ranks &
nohup magma -b n:=2 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL2-3.ranks &
nohup magma -b n:=2 p:=41 bin/computeTensorRank.m |bin/parse.pl -q 41 > Ranks/GL2-41.ranks &
nohup magma -b n:=2 p:=5 bin/computeTensorRank.m |bin/parse.pl -q 5 > Ranks/GL2-5.ranks &
nohup magma -b n:=2 p:=7 bin/computeTensorRank.m |bin/parse.pl -q 7 > Ranks/GL2-7.ranks &
nohup magma -b n:=3 p:=11 bin/computeTensorRank.m |bin/parse.pl -q 11 > Ranks/GL3-11.ranks &
nohup magma -b n:=3 p:=13 bin/computeTensorRank.m |bin/parse.pl -q 13 > Ranks/GL3-13.ranks &
nohup magma -b n:=3 p:=17 bin/computeTensorRank.m |bin/parse.pl -q 17 > Ranks/GL3-17.ranks &
nohup magma -b n:=3 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL3-3.ranks &
nohup magma -b n:=3 p:=5 bin/computeTensorRank.m |bin/parse.pl -q 5 > Ranks/GL3-5.ranks &
nohup magma -b n:=3 p:=7 bin/computeTensorRank.m |bin/parse.pl -q 7 > Ranks/GL3-7.ranks &
nohup magma -b n:=4 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL4-3.ranks &
nohup magma -b n:=4 p:=5 bin/computeTensorRank.m |bin/parse.pl -q 5 > Ranks/GL4-5.ranks &
nohup magma -b n:=4 p:=7 bin/computeTensorRank.m |bin/parse.pl -q 7 > Ranks/GL4-7.ranks &
nohup magma -b n:=5 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL5-3.ranks &
nohup magma -b n:=5 p:=5 bin/computeTensorRank.m |bin/parse.pl -q 5 > Ranks/GL5-5.ranks &
nohup magma -b n:=6 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL6-3.ranks &
nohup magma -b n:=7 p:=3 bin/computeTensorRank.m |bin/parse.pl -q 3 > Ranks/GL7-3.ranks &
