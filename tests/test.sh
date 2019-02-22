#!/bin/bash

declare -a ts               # elapsed times in seconds
declare -a ms               # array of mems taken
declare -A r_a              # benchmark result
declare -i n                # number of nodes
declare -i max_nodes        # limit number of nodes for a test
declare -i max_time         # limit for test round in ms
declare -i max_mem          # memory limit for test round in kBs
declare -i estimate_time=0  # estimate time of next round
declare -i estimate_mem=0   # estimate mem of next round
declare k_time=4            # estimation koef.
declare k_mem=4             # estimation koef.

# compile tcgen - generator of testing graphs
if [ ! -f ./tcgen ]; then g++ tcgen.cpp -W -Wall -Wpedantic -otcgen -O3 -flto; fi

# set max_time from $1 (number of seconds) or use 300 s (5 minutes) as default
if [ -z $1 ]; then max_time=300000; else max_time="${1}000"; fi

# get total memory to set max_mem
meminfo=($(free --kilo | grep Mem));
max_mem=${meminfo[1]}

# up to 7 rounds (when starting at 125)
max_nodes=8000

echo "Running TC tests for tml, souffle and xsb."
echo "Limit test round time: $max_time ms, max mem taken: $max_mem kBs and max number of nodes: $max_nodes"
echo

function test_round() {
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
    k_time_print=$(printf '%.*f\n' 2 $k_time)
    k_mem_print=$(printf '%.*f\n' 2 $k_mem)
    echo "([test]=$test [nodes]=$n [elapsed]=$elapsed $r [k_time]=$k_time_print [k_mem]=$k_mem_print [est_time]=$estimate_time [est_mem]=$estimate_mem)"
}

for test in tml xsb souffle souffle_compiled_prog souffle_compiled; do
    echo "Starting TC test of $test"
    n=125      # start with 125 nodes
    ts=()      # empty elapsed times
    ms=()      # empty taken mems
    k_time=4   # default est. koef
    k_mem=4    # default est. koef
    estimate_time=0
    estimate_mem=0
    # while estimates are not over limits
    while (( estimate_time <= max_time && estimate_mem <= max_mem && n <= max_nodes)); do
        test_round # run test round and update estimates
        n=n*2  # double number of nodes
    done
    # inform about the end of test and show what limit was reached
    echo -n "TC test of $test finished (limit reached) "
    declare -a limits=();
    if (( estimate_time > max_time )); then limits+=(" ${estimate_time} ms > ${max_time} ms"); fi
    if (( estimate_mem > max_mem )); then limits+=(" ${estimate_mem} kBs > ${max_mem} kBs"); fi
    if (( n > max_nodes )); then limits+=(" ${n} nodes > ${max_nodes} nodes"); fi
    echo $(IFS=, ; echo "${limits[*]}.")
    echo
done
