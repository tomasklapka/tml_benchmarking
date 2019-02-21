#!/bin/sh

./tcgen tml $1 > $1.tml
./benchmark.sh tml < $1.tml > $1.result.tml
rm $1.tml $1.result.tml
