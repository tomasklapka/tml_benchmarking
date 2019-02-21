#!/bin/sh

souffle -otc.souffle.compiled tc.souffle
./tc.souffle.compiled -F. -D.