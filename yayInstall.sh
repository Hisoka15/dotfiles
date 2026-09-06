#!/bin/bash

set -e

echo "================================="
echo " Instalando yay y Pywal16"
echo "================================="

echo "==> Instalando dependencias para yay"
sudo pacman -S --needed --noconfirm base-devel git

if command -v yay &> /dev/null; then
    echo "==> yay ya está instalado"
else
    echo "==> Descargando yay"

    TEMP_DIR="$(mktemp -d)"

    git clone https://aur.archlinux.org/yay.git "$TEMP_DIR/yay"

    cd "$TEMP_DIR/yay"

    echo "==> Compilando e instalando yay"
    makepkg -si --noconfirm

    cd "$HOME"

    rm -rf "$TEMP_DIR"
fi

echo "==> Instalando Pywal16"
yay -S --needed --noconfirm python-pywal16

echo "==> Generando colores con Pywal"

if [ -f "$HOME/Pictures/walls/shizuku.png" ]; then
    wal -i "$HOME/Pictures/walls/shizuku.png"
elif [ -f "$HOME/Pictures/walls/cowboy.jpg" ]; then
    wal -i "$HOME/Pictures/walls/cowboy.jpg"
else
    echo "No se encontró shizuku.png ni cowboy.jpg"
    exit 1
fi

echo ""
echo "================================="
echo " yay y Pywal16 instalados"
echo " Colores generados correctamente"
echo "================================="
