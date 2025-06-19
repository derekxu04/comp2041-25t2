#!/bin/bash

# This program emulates the behaviour of the 'seq' command
# Prints error message and exits if given invalid arguments

if [ $# -eq 1 ]; then
    start=1
    step=1
    end="$1"
elif [ $# -eq 2 ]; then
    start="$1"
    step=1
    end="$2"
elif [ $# -eq 3 ]; then
    start="$1"
    step="$2"
    end="$3"
else
    echo "Usage: $0 [start] end [step]"
    exit 1
fi

i="$start"

while [ "$i" -le "$end" ]; do
    echo "$i"
    i=$((i+step))
done
