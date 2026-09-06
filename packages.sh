#!/bin/bash

set -e

echo "================================="
echo "Instalando paquetes de Arch Linux"
echo "================================="

sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    nano \
    vim \
    neovim \
    curl \
    wget \
    unzip \
    zip \
    tar \
    gzip \
    bzip2 \
    xz \
    p7zip \
    rsync \
    tree \
    file \
    which \
    less \
    man-db \
    man-pages \
    texinfo \
    bash-completion \
    openssh \
    htop \
    btop \
    fastfetch \
    hyprland \
    waybar \
    rofi \
    kitty \
    dunst \
    swaync \
    hyprlock \
    hyprshot \
    grim \
    slurp \
    wl-clipboard \
    pavucontrol \
    pipewire \
    pipewire-pulse \
    wireplumber \
    networkmanager \
    network-manager-applet \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    polkit-kde-agent \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    ttf-jetbrains-mono-nerd \
    jq \
    playerctl \
    brightnessctl \
    swww \
    plymouth

echo ""
echo "================================="
echo "Paquetes instalados correctamente"
echo "================================="
