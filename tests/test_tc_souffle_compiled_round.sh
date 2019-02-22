#!/bin/sh

souffle -ocomp.souffle$1 $1.comp.souffle
./comp.souffle$1 > $1.result.comp.souffle