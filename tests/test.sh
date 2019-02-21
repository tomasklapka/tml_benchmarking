#!/bin/bash

declare -a ts               # elapsed times in seconds
declare -a ms               # array of mems taken
declare -A r_a              # benchmark result
declare -i n                # number of nodes
declare -i max_time         # limit for test round in ms
declare -i max_mem          # memory limit for test round in kBs
declare -i estimate_time=0  # estimate time of next round
declare -i estimate_mem=0   # estimate mem of next round
declare k_time=4            # estimation koef.
declare k_mem=4             # estimation koef.

# compile tcgen - generator of testing graphs
if [ ! -f ./tcgen ]; then g++ tcgen.cpp -W -Wall -Wpedantic -otcgen -O3 -flto; fi

# souffle PE compile TC prog (TC prog w/o data compiled to c++)
#started=`date +%s%3N`
#souffle -otc.souffle tc.souffle
#finished=`date +%s%3N`
#let "souffle_tc_compile_time=finished - started"
#rm tc.souffle.cpp

# set max_time from $1 (number of seconds) or use 300 s (5 minutes) as default
if [ -z $1 ]; then max_time=300000; else max_time="${1}000"; fi

# get total memory to set max_mem
meminfo=($(free --kilo | grep Mem));
max_mem=${meminfo[1]}

echo "Running TC tests for tml, souffle and xsb."
echo "Limit test round time: $max_time ms and max mem taken: $max_mem kBs"
echo

test_round() {
    echo -n "TC $n nodes - $test: "

    # show starting time and estimates
    estimate_show="Started at: $(date +%H:%M:%S). Estimate time: ${estimate_time} ms mem: ${estimate_mem} kBs"
    echo -n $estimate_show
    estimate_hide=`echo $estimate_show | sed -r 's/./\\\\b/g'` # prepare deletion string

    # run the test, measure elapsed time and store values
    started=`date +%s%3N`
    r=`./test_tc_$test.sh $n 2>&1 >/dev/null`
    finished=`date +%s%3N`
    let "elapsed=finished - started"
    eval "r_a=($r)"
    ts+=($elapsed)
    ms+=(${r_a[mem]})

    # update estimate koefs
    if (( ${#ts[*]} > 1 )); then
        if (( ${ts[-2]} > 0 )); then
            k_time=$(echo "${ts[-1]} / ${ts[-2]}" | bc -l);
        fi
        if (( ${ms[-2]} > 0 )); then
            k_mem=$(echo "${ms[-1]} / ${ms[-2]}" | bc -l);
        fi
    fi

    # count estimates
    estimate_time=$(printf %.$2f $(echo "${ts[-1]} * $k_time" | bc -l))
    estimate_mem=$(printf %.$2f $(echo "${ms[-1]} * $k_mem" | bc -l))

    # remove starting time with estimates and show values
    echo -ne $estimate_hide
    echo "([test]=$test [nodes]=$n [elapsed]=$elapsed $r [k_time]=$k_time [k_mem]=$k_mem [est_time]=$estimate_time [est_mem]=$estimate_mem)"
}

for test in souffle_compiled_prog tml souffle xsb; do
    echo "Starting TC test of $test"
    n=125      # start with 125 nodes
    ts=()      # empty elapsed times
    ms=()      # empty taken mems
    k_time=4   # default est. koef
    k_mem=4    # default est. koef
    test_round # run test round and get estimates
    # while estimates are not over limits
    while (( estimate_time < max_time && estimate_mem < max_mem)); do
        n=n*2  # double number of nodes
        test_round # run test round and update estimates
    done
    # inform about the end of test and show what limit was reached
    echo -n "TC test of $test finished (limit reached)"
    if (( estimate_time > max_time )); then
        echo -n " ${estimate_time} ms > ${max_time} ms";
        if (( estimate_mem > max_mem )); then echo -n ", "; fi
    fi
    if (( estimate_mem > max_mem )); then echo -n " ${estimate_mem} kBs > ${max_mem} kBs"; fi
    echo "."
    echo
done
