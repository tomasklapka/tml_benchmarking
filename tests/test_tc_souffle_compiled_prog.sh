#!/bin/sh

./tcgen souffle.facts $1 > e.facts
./benchmark.sh ./test_tc_souffle_compiled_prog_round.sh $1
rm e.facts e.csv tc.souffle.compiled tc.souffle.compiled.cpp
