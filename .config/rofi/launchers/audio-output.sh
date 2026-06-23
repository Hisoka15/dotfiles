#!/usr/bin/env bash

dir="$HOME/.config/rofi/styles"
theme='color'

# =========================
# GET MICROPHONE DEVICES
# =========================
get_sources() {
    pactl list sources | awk '
    /^Source #/ {
        id=$2
    }

    /Name:/ {
        name=$2
    }

    /Description:/ {
        desc=substr($0, index($0,$2))
        gsub(/^ +/, "", desc)

        # skip monitor devices
        if (name !~ /\.monitor$/) {
            print desc ";;" name
        }
    }'
}

# =========================
# ROFI MENU
# =========================
menu=$(get_sources | cut -d';' -f1)

chosen=$(echo "$menu" | rofi \
    -dmenu \
    -i \
    -p "󰍬 Microphone" \
    -theme "${dir}/${theme}.rasi")

[ -z "$chosen" ] && exit 0

# =========================
# GET REAL SOURCE NAME
# =========================
source_name=$(get_sources | grep "^$chosen" | awk -F ';;' '{print $2}')

if [ -z "$source_name" ]; then
    notify-send "󰍬 Microphone" "Source not found"
    exit 1
fi

# =========================
# SET DEFAULT MIC
# =========================
pactl set-default-source "$source_name"

# =========================
# MOVE ACTIVE RECORDING STREAMS
# =========================
for input in $(pactl list short source-outputs | awk '{print $1}'); do
    pactl move-source-output "$input" "$source_name" 2>/dev/null
done

# =========================
# NOTIFICATION
# =========================
notify-send "󰍬 Microphone Changed" "$chosen"