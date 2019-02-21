#!/bin/sh

./tcgen xsb $1 > xsb$1.P
./benchmark.sh xsb --nobanner --noprompt --quietload -e "consult(xsb$1)." > $1.result.xsb
rm xsb$1.P xsb$1.xwam $1.result.xsb
