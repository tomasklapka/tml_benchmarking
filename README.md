Benchmarking of [TML](https://github.com/IDNI/tau), [Soufflé](http://souffle-lang.org/) and [XSB](http://xsb.sourceforge.net/).

### Usage:

1. install TML, Soufflé and XSB (executables must be in $PATH dirs) or install docker
2. run `./test.sh` or run `./test.docker.sh`

Default time limit for a test round is 5 minutes. Test tries to estimate time and mem consumption for the next round and finishes when the estimate is over the limit. Both test.sh and test.docker.sh accept another limit time in seconds as a parameter: `./test.sh 60`

Docker tests are slightly slower and Soufflé the most.

Example output:
```
$ ./test.sh 60
Running TC tests for tml, souffle and xsb.
Limit test round time: 60000 ms, max mem taken: 16696172 kBs and max number of nodes: 8000

Starting TC test of tml
([test]=tml [nodes]=125 [elapsed]=122 [user]=0.09 [system]=0.01 [cpu]=99% [mem]=26228 [k_time]=4.00 [k_mem]=4.00 [est_time]=488 [est_mem]=104912)
([test]=tml [nodes]=250 [elapsed]=444 [user]=0.30 [system]=0.06 [cpu]=99% [mem]=84324 [k_time]=3.64 [k_mem]=3.22 [est_time]=1616 [est_mem]=271105)
([test]=tml [nodes]=500 [elapsed]=1561 [user]=1.06 [system]=0.22 [cpu]=99% [mem]=299740 [k_time]=3.52 [k_mem]=3.55 [est_time]=5488 [est_mem]=1065463)
([test]=tml [nodes]=1000 [elapsed]=6145 [user]=4.08 [system]=0.94 [cpu]=99% [mem]=1164852 [k_time]=3.94 [k_mem]=3.89 [est_time]=24190 [est_mem]=4526857)
([test]=tml [nodes]=2000 [elapsed]=25167 [user]=16.40 [system]=3.55 [cpu]=99% [mem]=4641452 [k_time]=4.10 [k_mem]=3.98 [est_time]=103072 [est_mem]=18494261)
TC test of tml finished because 103072 ms > 60000 ms, 18494261 kBs > 16696172 kBs.

Starting TC test of xsb
([test]=xsb [nodes]=125 [elapsed]=302 [user]=0.28 [system]=0.01 [cpu]=101% [mem]=20284 [k_time]=4.00 [k_mem]=4.00 [est_time]=1208 [est_mem]=81136)
([test]=xsb [nodes]=250 [elapsed]=1862 [user]=1.84 [system]=0.02 [cpu]=100% [mem]=37656 [k_time]=6.17 [k_mem]=1.86 [est_time]=11480 [est_mem]=69906)
([test]=xsb [nodes]=500 [elapsed]=14156 [user]=14.07 [system]=0.06 [cpu]=99% [mem]=111040 [k_time]=7.60 [k_mem]=2.95 [est_time]=107622 [est_mem]=327435)
TC test of xsb finished because 107622 ms > 60000 ms.

Starting TC test of souffle
([test]=souffle [nodes]=125 [elapsed]=443 [user]=0.42 [system]=0.00 [cpu]=99% [mem]=6796 [k_time]=4.00 [k_mem]=4.00 [est_time]=1772 [est_mem]=27184)
([test]=souffle [nodes]=250 [elapsed]=3390 [user]=3.32 [system]=0.00 [cpu]=99% [mem]=8412 [k_time]=7.65 [k_mem]=1.24 [est_time]=25942 [est_mem]=10412)
([test]=souffle [nodes]=500 [elapsed]=27620 [user]=27.33 [system]=0.01 [cpu]=99% [mem]=15048 [k_time]=8.15 [k_mem]=1.79 [est_time]=225034 [est_mem]=26919)
TC test of souffle finished because 225034 ms > 60000 ms.

Starting TC test of souffle_compiled_prog
([test]=souffle_compiled_prog [nodes]=125 [elapsed]=4696 [user]=4.56 [system]=0.16 [cpu]=100% [mem]=361984 [k_time]=4.00 [k_mem]=4.00 [est_time]=18784 [est_mem]=1447936)
([test]=souffle_compiled_prog [nodes]=250 [elapsed]=5463 [user]=5.34 [system]=0.16 [cpu]=100% [mem]=362192 [k_time]=1.16 [k_mem]=1.00 [est_time]=6355 [est_mem]=362400)
([test]=souffle_compiled_prog [nodes]=500 [elapsed]=6267 [user]=6.12 [system]=0.18 [cpu]=100% [mem]=362132 [k_time]=1.15 [k_mem]=1.00 [est_time]=7189 [est_mem]=362072)
([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=14568 [user]=14.41 [system]=0.18 [cpu]=100% [mem]=362200 [k_time]=2.32 [k_mem]=1.00 [est_time]=33864 [est_mem]=362268)
([test]=souffle_compiled_prog [nodes]=2000 [elapsed]=77615 [user]=77.44 [system]=0.18 [cpu]=100% [mem]=362212 [k_time]=5.33 [k_mem]=1.00 [est_time]=413515 [est_mem]=362224)
TC test of souffle_compiled_prog finished because 413515 ms > 60000 ms.

Starting TC test of souffle_compiled
([test]=souffle_compiled [nodes]=125 [elapsed]=4715 [user]=4.60 [system]=0.15 [cpu]=100% [mem]=366656 [k_time]=4.00 [k_mem]=4.00 [est_time]=18860 [est_mem]=1466624)
([test]=souffle_compiled [nodes]=250 [elapsed]=5166 [user]=5.04 [system]=0.16 [cpu]=100% [mem]=376716 [k_time]=1.10 [k_mem]=1.03 [est_time]=5660 [est_mem]=387052)
([test]=souffle_compiled [nodes]=500 [elapsed]=6728 [user]=6.60 [system]=0.17 [cpu]=100% [mem]=393876 [k_time]=1.30 [k_mem]=1.05 [est_time]=8762 [est_mem]=411818)
([test]=souffle_compiled [nodes]=1000 [elapsed]=16421 [user]=16.24 [system]=0.23 [cpu]=100% [mem]=428900 [k_time]=2.44 [k_mem]=1.09 [est_time]=40079 [est_mem]=467038)
([test]=souffle_compiled [nodes]=2000 [elapsed]=70229 [user]=69.98 [system]=0.27 [cpu]=100% [mem]=481292 [k_time]=4.28 [k_mem]=1.12 [est_time]=300354 [est_mem]=540084)
TC test of souffle_compiled finished because 300354 ms > 60000 ms.

```


