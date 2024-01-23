#!/bin/bash

volume_change=$1  # positive to increase, negative to decrease
max_volume=150
refresh_i3status=""  # Replace with the actual command to refresh i3status
SINK=0
current_volume_pc=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
candidate_volume=$((current_volume_pc + volume_change))
echo $current_volume_pc
if ((candidate_volume <= max_volume)) && ((candidate_volume >= 0)); then
    pactl set-sink-volume @DEFAULT_SINK@ $candidate_volume% && $refresh_i3status
elif ((candidate_volume > max_volume)); then
    pactl set-sink-volume @DEFAULT_SINK@ $max_volume% && $refresh_i3status
elif ((candidate_volume < 0)); then
    pactl set-sink-volume @DEFAULT_SINK@ 0% && $refresh_i3status
fi
