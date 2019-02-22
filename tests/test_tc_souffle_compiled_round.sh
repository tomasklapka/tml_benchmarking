#!/bin/sh

souffle -o./tmp/comp.souffle$1 ./tmp/$1.comp.souffle
./tmp/comp.souffle$1 > ./tmp/$1.result.comp.souffle
