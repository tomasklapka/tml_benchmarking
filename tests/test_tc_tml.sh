#!/bin/bash

./tcgen tml$ALT $1 > ./tmp/$1.tml
./benchmark.sh tml --error @null --info @null < ./tmp/$1.tml > ./tmp/$1.result.tml
rm ./tmp/$1.tml ./tmp/$1.result.tml
