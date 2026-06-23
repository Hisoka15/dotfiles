#!/bin/bash

set -e

echo "Instalando dotfiles..."

mkdir -p ~/.config

cp -r .config/* ~/.config/

if [ -d walls ]; then
    cp -r walls ~/
fi

echo "Dotfiles instalados correctamente."
