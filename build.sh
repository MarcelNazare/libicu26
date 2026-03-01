#!/bin/bash

# Check if a filename was provided
if [ -z "$1" ]; then
    echo "Usage: $0 filename.c"
    exit 1
fi

filename="$1"
outputname="${filename%.c}"

# Compile with icu26.c
gcc "$filename" icu26.c -o "$outputname"