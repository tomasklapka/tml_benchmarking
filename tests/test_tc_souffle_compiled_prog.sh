#!/bin/bash

./tcgen souffle.facts $1 > ./tmp/e.facts
./benchmark.sh ./test_tc_souffle_compiled_prog_round.sh
rm -f ./tmp/e.facts ./tmp/e.csv ./tmp/ee.csv \
	./tmp/tc.souffle.compiled ./tmp/tc.souffle.compiled.cpp
