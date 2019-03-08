Benchmarking of [TML](https://github.com/IDNI/tau), [Soufflé](http://souffle-lang.org/) and [XSB](http://xsb.sourceforge.net/).

### Usage:

1. install TML, Soufflé and XSB (executables must be in $PATH dirs) or install docker
2. run `./test.sh` or run `./test.docker.sh`

Default time limit for a test round is 5 minutes. Test tries to estimate time and mem consumption for the next round and finishes when the estimate is over the limit. Both test.sh and test.docker.sh accept another limit time in seconds as a parameter: `./test.sh 60`

You can change the list and order of the tests by using `$TESTS` environment variable: `TESTS="souffle xsb tml" ./test.sh`.

Available tests are:

* **tml**
* **xsb**
* **souffle** - interpreted
* **souffle_compiled_prog** - compiled TC program, data on input
* **souffle_compiled** - compiled TC program with data, no input

Docker tests are slightly slower and Soufflé the most.

Example output:
```
$ ./test.sh
Running TC tests for tml, souffle and xsb.
Limit test round time: 300000 ms, max mem taken: 16696168 kBs and max number of nodes: 8000

Starting TC test of tml
([test]=tml [nodes]=125 [elapsed]=93 [user]=0.06 [system]=0.00 [cpu]=98% [mem]=12048 [k_time]=4.00 [k_mem]=4.00 [est_time]=372 [est_mem]=48192)
([test]=tml [nodes]=250 [elapsed]=325 [user]=0.20 [system]=0.04 [cpu]=99% [mem]=31868 [k_time]=3.49 [k_mem]=2.65 [est_time]=1136 [est_mem]=84294)
([test]=tml [nodes]=500 [elapsed]=1393 [user]=0.99 [system]=0.12 [cpu]=99% [mem]=108420 [k_time]=4.29 [k_mem]=3.40 [est_time]=5971 [est_mem]=368862)
([test]=tml [nodes]=1000 [elapsed]=6160 [user]=4.42 [system]=0.60 [cpu]=99% [mem]=403720 [k_time]=4.42 [k_mem]=3.72 [est_time]=27240 [est_mem]=1503319)
([test]=tml [nodes]=2000 [elapsed]=29521 [user]=21.79 [system]=2.50 [cpu]=99% [mem]=1566672 [k_time]=4.79 [k_mem]=3.88 [est_time]=141476 [est_mem]=6079612)
([test]=tml [nodes]=4000 [elapsed]=162523 [user]=130.41 [system]=9.64 [cpu]=99% [mem]=5915416 [k_time]=5.51 [k_mem]=3.78 [est_time]=894744 [est_mem]=22335337)
TC test of tml finished because 894744 ms > 300000 ms, 22335337 kBs > 16696168 kBs.

Starting TC test of xsb
([test]=xsb [nodes]=125 [elapsed]=300 [user]=0.27 [system]=0.02 [cpu]=101% [mem]=20540 [k_time]=4.00 [k_mem]=4.00 [est_time]=1200 [est_mem]=82160)
([test]=xsb [nodes]=250 [elapsed]=1795 [user]=1.76 [system]=0.03 [cpu]=100% [mem]=38024 [k_time]=5.98 [k_mem]=1.85 [est_time]=10740 [est_mem]=70391)
([test]=xsb [nodes]=500 [elapsed]=14431 [user]=14.36 [system]=0.04 [cpu]=99% [mem]=118996 [k_time]=8.04 [k_mem]=3.13 [est_time]=116019 [est_mem]=372398)
([test]=xsb [nodes]=1000 [elapsed]=112062 [user]=111.85 [system]=0.14 [cpu]=99% [mem]=439860 [k_time]=7.77 [k_mem]=3.70 [est_time]=870202 [est_mem]=1625910)
TC test of xsb finished because 870202 ms > 300000 ms.

Starting TC test of souffle
([test]=souffle [nodes]=125 [elapsed]=436 [user]=0.42 [system]=0.00 [cpu]=100% [mem]=6832 [k_time]=4.00 [k_mem]=4.00 [est_time]=1744 [est_mem]=27328)
([test]=souffle [nodes]=250 [elapsed]=3520 [user]=3.46 [system]=0.00 [cpu]=99% [mem]=8264 [k_time]=8.07 [k_mem]=1.21 [est_time]=28418 [est_mem]=9996)
([test]=souffle [nodes]=500 [elapsed]=27505 [user]=27.21 [system]=0.01 [cpu]=99% [mem]=15068 [k_time]=7.81 [k_mem]=1.82 [est_time]=214922 [est_mem]=27474)
([test]=souffle [nodes]=1000 [elapsed]=232252 [user]=231.08 [system]=0.03 [cpu]=99% [mem]=39304 [k_time]=8.44 [k_mem]=2.61 [est_time]=1961134 [est_mem]=102522)
TC test of souffle finished because 1961134 ms > 300000 ms.

Starting TC test of souffle_compiled_prog
([test]=souffle_compiled_prog [nodes]=125 [elapsed]=4612 [comp_elapsed]=4575 [comp_mem]=362264 [user]=4.46 [system]=0.18 [cpu]=101% [mem]=362264 [k_time]=4.00 [k_mem]=4.00 [est_time]=18448 [est_mem]=1449056)
([test]=souffle_compiled_prog [nodes]=250 [elapsed]=4731 [comp_elapsed]=4551 [comp_mem]=362096 [user]=4.58 [system]=0.19 [cpu]=101% [mem]=362096 [k_time]=1.03 [k_mem]=1.00 [est_time]=4853 [est_mem]=361928)
([test]=souffle_compiled_prog [nodes]=500 [elapsed]=5752 [comp_elapsed]=4523 [comp_mem]=362420 [user]=5.61 [system]=0.18 [cpu]=100% [mem]=362420 [k_time]=1.22 [k_mem]=1.00 [est_time]=6993 [est_mem]=362744)
([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=13821 [comp_elapsed]=4548 [comp_mem]=362280 [user]=13.68 [system]=0.17 [cpu]=100% [mem]=362280 [k_time]=2.40 [k_mem]=1.00 [est_time]=33209 [est_mem]=362140)
([test]=souffle_compiled_prog [nodes]=2000 [elapsed]=81150 [comp_elapsed]=4536 [comp_mem]=362376 [user]=80.96 [system]=0.17 [cpu]=99% [mem]=362376 [k_time]=5.87 [k_mem]=1.00 [est_time]=476472 [est_mem]=362472)
TC test of souffle_compiled_prog finished because 476472 ms > 300000 ms.

Starting TC test of souffle_compiled
([test]=souffle_compiled [nodes]=125 [elapsed]=4699 [comp_elapsed]=4663 [comp_mem]=366568 [user]=4.51 [system]=0.23 [cpu]=101% [mem]=366568 [k_time]=4.00 [k_mem]=4.00 [est_time]=18796 [est_mem]=1466272)
([test]=souffle_compiled [nodes]=250 [elapsed]=5125 [comp_elapsed]=4944 [comp_mem]=376604 [user]=4.92 [system]=0.25 [cpu]=101% [mem]=376604 [k_time]=1.09 [k_mem]=1.03 [est_time]=5590 [est_mem]=386915)
([test]=souffle_compiled [nodes]=500 [elapsed]=6741 [comp_elapsed]=5481 [comp_mem]=393896 [user]=6.58 [system]=0.22 [cpu]=101% [mem]=393896 [k_time]=1.32 [k_mem]=1.05 [est_time]=8867 [est_mem]=411982)
([test]=souffle_compiled [nodes]=1000 [elapsed]=16278 [comp_elapsed]=6931 [comp_mem]=428800 [user]=16.12 [system]=0.22 [cpu]=100% [mem]=428800 [k_time]=2.41 [k_mem]=1.09 [est_time]=39308 [est_mem]=466797)
([test]=souffle_compiled [nodes]=2000 [elapsed]=70027 [comp_elapsed]=10706 [comp_mem]=481276 [user]=69.81 [system]=0.26 [cpu]=100% [mem]=481276 [k_time]=4.30 [k_mem]=1.12 [est_time]=301252 [est_mem]=540174)
TC test of souffle_compiled finished because 301252 ms > 300000 ms.

```


Example test.docker output:

```
$ ./test.docker.sh 60

... docker image building ...

Running TC tests for tml, souffle and xsb.
Limit test round time: 60000 ms, max mem taken: 16696168 kBs and max number of nodes: 8000

Starting TC test of tml
([test]=tml [nodes]=125 [elapsed]=110 [user]=0.08 [system]=0.00 [cpu]=98% [mem]=11504 [k_time]=4.00 [k_mem]=4.00 [est_time]=440 [est_mem]=46016)
([test]=tml [nodes]=250 [elapsed]=378 [user]=0.27 [system]=0.03 [cpu]=99% [mem]=31240 [k_time]=3.44 [k_mem]=2.72 [est_time]=1299 [est_mem]=84835)
([test]=tml [nodes]=500 [elapsed]=1661 [user]=1.24 [system]=0.15 [cpu]=99% [mem]=107636 [k_time]=4.39 [k_mem]=3.45 [est_time]=7299 [est_mem]=370855)
([test]=tml [nodes]=1000 [elapsed]=7014 [user]=5.26 [system]=0.70 [cpu]=99% [mem]=403144 [k_time]=4.22 [k_mem]=3.75 [est_time]=29618 [est_mem]=1509951)
([test]=tml [nodes]=2000 [elapsed]=33763 [user]=26.21 [system]=2.64 [cpu]=99% [mem]=1566000 [k_time]=4.81 [k_mem]=3.88 [est_time]=162524 [est_mem]=6083077)
TC test of tml finished because 162524 ms > 60000 ms.

Starting TC test of xsb
([test]=xsb [nodes]=125 [elapsed]=320 [user]=0.30 [system]=0.01 [cpu]=100% [mem]=20536 [k_time]=4.00 [k_mem]=4.00 [est_time]=1280 [est_mem]=82144)
([test]=xsb [nodes]=250 [elapsed]=2068 [user]=2.05 [system]=0.00 [cpu]=100% [mem]=37792 [k_time]=6.46 [k_mem]=1.84 [est_time]=13364 [est_mem]=69548)
([test]=xsb [nodes]=500 [elapsed]=16396 [user]=16.33 [system]=0.05 [cpu]=99% [mem]=119120 [k_time]=7.93 [k_mem]=3.15 [est_time]=129995 [est_mem]=375465)
TC test of xsb finished because 129995 ms > 60000 ms.

Starting TC test of souffle
([test]=souffle [nodes]=125 [elapsed]=1174 [user]=1.15 [system]=0.00 [cpu]=99% [mem]=7104 [k_time]=4.00 [k_mem]=4.00 [est_time]=4696 [est_mem]=28416)
([test]=souffle [nodes]=250 [elapsed]=9028 [user]=8.97 [system]=0.00 [cpu]=99% [mem]=8500 [k_time]=7.69 [k_mem]=1.20 [est_time]=69425 [est_mem]=10170)
TC test of souffle finished because 69425 ms > 60000 ms.

Starting TC test of souffle_compiled_prog
([test]=souffle_compiled_prog [nodes]=125 [elapsed]=5707 [comp_elapsed]=5629 [comp_mem]=392688 [user]=5.48 [system]=0.19 [cpu]=99% [mem]=392688 [k_time]=4.00 [k_mem]=4.00 [est_time]=22828 [est_mem]=1570752)
([test]=souffle_compiled_prog [nodes]=250 [elapsed]=6100 [comp_elapsed]=5620 [comp_mem]=392752 [user]=5.82 [system]=0.25 [cpu]=99% [mem]=392752 [k_time]=1.07 [k_mem]=1.00 [est_time]=6520 [est_mem]=392816)
([test]=souffle_compiled_prog [nodes]=500 [elapsed]=9070 [comp_elapsed]=5599 [comp_mem]=392644 [user]=8.78 [system]=0.25 [cpu]=99% [mem]=392644 [k_time]=1.49 [k_mem]=1.00 [est_time]=13486 [est_mem]=392536)
([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=33054 [comp_elapsed]=5653 [comp_mem]=392588 [user]=32.80 [system]=0.22 [cpu]=99% [mem]=392588 [k_time]=3.64 [k_mem]=1.00 [est_time]=120459 [est_mem]=392532)
TC test of souffle_compiled_prog finished because 120459 ms > 60000 ms.

Starting TC test of souffle_compiled
([test]=souffle_compiled [nodes]=125 [elapsed]=5713 [comp_elapsed]=5636 [comp_mem]=395004 [user]=5.50 [system]=0.19 [cpu]=99% [mem]=395004 [k_time]=4.00 [k_mem]=4.00 [est_time]=22852 [est_mem]=1580016)
([test]=souffle_compiled [nodes]=250 [elapsed]=6446 [comp_elapsed]=5973 [comp_mem]=400848 [user]=6.19 [system]=0.22 [cpu]=99% [mem]=400848 [k_time]=1.13 [k_mem]=1.01 [est_time]=7273 [est_mem]=406778)
([test]=souffle_compiled [nodes]=500 [elapsed]=10432 [comp_elapsed]=6858 [comp_mem]=412708 [user]=10.17 [system]=0.23 [cpu]=99% [mem]=412708 [k_time]=1.62 [k_mem]=1.03 [est_time]=16883 [est_mem]=424919)
([test]=souffle_compiled [nodes]=1000 [elapsed]=36992 [comp_elapsed]=9956 [comp_mem]=436992 [user]=36.74 [system]=0.20 [cpu]=99% [mem]=436992 [k_time]=3.55 [k_mem]=1.06 [est_time]=131174 [est_mem]=462705)
TC test of souffle_compiled finished because 131174 ms > 60000 ms.

```
