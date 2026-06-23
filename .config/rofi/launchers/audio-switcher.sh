#!/usr/bin/env bash

dir="$HOME/.config/rofi/styles"
theme='color'

# =========================
# GET AUDIO DEVICES
# =========================
get_sinks() {
    pactl list sinks | awk '
    /^Sink #/ {
        id=$2
    }

    /Name:/ {
        name=$2
    }

    /Description:/ {
        desc=substr($0, index($0,$2))
        gsub(/^ +/, "", desc)

        print desc ";;" name
    }'
}

# =========================
# ROFI MENU
# =========================
menu=$(get_sinks | cut -d';' -f1)

chosen=$(echo "$menu" | rofi -dmenu -i \
    -p "󰓃 Audio Output" \
    -theme "${dir}/${theme}.rasi")

[ -z "$chosen" ] && exit 0

# =========================
# GET REAL SINK NAME
# =========================
sink_name=$(get_sinks | grep "^$chosen" | awk -F ';;' '{print $2}')

if [ -z "$sink_name" ]; then
    notify-send "Audio" "Sink not found"
    exit 1
fi

# =========================
# SET DEFAULT SINK
# =========================
pactl set-default-sink "$sink_name"

# =========================
# MOVE ALL ACTIVE STREAMS
# =========================
for input in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$input" "$sink_name"
done

# =========================
# NOTIFICATION
# =========================
notify-send "󰓃 Audio Switched" "$chosen"