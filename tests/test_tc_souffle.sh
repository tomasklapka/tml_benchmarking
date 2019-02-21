#!/bin/sh

./tcgen souffle $1 > $1.souffle
./benchmark.sh souffle -D- $1.souffle > $1.result.souffle
rm $1.souffle $1.result.souffle
