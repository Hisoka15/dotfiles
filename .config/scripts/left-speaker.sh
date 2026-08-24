#!/bin/bash

for i in {1..20}; do
    if pactl list short sinks | grep -q 'alsa_output.pci-0000_00_1f.3.analog-stereo'; then
        break
    fi
    sleep 1
done

pactl load-module module-remap-sink \
    sink_name=left_only \
    master=alsa_output.pci-0000_00_1f.3.analog-stereo \
    channels=1 \
    master_channel_map=front-left \
    channel_map=mono

pactl set-default-sink left_only
