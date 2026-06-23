#!/usr/bin/env bash

STATE_FILE="/tmp/hypr-floating-layout.json"

WS=$(hyprctl activeworkspace -j | jq '.id')

FLOATING=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $WS and .floating == true)] | length")

# ==========================================
# FLOATING -> TILED
# ==========================================
if [ "$FLOATING" -gt 0 ]; then

    # Save posisi & ukuran
    hyprctl clients -j | jq "[.[] | select(.workspace.id == $WS) | {
        address,
        at,
        size
    }]" > "$STATE_FILE"

    # Balikin tiled
    for w in $(hyprctl clients -j | jq ".[] | select(.workspace.id == $WS) | .address" -r); do
        hyprctl dispatch settiled address:$w
    done

# ==========================================
# TILED -> FLOATING
# ==========================================
else

    if [ -f "$STATE_FILE" ]; then

        cat "$STATE_FILE" | jq -c '.[]' | while read -r win; do

            ADDR=$(echo "$win" | jq -r '.address')

            X=$(echo "$win" | jq -r '.at[0]')
            Y=$(echo "$win" | jq -r '.at[1]')

            W=$(echo "$win" | jq -r '.size[0]')
            H=$(echo "$win" | jq -r '.size[1]')

            # Floating dulu
            hyprctl dispatch setfloating address:$ADDR >/dev/null 2>&1

            # Delay kecil biar animasi tetep smooth
            sleep 0.02

            # Restore posisi & ukuran
            hyprctl --batch "\
dispatch movewindowpixel exact $X $Y,address:$ADDR;\
dispatch resizewindowpixel exact $W $H,address:$ADDR" >/dev/null 2>&1

        done

    else

        for w in $(hyprctl clients -j | jq ".[] | select(.workspace.id == $WS) | .address" -r); do
            hyprctl dispatch setfloating address:$w
        done

    fi

fi