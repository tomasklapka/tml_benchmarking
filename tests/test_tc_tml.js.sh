#!/bin/bash

./tcgen tml $1 > ./tmp/$1.tml
./benchmark.sh tml.js < ./tmp/$1.tml > ./tmp/$1.result.tml
rm ./tmp/$1.tml ./tmp/$1.result.tml
