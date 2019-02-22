Benchmarking of [TML](https://github.com/IDNI/tau), [Soufflé](http://souffle-lang.org/) and [XSB](http://xsb.sourceforge.net/).

### Usage:

1. install TML, Soufflé and XSB (executables must be in $PATH dirs) or install docker
2. run `./test.sh` or run `./test.docker.sh`

Default time limit for a test round is 5 minutes. Test tries to estimate time and mem consumption for the next round and finishes when the estimate is over the limit. Both test.sh and test.docker.sh accept another limit time in seconds as a parameter: `./test.sh 60`

Example output:
```
$ ./test.sh
Running TC tests for tml, souffle and xsb.
Limit test round time: 300000 ms, max mem taken: 16696164 kBs and max number of nodes: 8000

Starting TC test of tml
TC 125 nodes - tml: ([test]=tml [nodes]=125 [elapsed]=172 [user]=0.09 [system]=0.05 [cpu]=100% [mem]=26016 [k_time]=4.00 [k_mem]=4.00 [est_time]=688 [est_mem]=104064)
TC 250 nodes - tml: ([test]=tml [nodes]=250 [elapsed]=479 [user]=0.31 [system]=0.15 [cpu]=99% [mem]=84372 [k_time]=2.78 [k_mem]=3.24 [est_time]=1334 [est_mem]=273625)
TC 500 nodes - tml: ([test]=tml [nodes]=500 [elapsed]=1619 [user]=1.00 [system]=0.59 [cpu]=99% [mem]=299740 [k_time]=3.38 [k_mem]=3.55 [est_time]=5472 [est_mem]=1064856)
TC 1000 nodes - tml: ([test]=tml [nodes]=1000 [elapsed]=6203 [user]=3.90 [system]=2.27 [cpu]=99% [mem]=1164828 [k_time]=3.83 [k_mem]=3.89 [est_time]=23766 [est_mem]=4526671)
TC 2000 nodes - tml: ([test]=tml [nodes]=2000 [elapsed]=25816 [user]=16.32 [system]=9.44 [cpu]=99% [mem]=4641392 [k_time]=4.16 [k_mem]=3.98 [est_time]=107443 [est_mem]=18494164)
TC test of tml finished (limit reached) 18494164 kBs > 16696164 kBs.

Starting TC test of xsb
TC 125 nodes - xsb: ([test]=xsb [nodes]=125 [elapsed]=333 [user]=0.30 [system]=0.02 [cpu]=101% [mem]=20388 [k_time]=4.00 [k_mem]=4.00 [est_time]=1332 [est_mem]=81552)
TC 250 nodes - xsb: ([test]=xsb [nodes]=250 [elapsed]=1997 [user]=1.95 [system]=0.03 [cpu]=100% [mem]=37720 [k_time]=6.00 [k_mem]=1.85 [est_time]=11976 [est_mem]=69786)
TC 500 nodes - xsb: ([test]=xsb [nodes]=500 [elapsed]=14242 [user]=14.15 [system]=0.07 [cpu]=99% [mem]=111252 [k_time]=7.13 [k_mem]=2.95 [est_time]=101570 [est_mem]=328129)
TC 1000 nodes - xsb: ([test]=xsb [nodes]=1000 [elapsed]=115178 [user]=114.95 [system]=0.14 [cpu]=99% [mem]=424384 [k_time]=8.09 [k_mem]=3.81 [est_time]=931468 [est_mem]=1618863)
TC test of xsb finished (limit reached) 931468 ms > 300000 ms.

Starting TC test of souffle
TC 125 nodes - souffle: ([test]=souffle [nodes]=125 [elapsed]=441 [user]=0.42 [system]=0.00 [cpu]=99% [mem]=6544 [k_time]=4.00 [k_mem]=4.00 [est_time]=1764 [est_mem]=26176)
TC 250 nodes - souffle: ([test]=souffle [nodes]=250 [elapsed]=3363 [user]=3.34 [system]=0.00 [cpu]=99% [mem]=8204 [k_time]=7.63 [k_mem]=1.25 [est_time]=25646 [est_mem]=10285)
TC 500 nodes - souffle: ([test]=souffle [nodes]=500 [elapsed]=28045 [user]=28.00 [system]=0.01 [cpu]=99% [mem]=15040 [k_time]=8.34 [k_mem]=1.83 [est_time]=233875 [est_mem]=27572)
TC 1000 nodes - souffle: ([test]=souffle [nodes]=1000 [elapsed]=233931 [user]=233.71 [system]=0.02 [cpu]=99% [mem]=39292 [k_time]=8.34 [k_mem]=2.61 [est_time]=1951282 [est_mem]=102650)
TC test of souffle finished (limit reached) 1951282 ms > 300000 ms.

Starting TC test of souffle_compiled_prog
TC 125 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=125 [elapsed]=4642 [user]=4.50 [system]=0.17 [cpu]=101% [mem]=362292 [k_time]=4.00 [k_mem]=4.00 [est_time]=18568 [est_mem]=1449168)
TC 250 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=250 [elapsed]=4782 [user]=4.63 [system]=0.18 [cpu]=101% [mem]=362188 [k_time]=1.03 [k_mem]=1.00 [est_time]=4926 [est_mem]=362084)
TC 500 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=500 [elapsed]=5816 [user]=5.68 [system]=0.16 [cpu]=100% [mem]=362396 [k_time]=1.22 [k_mem]=1.00 [est_time]=7074 [est_mem]=362604)
TC 1000 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=13955 [user]=13.81 [system]=0.17 [cpu]=100% [mem]=362320 [k_time]=2.40 [k_mem]=1.00 [est_time]=33484 [est_mem]=362244)
TC 2000 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=2000 [elapsed]=77637 [user]=77.43 [system]=0.19 [cpu]=100% [mem]=362100 [k_time]=5.56 [k_mem]=1.00 [est_time]=431924 [est_mem]=361880)
TC test of souffle_compiled_prog finished (limit reached) 431924 ms > 300000 ms.

Starting TC test of souffle_compiled
TC 125 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=125 [elapsed]=4744 [user]=4.55 [system]=0.23 [cpu]=100% [mem]=366420 [k_time]=4.00 [k_mem]=4.00 [est_time]=18976 [est_mem]=1465680)
TC 250 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=250 [elapsed]=5173 [user]=5.01 [system]=0.19 [cpu]=101% [mem]=376528 [k_time]=1.09 [k_mem]=1.03 [est_time]=5641 [est_mem]=386915)
TC 500 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=500 [elapsed]=6778 [user]=6.63 [system]=0.18 [cpu]=100% [mem]=393720 [k_time]=1.31 [k_mem]=1.05 [est_time]=8881 [est_mem]=411697)
TC 1000 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=1000 [elapsed]=16464 [user]=16.26 [system]=0.21 [cpu]=100% [mem]=428824 [k_time]=2.43 [k_mem]=1.09 [est_time]=39992 [est_mem]=467058)
TC 2000 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=2000 [elapsed]=69338 [user]=68.86 [system]=0.23 [cpu]=99% [mem]=481096 [k_time]=4.21 [k_mem]=1.12 [est_time]=292016 [est_mem]=539740)
TC 4000 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=4000 [elapsed]=457495 [user]=455.91 [system]=0.42 [cpu]=99% [mem]=563936 [k_time]=6.60 [k_mem]=1.17 [est_time]=3018571 [est_mem]=661040)
TC test of souffle_compiled finished (limit reached) 3018571 ms > 300000 ms.

```


Docker example (all is little bit slower and Soufflé the most):
```
$ ./test.docker.sh
(... docker image building ...)
Running TC tests for tml, souffle and xsb.
Limit test round time: 300000 ms, max mem taken: 16696164 kBs and max number of nodes: 8000

Starting TC test of tml
TC 125 nodes - tml: ([test]=tml [nodes]=125 [elapsed]=151 [user]=0.09 [system]=0.05 [cpu]=99% [mem]=25464 [k_time]=4.00 [k_mem]=4.00 [est_time]=604 [est_mem]=101856)
TC 250 nodes - tml: ([test]=tml [nodes]=250 [elapsed]=555 [user]=0.35 [system]=0.19 [cpu]=99% [mem]=83680 [k_time]=3.68 [k_mem]=3.29 [est_time]=2040 [est_mem]=274990)
TC 500 nodes - tml: ([test]=tml [nodes]=500 [elapsed]=1936 [user]=1.19 [system]=0.72 [cpu]=99% [mem]=299152 [k_time]=3.49 [k_mem]=3.57 [est_time]=6753 [est_mem]=1069454)
TC 1000 nodes - tml: ([test]=tml [nodes]=1000 [elapsed]=7437 [user]=4.57 [system]=2.83 [cpu]=99% [mem]=1164256 [k_time]=3.84 [k_mem]=3.89 [est_time]=28569 [est_mem]=4531115)
TC 2000 nodes - tml: ([test]=tml [nodes]=2000 [elapsed]=31441 [user]=19.78 [system]=11.56 [cpu]=99% [mem]=4640848 [k_time]=4.23 [k_mem]=3.99 [est_time]=132921 [est_mem]=18498913)
TC test of tml finished (limit reached) 18498913 kBs > 16696164 kBs.

Starting TC test of xsb
TC 125 nodes - xsb: ([test]=xsb [nodes]=125 [elapsed]=379 [user]=0.33 [system]=0.01 [cpu]=94% [mem]=20428 [k_time]=4.00 [k_mem]=4.00 [est_time]=1516 [est_mem]=81712)
TC 250 nodes - xsb: ([test]=xsb [nodes]=250 [elapsed]=2222 [user]=2.19 [system]=0.01 [cpu]=99% [mem]=37672 [k_time]=5.86 [k_mem]=1.84 [est_time]=13027 [est_mem]=69472)
TC 500 nodes - xsb: ([test]=xsb [nodes]=500 [elapsed]=16822 [user]=16.76 [system]=0.03 [cpu]=99% [mem]=111144 [k_time]=7.57 [k_mem]=2.95 [est_time]=127354 [est_mem]=327909)
TC 1000 nodes - xsb: ([test]=xsb [nodes]=1000 [elapsed]=128872 [user]=128.56 [system]=0.14 [cpu]=99% [mem]=424168 [k_time]=7.66 [k_mem]=3.82 [est_time]=987278 [est_mem]=1618787)
TC test of xsb finished (limit reached) 987278 ms > 300000 ms.

Starting TC test of souffle
TC 125 nodes - souffle: ([test]=souffle [nodes]=125 [elapsed]=1410 [user]=1.20 [system]=0.00 [cpu]=86% [mem]=7160 [k_time]=4.00 [k_mem]=4.00 [est_time]=5640 [est_mem]=28640)
TC 250 nodes - souffle: ([test]=souffle [nodes]=250 [elapsed]=9106 [user]=9.08 [system]=0.00 [cpu]=99% [mem]=8516 [k_time]=6.46 [k_mem]=1.19 [est_time]=58808 [est_mem]=10129)
TC 500 nodes - souffle: ([test]=souffle [nodes]=500 [elapsed]=72603 [user]=72.54 [system]=0.00 [cpu]=99% [mem]=15132 [k_time]=7.97 [k_mem]=1.78 [est_time]=578871 [est_mem]=26888)
TC test of souffle finished (limit reached) 578871 ms > 300000 ms.

Starting TC test of souffle_compiled_prog
TC 125 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=125 [elapsed]=6042 [user]=5.52 [system]=0.22 [cpu]=95% [mem]=392236 [k_time]=4.00 [k_mem]=4.00 [est_time]=24168 [est_mem]=1568944)
TC 250 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=250 [elapsed]=6185 [user]=5.99 [system]=0.16 [cpu]=99% [mem]=392244 [k_time]=1.02 [k_mem]=1.00 [est_time]=6331 [est_mem]=392252)
TC 500 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=500 [elapsed]=9768 [user]=9.54 [system]=0.19 [cpu]=99% [mem]=392332 [k_time]=1.58 [k_mem]=1.00 [est_time]=15427 [est_mem]=392420)
TC 1000 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=38536 [user]=38.24 [system]=0.25 [cpu]=99% [mem]=392388 [k_time]=3.95 [k_mem]=1.00 [est_time]=152029 [est_mem]=392444)
TC 2000 nodes - souffle_compiled_prog: ([test]=souffle_compiled_prog [nodes]=2000 [elapsed]=278799 [user]=278.30 [system]=0.24 [cpu]=99% [mem]=392348 [k_time]=7.23 [k_mem]=1.00 [est_time]=2017046 [est_mem]=392308)
TC test of souffle_compiled_prog finished (limit reached) 2017046 ms > 300000 ms.

Starting TC test of souffle_compiled
TC 125 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=125 [elapsed]=5806 [user]=5.62 [system]=0.15 [cpu]=99% [mem]=394440 [k_time]=4.00 [k_mem]=4.00 [est_time]=23224 [est_mem]=1577760)
TC 250 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=250 [elapsed]=6548 [user]=6.34 [system]=0.17 [cpu]=99% [mem]=400224 [k_time]=1.13 [k_mem]=1.01 [est_time]=7385 [est_mem]=406093)
TC 500 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=500 [elapsed]=10911 [user]=10.69 [system]=0.19 [cpu]=99% [mem]=412028 [k_time]=1.67 [k_mem]=1.03 [est_time]=18181 [est_mem]=424180)
TC 1000 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=1000 [elapsed]=42973 [user]=42.64 [system]=0.26 [cpu]=99% [mem]=436256 [k_time]=3.94 [k_mem]=1.06 [est_time]=169249 [est_mem]=461909)
TC 2000 nodes - souffle_compiled: ([test]=souffle_compiled [nodes]=2000 [elapsed]=274375 [user]=273.88 [system]=0.26 [cpu]=99% [mem]=489988 [k_time]=6.38 [k_mem]=1.12 [est_time]=1751836 [est_mem]=550338)
TC test of souffle_compiled finished (limit reached) 1751836 ms > 300000 ms.

```
