#!/bin/bash

declare -a r=`./benchmark.sh souffle -o./tmp/comp.souffle$1 ./tmp/$1.comp.souffle 2>&1 > /dev/null`
declare -A r_a
eval "r_a=($r)"
>&2 echo -n "[comp_elapsed]=${r_a[elapsed]} [comp_mem]=${r_a[mem]} "

./tmp/comp.souffle$1 > ./tmp/$1.result.comp.souffle
