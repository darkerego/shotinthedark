#!/bin/sh
echo "Start!"
for p in $(cat owrts)
do
    ./expect-o "${p}"
done
