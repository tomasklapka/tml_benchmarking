#!/bin/sh

./tcgen souffle $1 > ./tmp/$1.souffle
./benchmark.sh souffle -D- ./tmp/$1.souffle > ./tmp/$1.result.souffle
rm ./tmp/$1.souffle ./tmp/$1.result.souffle
