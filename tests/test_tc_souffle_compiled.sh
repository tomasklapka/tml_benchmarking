#!/bin/bash

./tcgen souffle $1 > ./tmp/$1.comp.souffle
./benchmark.sh ./test_tc_souffle_compiled_round.sh $1
rm -f ./tmp/$1.comp.souffle ./e.csv ./tmp/e.csv ./tmp/ee.csv \
	./tmp/$1.result.comp.souffle ./tmp/comp.souffle$1 \
	./tmp/comp.souffle$1.cpp
