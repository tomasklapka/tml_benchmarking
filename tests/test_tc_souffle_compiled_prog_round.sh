#!/bin/bash

souffle -o./tmp/tc.souffle.compiled tc.souffle
./tmp/tc.souffle.compiled -F./tmp/ -D./tmp/
