#!/bin/bash

set -e

echo "==> Actualizando sistema"
sudo pacman -Syu --noconfirm

echo "==> Instalando paquetes base"
./packages.sh

echo "==> Configurando Plymouth"
./plymouth/setup-plymouth.sh

echo "==> Instalando dotfiles"
./install.sh

echo "================================="
echo "Setup completo terminado"
echo "Reinicia el sistema"
echo "================================="
