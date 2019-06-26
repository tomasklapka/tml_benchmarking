#!/bin/bash

declare -a r=`./benchmark.sh souffle -o./tmp/tc.souffle.compiled tc$ALT.souffle 2>&1 > /dev/null`
declare -A r_a
eval "r_a=($r)"
>&2 echo -n "[comp_elapsed]=${r_a[elapsed]} [comp_mem]=${r_a[mem]} "

./tmp/tc.souffle.compiled -F./tmp/ -D./tmp/
