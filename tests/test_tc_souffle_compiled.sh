#!/bin/sh

./tcgen souffle $1 > $1.comp.souffle
./benchmark.sh ./test_tc_souffle_compiled_round.sh $1
rm $1.comp.souffle e.csv $1.result.comp.souffle comp.souffle$1 comp.souffle$1.cpp
