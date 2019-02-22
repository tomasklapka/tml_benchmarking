#!/bin/sh

./tcgen souffle $1 > ./tmp/$1.comp.souffle
./benchmark.sh ./test_tc_souffle_compiled_round.sh $1
rm ./tmp/$1.comp.souffle e.csv ./tmp/$1.result.comp.souffle ./tmp/comp.souffle$1 ./tmp/comp.souffle$1.cpp
