#!/usr/bin/env bash

dir="$HOME/.config/rofi/styles"
theme='color'

# =========================
# WIFI INTERFACE
# =========================
wifi_interface=$(nmcli device status | awk '/wifi/ {print $1; exit}')

# =========================
# RESCAN WIFI
# =========================
nmcli device wifi rescan >/dev/null 2>&1
sleep 1

# =========================
# WIFI STATUS
# =========================
if nmcli radio wifi | grep -q "enabled"; then
    toggle="󰖪  Disable Wi-Fi"
else
    toggle="󰖩  Enable Wi-Fi"
fi

# =========================
# GET WIFI LIST
# =========================
wifi_list=$(
nmcli -t -f ACTIVE,SECURITY,SSID,SIGNAL device wifi list | awk -F: '
!seen[$3]++ {

    icon=""

    if ($2 ~ /WPA|WEP/) {
        icon=""
    }

    active=""

    if ($1 == "yes") {
        active="󰄬 "
    }

    print active icon "  " $3 "  [" $4 "%]"
}'
)

# =========================
# ROFI MENU
# =========================
chosen=$(echo -e "$toggle\n$wifi_list" | rofi \
    -dmenu \
    -i \
    -p "󰖩 Wi-Fi" \
    -theme "${dir}/${theme}.rasi")

[ -z "$chosen" ] && exit 0

# =========================
# TOGGLE WIFI
# =========================
if [[ "$chosen" == "$toggle" ]]; then

    if [[ "$toggle" == *"Disable"* ]]; then
        nmcli radio wifi off
        notify-send "Wi-Fi" "Wi-Fi Disabled"
    else
        nmcli radio wifi on
        notify-send "Wi-Fi" "Wi-Fi Enabled"
    fi

    exit 0
fi

# =========================
# CLEAN SSID
# =========================
ssid=$(echo "$chosen" \
    | sed 's/󰄬 //g' \
    | sed 's/  //g' \
    | sed 's/  //g' \
    | sed 's/  \[[0-9]*%\]//g' \
    | xargs)

[ -z "$ssid" ] && exit 1

# =========================
# DISCONNECT OLD NETWORK
# =========================
nmcli device disconnect "$wifi_interface" >/dev/null 2>&1
sleep 1

# =========================
# CHECK SAVED CONNECTION
# =========================
saved_conn=$(nmcli -g NAME connection | grep -Fx "$ssid")

if [ -n "$saved_conn" ]; then

    if nmcli connection up id "$ssid" >/dev/null 2>&1; then
        notify-send "󰖩 Connected" "$ssid"
        exit 0
    fi

fi

# =========================
# CONNECT TO WIFI
# =========================
if [[ "$chosen" =~ "" ]]; then

    password=$(rofi \
        -dmenu \
        -password \
        -p "󰌾 Password" \
        -theme "${dir}/${theme}.rasi")

    [ -z "$password" ] && exit 1

    if nmcli device wifi connect "$ssid" password "$password"; then
        notify-send "󰖩 Connected" "$ssid"
    else
        notify-send "󰖪 Failed" "Wrong password / connection failed"
    fi

else

    if nmcli device wifi connect "$ssid"; then
        notify-send "󰖩 Connected" "$ssid"
    else
        notify-send "󰖪 Failed" "Connection failed"
    fi

fi