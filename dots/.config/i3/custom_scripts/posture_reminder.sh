#!/bin/bash

min_sleep_mins=$1
max_sleep_mins=$2

min_sleep_secs=$((min_sleep_mins * 60))
max_sleep_secs=$((max_sleep_mins * 60))

while true; do
    if [ $max_sleep_secs -ge $min_sleep_secs ]; then
        [ $max_sleep_secs -eq $min_sleep_secs ] && sleep_duration=$min_sleep_secs || sleep_duration=$(( (RANDOM % (max_sleep_secs - min_sleep_secs)) + min_sleep_secs ))
        notify-send "Body Awareness" "Shoulders above hips, ears above shoulders"
        sleep $sleep_duration
    else
        echo "Error: max_sleep_secs should be greater than or equal to min_sleep_secs"
        exit 1
    fi
done
