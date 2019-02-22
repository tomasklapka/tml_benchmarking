#!/bin/bash

unset o r
s=`date +%s%3N`
eval "$( (/usr/bin/time -f '[user]=%U [system]=%S [cpu]=%P [mem]=%M' $@) \
		2> >(r=$(cat); typeset -p r) \
		 > >(o=$(cat); typeset -p o) )"
f=`date +%s%3N`
let "e=f-s"
(echo "$o">&1 && >&2 echo "[elapsed]=$e $r")

# stdout and stderr extract into variable through eval
# is taken from https://stackoverflow.com/a/18086548
