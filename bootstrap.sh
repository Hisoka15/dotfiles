#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Actualizando sistema"
sudo pacman -Syu --noconfirm

echo "==> Instalando paquetes base"
"$SCRIPT_DIR/packages.sh"

echo "==> Configurando Plymouth"
"$SCRIPT_DIR/plymouth/setup-plymouth.sh"

echo "==> Instalando dotfiles"
"$SCRIPT_DIR/install.sh"

echo "================================="
echo "Setup completo terminado"
echo "Reinicia el sistema"
echo "================================="
