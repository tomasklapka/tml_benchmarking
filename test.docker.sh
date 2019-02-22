#!/bin/bash

if [ ! -f ./souffle_1.5.1-1_amd64.deb ]; then
    wget https://github.com/souffle-lang/souffle/releases/download/1.5.1/souffle_1.5.1-1_amd64.deb;
fi
if [ ! -f ./XSB.tar.gz ]; then
    wget http://xsb.sourceforge.net/downloads/XSB.tar.gz;
fi

docker build --tag tml_benchmarking:latest .

docker run -ti --rm -v $(pwd)/tests:/home/tests tml_benchmarking $@
