Benchmarking of [TML](https://github.com/IDNI/tau), [Soufflé](http://souffle-lang.org/) and [XSB](http://xsb.sourceforge.net/).

### Usage:

1. install TML, Soufflé and XSB (executables must be in $PATH dirs) or install docker
2. run `./test.sh` or run `./test.docker.sh`

Default time limit for a test round is 5 minutes. Test tries to estimate time and mem consumption for the next round and finishes when the estimate is over the limit. Both test.sh and test.docker.sh accept another limit time in seconds as a parameter: `./test.sh 60`

You can change the list and order of the tests by using `$TESTS` environment variable: `TESTS="souffle xsb tml" ./test.sh`.

By default tests use inner TC algorithm. You can alternatively choose left or right TC algorithm by using `$ALT` environment with value: `.left` or `.right`. Example: `ALT=".left" ./test.sh`.

Available tests are:

* **tml**
* **tml.js** - node.js implementation
* **xsb**
* **souffle** - interpreted
* **souffle_compiled_prog** - compiled TC program, data on input
* **souffle_compiled** - compiled TC program with data, no input

Docker tests are slightly slower and Soufflé the most.
