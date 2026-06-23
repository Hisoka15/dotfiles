#!/bin/bash

set -e

THEME_NAME="ashita-no-joe"
THEME_DIR="/usr/share/plymouth/themes/${THEME_NAME}"

echo "==> Instalando Plymouth..."
sudo pacman -S --needed plymouth

echo "==> Copiando tema..."
sudo mkdir -p "$THEME_DIR"
sudo cp -r ./${THEME_NAME}/* "$THEME_DIR/"

echo "==> Activando tema..."
sudo plymouth-set-default-theme -R "$THEME_NAME"

echo "==> Configurando mkinitcpio..."
sudo sed -i 's/^HOOKS=(/HOOKS=(plymouth /' /etc/mkinitcpio.conf

echo "==> Configurando kernel cmdline..."

if [ -f /etc/kernel/cmdline ]; then
    if ! grep -q "quiet" /etc/kernel/cmdline; then
        echo "quiet splash loglevel=3" | sudo tee -a /etc/kernel/cmdline
    fi
fi

echo "==> Regenerando initramfs..."
sudo mkinitcpio -P

echo "====================================="
echo " Plymouth configurado correctamente"
echo " Tema: $THEME_NAME"
echo "====================================="
