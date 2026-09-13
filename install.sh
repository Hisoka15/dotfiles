#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Instalando dotfiles..."

mkdir -p ~/.config

cp -r "$SCRIPT_DIR/.config/." ~/.config/

echo "Dotfiles instalados correctamente."
