#!/bin/sh

/usr/bin/time -f "[user]=%U [system]=%S [cpu]=%P [mem]=%M" "$@"
