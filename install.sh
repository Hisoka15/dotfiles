#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Instalando dotfiles..."

mkdir -p ~/.config

cp -r "$SCRIPT_DIR/.config/." ~/.config/

if [ -d "$SCRIPT_DIR/walls" ]; then
    mkdir -p ~/Pictures
    cp -r "$SCRIPT_DIR/walls" ~/Pictures/
fi

echo "Dotfiles instalados correctamente."
