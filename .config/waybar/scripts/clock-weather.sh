#!/bin/bash

# =========================================
# CLOCK + WEATHER - CHINANDEGA
# Open-Meteo + Nerd Font Icons
# =========================================

LAT="12.6294"
LON="-87.1311"

# =========================================
# OBTENER DATOS DEL CLIMA
# =========================================

weather_data=$(curl -4 -s --max-time 10 \
    "https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&current=temperature_2m,weather_code&timezone=America%2FManagua")

# =========================================
# EXTRAER DATOS
# =========================================

temperature=$(echo "$weather_data" | sed -n 's/.*"temperature_2m":\([0-9.-]*\).*/\1/p')
weather_code=$(echo "$weather_data" | sed -n 's/.*"weather_code":\([0-9]*\).*/\1/p')

# =========================================
# FECHA Y HORA
# =========================================

date=$(date "+%a %d %b %I:%M %p")

# =========================================
# ICONOS NERD FONT
# =========================================

case "$weather_code" in

    # Despejado
    0)
        weather_icon="󰖙"
        ;;

    # Mayormente despejado
    1)
        weather_icon="󰖕"
        ;;

    # Parcialmente nublado
    2)
        weather_icon="󰖕"
        ;;

    # Nublado
    3)
        weather_icon="󰖐"
        ;;

    # Niebla
    45|48)
        weather_icon="󰖑"
        ;;

    # Llovizna
    51|53|55|56|57)
        weather_icon="󰖗"
        ;;

    # Lluvia
    61|63|65|66|67)
        weather_icon="󰖖"
        ;;

    # Chubascos
    80|81|82)
        weather_icon="󰖖"
        ;;

    # Tormenta
    95|96|99)
        weather_icon="󰖓"
        ;;

    # Cualquier código no contemplado
    *)
        weather_icon="󰖐"
        ;;

esac

# =========================================
# FALLBACK
# =========================================

if [ -z "$temperature" ] || [ -z "$weather_code" ]; then
    echo "󰖐 --°C    $date"
    exit 0
fi

# =========================================
# SALIDA
# =========================================

echo "$weather_icon ${temperature}°C    $date"
