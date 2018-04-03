#!/bin/bash

nohup magma -b n:=2 p:=11 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-11.mgm &
nohup magma -b n:=2 p:=13 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-13.mgm &
nohup magma -b n:=2 p:=17 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-17.mgm &
nohup magma -b n:=2 p:=19 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-19.mgm &
nohup magma -b n:=2 p:=23 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-23.mgm &
nohup magma -b n:=2 p:=29 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-29.mgm &
nohup magma -b n:=2 p:=31 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-31.mgm &
nohup magma -b n:=2 p:=37 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-37.mgm &
nohup magma -b n:=2 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-3.mgm &
nohup magma -b n:=2 p:=41 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-41.mgm &
nohup magma -b n:=2 p:=5 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-5.mgm &
nohup magma -b n:=2 p:=7 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL2-7.mgm &
nohup magma -b n:=3 p:=11 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-11.mgm &
nohup magma -b n:=3 p:=13 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-13.mgm &
nohup magma -b n:=3 p:=17 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-17.mgm &
nohup magma -b n:=3 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-3.mgm &
nohup magma -b n:=3 p:=5 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-5.mgm &
nohup magma -b n:=3 p:=7 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL3-7.mgm &
nohup magma -b n:=4 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL4-3.mgm &
nohup magma -b n:=4 p:=5 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL4-5.mgm &
nohup magma -b n:=4 p:=7 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL4-7.mgm &
nohup magma -b n:=5 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL5-3.mgm &
nohup magma -b n:=5 p:=5 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL5-5.mgm &
nohup magma -b n:=6 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL6-3.mgm &
nohup magma -b n:=7 p:=3 bin/computeTensorRank.m | grep -v ^Loading > Ranks/GL7-3.mgm &
