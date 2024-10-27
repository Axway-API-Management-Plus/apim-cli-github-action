#!/bin/sh -l

echo "$1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
