#!/bin/bash

hostname=$1
largest_ping=0

# Execute the ping command and capture the output
ping_output=$(ping -c 20 -s 1000 "$hostname" | awk -F"time=" '{sub(/ ms$/, "", $2); print $2}')

# Loop through each ping response time
for time in $ping_output
do
    # Use awk to compare values and find the largest
    if (( $(awk -v time="$time" -v largest_ping="$largest_ping" 'BEGIN { print (time > largest_ping) }') ))
    then
        largest_ping="$time"
    fi
done

# Output the largest ping response time
echo $largest_ping
