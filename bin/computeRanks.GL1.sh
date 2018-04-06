#!/bin/bash

nohup magma -b n:=1 p:=11 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-11.ranks.mgm &
nohup magma -b n:=1 p:=13 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-13.ranks.mgm &
nohup magma -b n:=1 p:=17 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-17.ranks.mgm &
nohup magma -b n:=1 p:=19 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-19.ranks.mgm &
nohup magma -b n:=1 p:=23 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-23.ranks.mgm &
nohup magma -b n:=1 p:=29 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-29.ranks.mgm &
nohup magma -b n:=1 p:=31 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-31.ranks.mgm &
nohup magma -b n:=1 p:=37 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-37.ranks.mgm &
nohup magma -b n:=1 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-3.ranks.mgm &
nohup magma -b n:=1 p:=41 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-41.ranks.mgm &
nohup magma -b n:=1 p:=5 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-5.ranks.mgm &
nohup magma -b n:=1 p:=7 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL1-7.ranks.mgm &
