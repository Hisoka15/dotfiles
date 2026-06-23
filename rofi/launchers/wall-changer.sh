#!/bin/env bash

# --- Configuration ---
# Updated to your requested directory
WALLDIR="$HOME/Pictures/walls"

# Using your specific theme path
ROFI_THEME="$HOME/.config/rofi/styles/wall-picker.rasi"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/wallpaper-thumbs"
HYPRLOCK_CACHE="$HOME/.cache/hyprlock/wallpaper.png"
THUMB_SIZE="400x400"

# Ensure directories exist
mkdir -p "$CACHE_DIR"
mkdir -p "$(dirname "$HYPRLOCK_CACHE")"

# --- 1. Find Images ---
mapfile -t IMG_FILES < <(find "$WALLDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \))

if [ "${#IMG_FILES[@]}" -eq 0 ]; then
    notify-send "Rofi Wallpaper" "Error: No images found in $WALLDIR"
    exit 1
fi

# --- 2. Generate Thumbnails & Rofi Input ---
ROFI_INPUT=""
for IMG_FILE in "${IMG_FILES[@]}"; do
    BASENAME=$(basename "$IMG_FILE")
    
    # Create thumbnail if it doesn't exist
    THUMB_FILE="$CACHE_DIR/${BASENAME}.png"
    if [ ! -f "$THUMB_FILE" ]; then
        convert "$IMG_FILE" -auto-orient -thumbnail "${THUMB_SIZE}^" -gravity center -extent "$THUMB_SIZE" "$THUMB_FILE" 2>/dev/null
    fi
    
    # Build the string for Rofi
    ROFI_INPUT+="${BASENAME}\0icon\x1f${THUMB_FILE}\x1finfo\x1f${IMG_FILE}\n"
done

# --- 3. Show Rofi Menu ---
SELECTED_INDEX=$(echo -en "$ROFI_INPUT" | rofi -dmenu \
    -i \
    -show-icons \
    -theme "$ROFI_THEME" \
    -p "Choose wallpaper" \
    -format 'i' \
    -selected-row 0
)

# Exit if Escaped
[ -z "$SELECTED_INDEX" ] && exit 0

# Get the path of the selected file
WALLPAPER_PATH="${IMG_FILES[$SELECTED_INDEX]}"
SELECTED_NAME=$(basename "$WALLPAPER_PATH")

# --- 4. Apply (Migrated to the new 'awww' package) ---

# Pastikan awww-daemon jalan. Kalau belum, kita start daemon barunya
if ! pgrep -x "awww-daemon" > /dev/null; then
    # Bersihkan sisa socket lama biar gak bentrok
    rm -rf "${XDG_RUNTIME_DIR}/awww"* 2>/dev/null
    rm -rf "${XDG_RUNTIME_DIR}/swww"* 2>/dev/null
    awww-daemon &
    sleep 1.5 # Kasih jeda sedikit biar daemon-nya siap
fi

# Eksekusi ganti wallpaper pake command baru: awww img
if awww img "$WALLPAPER_PATH" --transition-type random; then
    
    # Bagian Matugen, Hyprlock cache, dan Notification
    cp "$WALLPAPER_PATH" "$HYPRLOCK_CACHE"
    matugen image "$WALLPAPER_PATH"
    
    # === [ TAMBAHAN BARU UNTUK PYWAL & RELOAD ] ===
    
    # 1. Generate warna FLAT pakai pywal (-q artinya quiet/silent)
    wal -i "$WALLPAPER_PATH" -q
    
    # 2. SUNTIK OTOMATIS KE FIREFOX (Biar gak perlu klik manual lagi!)
    pywalfox update
    
    # 2. Panggil script launch.sh lu buat restart Waybar & Swaync secara otomatis
    if [ -f "$HOME/.config/waybar/scripts/launch.sh" ]; then
        bash "$HOME/.config/waybar/scripts/launch.sh"
    fi
    
    # 3. Reload Hyprland biar config ter-refresh
    #hyprctl reload
    
    # ==============================================
    
    notify-send "Wallpaper Changed" "${SELECTED_NAME} applied successfully."
else
    # Jika gagal, tangkap error asli dari awww ke notifikasi biar ketauan rusaknya apa
    AWWW_ERR=$(awww img "$WALLPAPER_PATH" 2>&1)
    notify-send "Rofi Wallpaper" "Gagal (awww): $AWWW_ERR"
fi

exit 0
