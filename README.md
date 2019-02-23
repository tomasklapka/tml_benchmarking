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
$ ./test.sh 60
Running TC tests for tml, souffle and xsb.
Limit test round time: 60000 ms, max mem taken: 16696172 kBs and max number of nodes: 8000

Starting TC test of tml
([test]=tml [nodes]=125 [elapsed]=115 [user]=0.08 [system]=0.01 [cpu]=100% [mem]=26104 [k_time]=4.00 [k_mem]=4.00 [est_time]=460 [est_mem]=104416)
([test]=tml [nodes]=250 [elapsed]=425 [user]=0.29 [system]=0.05 [cpu]=99% [mem]=84232 [k_time]=3.70 [k_mem]=3.23 [est_time]=1571 [est_mem]=271799)
([test]=tml [nodes]=500 [elapsed]=1584 [user]=1.06 [system]=0.24 [cpu]=99% [mem]=299688 [k_time]=3.73 [k_mem]=3.56 [est_time]=5904 [est_mem]=1066256)
([test]=tml [nodes]=1000 [elapsed]=6150 [user]=4.10 [system]=0.93 [cpu]=99% [mem]=1164820 [k_time]=3.88 [k_mem]=3.89 [est_time]=23878 [est_mem]=4527394)
([test]=tml [nodes]=2000 [elapsed]=25472 [user]=16.41 [system]=3.72 [cpu]=99% [mem]=4641600 [k_time]=4.14 [k_mem]=3.98 [est_time]=105500 [est_mem]=18495948)
TC test of tml finished because 105500 ms > 60000 ms, 18495948 kBs > 16696172 kBs.

Starting TC test of xsb
([test]=xsb [nodes]=125 [elapsed]=302 [user]=0.28 [system]=0.01 [cpu]=101% [mem]=20196 [k_time]=4.00 [k_mem]=4.00 [est_time]=1208 [est_mem]=80784)
([test]=xsb [nodes]=250 [elapsed]=1808 [user]=1.77 [system]=0.02 [cpu]=100% [mem]=37776 [k_time]=5.99 [k_mem]=1.87 [est_time]=10824 [est_mem]=70659)
([test]=xsb [nodes]=500 [elapsed]=14295 [user]=14.22 [system]=0.06 [cpu]=99% [mem]=111192 [k_time]=7.91 [k_mem]=2.94 [est_time]=113024 [est_mem]=327289)
TC test of xsb finished because 113024 ms > 60000 ms.

Starting TC test of souffle
([test]=souffle [nodes]=125 [elapsed]=433 [user]=0.41 [system]=0.00 [cpu]=99% [mem]=6884 [k_time]=4.00 [k_mem]=4.00 [est_time]=1732 [est_mem]=27536)
([test]=souffle [nodes]=250 [elapsed]=3351 [user]=3.29 [system]=0.00 [cpu]=99% [mem]=8348 [k_time]=7.74 [k_mem]=1.21 [est_time]=25933 [est_mem]=10123)
([test]=souffle [nodes]=500 [elapsed]=27577 [user]=27.36 [system]=0.00 [cpu]=99% [mem]=15024 [k_time]=8.23 [k_mem]=1.80 [est_time]=226944 [est_mem]=27039)
TC test of souffle finished because 226944 ms > 60000 ms.

Starting TC test of souffle_compiled_prog
([test]=souffle_compiled_prog [nodes]=125 [elapsed]=4525 [comp_elapsed]=4489 [comp_mem]=362432 [user]=4.38 [system]=0.19 [cpu]=101% [mem]=362432 [k_time]=4.00 [k_mem]=4.00 [est_time]=18100 [est_mem]=1449728)
([test]=souffle_compiled_prog [nodes]=250 [elapsed]=4713 [comp_elapsed]=4533 [comp_mem]=362016 [user]=4.58 [system]=0.17 [cpu]=101% [mem]=362016 [k_time]=1.04 [k_mem]=1.00 [est_time]=4909 [est_mem]=361600)
([test]=souffle_compiled_prog [nodes]=500 [elapsed]=5722 [comp_elapsed]=4494 [comp_mem]=362132 [user]=5.60 [system]=0.16 [cpu]=100% [mem]=362132 [k_time]=1.21 [k_mem]=1.00 [est_time]=6947 [est_mem]=362248)
([test]=souffle_compiled_prog [nodes]=1000 [elapsed]=13793 [comp_elapsed]=4521 [comp_mem]=362408 [user]=13.64 [system]=0.18 [cpu]=100% [mem]=362408 [k_time]=2.41 [k_mem]=1.00 [est_time]=33248 [est_mem]=362684)
([test]=souffle_compiled_prog [nodes]=2000 [elapsed]=76825 [comp_elapsed]=4502 [comp_mem]=362300 [user]=76.66 [system]=0.17 [cpu]=100% [mem]=362300 [k_time]=5.57 [k_mem]=1.00 [est_time]=427904 [est_mem]=362192)
TC test of souffle_compiled_prog finished because 427904 ms > 60000 ms.

Starting TC test of souffle_compiled
([test]=souffle_compiled [nodes]=125 [elapsed]=4665 [comp_elapsed]=4628 [comp_mem]=366604 [user]=4.50 [system]=0.20 [cpu]=101% [mem]=366604 [k_time]=4.00 [k_mem]=4.00 [est_time]=18660 [est_mem]=1466416)
([test]=souffle_compiled [nodes]=250 [elapsed]=5086 [comp_elapsed]=4906 [comp_mem]=376776 [user]=4.95 [system]=0.18 [cpu]=101% [mem]=376776 [k_time]=1.09 [k_mem]=1.03 [est_time]=5545 [est_mem]=387230)
([test]=souffle_compiled [nodes]=500 [elapsed]=6676 [comp_elapsed]=5440 [comp_mem]=393776 [user]=6.58 [system]=0.15 [cpu]=100% [mem]=393776 [k_time]=1.31 [k_mem]=1.05 [est_time]=8763 [est_mem]=411543)
([test]=souffle_compiled [nodes]=1000 [elapsed]=16241 [comp_elapsed]=6904 [comp_mem]=428836 [user]=16.07 [system]=0.23 [cpu]=100% [mem]=428836 [k_time]=2.43 [k_mem]=1.09 [est_time]=39510 [est_mem]=467018)
([test]=souffle_compiled [nodes]=2000 [elapsed]=68565 [comp_elapsed]=10706 [comp_mem]=481328 [user]=68.21 [system]=0.29 [cpu]=99% [mem]=481328 [k_time]=4.22 [k_mem]=1.12 [est_time]=289462 [est_mem]=540245)
TC test of souffle_compiled finished because 289462 ms > 60000 ms.


```


