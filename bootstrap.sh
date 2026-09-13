#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Actualizando sistema"
sudo pacman -Syu --noconfirm

echo "==> Instalando paquetes base"
"$SCRIPT_DIR/packages.sh"

echo "==> Preparando wallpapers"
mkdir -p "$HOME/Pictures/walls"
cp -r "$SCRIPT_DIR/walls/." "$HOME/Pictures/walls/"

echo "==> Instalando yay y Pywal16"
"$SCRIPT_DIR/yayInstall.sh"

echo "==> Configurando Plymouth"
"$SCRIPT_DIR/plymouth/setup-plymouth.sh"

echo "==> Instalando dotfiles"
"$SCRIPT_DIR/install.sh"

echo "==> Configurando inicio automático de Hyprland"

if ! grep -q 'exec Hyprland' "$HOME/.bash_profile" 2>/dev/null; then
    cat >> "$HOME/.bash_profile" <<'EOF'

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
    exec Hyprland
fi
EOF
fi

echo "================================="
echo "Setup completo terminado"
echo "Reinicia el sistema"
echo "================================="
