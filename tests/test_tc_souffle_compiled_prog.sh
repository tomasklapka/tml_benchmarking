#!/bin/sh

./tcgen souffle.facts $1 > ./tmp/e.facts
./benchmark.sh ./test_tc_souffle_compiled_prog_round.sh $1
rm ./tmp/e.facts ./tmp/e.csv ./tmp/tc.souffle.compiled ./tmp/tc.souffle.compiled.cpp
