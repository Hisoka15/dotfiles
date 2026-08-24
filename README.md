# Dotfiles - Hyprland Setup

Configuración personal de Arch Linux con Hyprland, incluyendo entorno gráfico, herramientas de desarrollo, Plymouth, wallpapers y scripts personalizados.

Personal Arch Linux configuration with Hyprland, including desktop environment, development tools, Plymouth, wallpapers, and custom scripts.

---

# 🇪🇸 Español

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
```

### 2. Dar permisos a los scripts

```bash
chmod -R +x .
```

### 3. Instalación automática (RECOMENDADO)

Ejecuta el script principal:

```bash
./bootstrap.sh
```

El `bootstrap.sh` se encarga de ejecutar todos los scripts necesarios en el orden correcto:

1. Actualizar el sistema.
2. Instalar los paquetes base.
3. Configurar Plymouth.
4. Instalar los dotfiles.

El proceso instalará y configurará:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* Fastfetch
* Neovim
* Plymouth
* NetworkManager
* PipeWire / WirePlumber
* Pavucontrol
* Hyprlock
* Hyprshot
* SwayNC
* Swww
* Fuentes Noto
* JetBrains Mono Nerd Font
* Wallpapers
* Configuraciones personalizadas

---

## ⚙️ Instalación por módulos

Si prefieres instalar cada componente manualmente:

### Paquetes base

```bash
./packages.sh
```

### Dotfiles

```bash
./install.sh
```

Las configuraciones se copiarán a:

```text
~/.config/
```

Los wallpapers se copiarán a:

```text
~/Pictures/walls/
```

### Plymouth

```bash
./plymouth/setup-plymouth.sh
```

---

## 🔤 Fuentes

El setup utiliza:

```text
noto-fonts
noto-fonts-cjk
noto-fonts-emoji
ttf-jetbrains-mono-nerd
```

Puedes instalarlas manualmente con:

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd
```

---

## 🌤️ Clima de Waybar

El script del clima se encuentra en:

```text
dotfiles/.config/waybar/scripts/clock-weather.sh
```

Este script viene configurado con **mi ubicación**.

### ⚠️ Importante

La ubicación **no se detecta automáticamente**.

Si utilizas estos dotfiles en otra ciudad o país, debes editar:

```text
~/.config/waybar/scripts/clock-weather.sh
```

y cambiar la ubicación configurada dentro del script.

De lo contrario, Waybar continuará mostrando el clima de la ubicación configurada originalmente.

---

## 🔊 Script del parlante

El script:

```text
left-speaker.sh
```

se encuentra en:

```text
dotfiles/.config/scripts/left-speaker.sh
```

Este script fue creado específicamente para solucionar un problema con el **parlante derecho** de mi hardware.

El script se ejecuta automáticamente desde:

```text
autostart.lua
```

### ⚠️ Importante

Si **NO tienes el parlante derecho dañado**, no necesitas este script.

Después de instalar los dotfiles, debes **eliminar o comentar la ejecución de `left-speaker.sh` en `autostart.lua`**.

De lo contrario, el script puede modificar innecesariamente la configuración de audio de tu sistema.

Este script es específico para mi hardware y **no es necesario para una instalación normal de Hyprland**.

---

## 📁 Estructura del repositorio

```text
dotfiles/
├── bootstrap.sh
├── install.sh
├── packages.sh
├── plymouth/
│   ├── ashita-no-joe/
│   └── setup-plymouth.sh
├── .config/
│   ├── hypr/
│   ├── waybar/
│   │   └── scripts/
│   │       └── clock-weather.sh
│   ├── scripts/
│   │   └── left-speaker.sh
│   ├── rofi/
│   ├── kitty/
│   ├── fastfetch/
│   └── wal/
├── walls/
└── README.md
```

---

## 🧠 Filosofía

* Instalación modular y fácil de mantener.
* Separación entre sistema, entorno gráfico y temas.
* Configuración reproducible en Arch Linux.
* Inspirado en setups tipo Caelestia / unixporn.

---

## 🔄 Reinstalación rápida

En una instalación nueva de Arch:

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Reinicia el sistema después de finalizar la instalación.

---

## ⚠️ Notas

* Este setup está diseñado para Arch Linux.
* Requiere conexión a internet durante la instalación.
* Puede requerir ajustes dependiendo del hardware.
* No incluye paquetes ni drivers específicos de NVIDIA.
* `left-speaker.sh` es específico para solucionar un problema de hardware relacionado con el parlante derecho.
* Si tu parlante derecho funciona correctamente, elimina o comenta su ejecución en `autostart.lua`.
* `clock-weather.sh` contiene una ubicación configurada manualmente y debe modificarse para utilizar otra ubicación.
* Revisa las configuraciones específicas de hardware antes de utilizar estos dotfiles.

---

## 🎯 Objetivo

Tener un sistema completamente funcional con Hyprland en pocos minutos después de instalar Arch.

---

# 🇺🇸 English

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
```

### 2. Give execution permissions to the scripts

```bash
chmod -R +x .
```

### 3. Automatic installation (RECOMMENDED)

Run the main script:

```bash
./bootstrap.sh
```

The `bootstrap.sh` script runs all the required scripts in the correct order:

1. Update the system.
2. Install the base packages.
3. Configure Plymouth.
4. Install the dotfiles.

The setup will install and configure:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* Fastfetch
* Neovim
* Plymouth
* NetworkManager
* PipeWire / WirePlumber
* Pavucontrol
* Hyprlock
* Hyprshot
* SwayNC
* Swww
* Noto Fonts
* JetBrains Mono Nerd Font
* Wallpapers
* Custom configurations

---

## ⚙️ Manual installation

If you prefer to install each component separately:

### Base packages

```bash
./packages.sh
```

### Dotfiles

```bash
./install.sh
```

The configuration files will be copied to:

```text
~/.config/
```

The wallpapers will be copied to:

```text
~/Pictures/walls/
```

### Plymouth

```bash
./plymouth/setup-plymouth.sh
```

---

## 🔤 Fonts

This setup uses:

```text
noto-fonts
noto-fonts-cjk
noto-fonts-emoji
ttf-jetbrains-mono-nerd
```

You can install them manually with:

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd
```

---

## 🌤️ Waybar Weather

The weather script is located at:

```text
dotfiles/.config/waybar/scripts/clock-weather.sh
```

This script is configured with **my location**.

### ⚠️ Important

The location is **not detected automatically**.

If you use these dotfiles in another city or country, you must edit:

```text
~/.config/waybar/scripts/clock-weather.sh
```

and change the location configured inside the script.

Otherwise, Waybar will continue showing the weather for the originally configured location.

---

## 🔊 Speaker Script

The script:

```text
left-speaker.sh
```

is located at:

```text
dotfiles/.config/scripts/left-speaker.sh
```

This script was created specifically to solve a problem with the **right speaker** on my hardware.

The script is automatically executed from:

```text
autostart.lua
```

### ⚠️ Important

If your **right speaker is NOT damaged**, you do not need this script.

After installing the dotfiles, you should **remove or comment out the `left-speaker.sh` execution in `autostart.lua`**.

Otherwise, the script may unnecessarily modify your system's audio configuration.

This script is specific to my hardware and **is not required for a normal Hyprland installation**.

---

## 📁 Repository Structure

```text
dotfiles/
├── bootstrap.sh
├── install.sh
├── packages.sh
├── plymouth/
│   ├── ashita-no-joe/
│   └── setup-plymouth.sh
├── .config/
│   ├── hypr/
│   ├── waybar/
│   │   └── scripts/
│   │       └── clock-weather.sh
│   ├── scripts/
│   │   └── left-speaker.sh
│   ├── rofi/
│   ├── kitty/
│   ├── fastfetch/
│   └── wal/
├── walls/
└── README.md
```

---

## 🧠 Philosophy

* Modular and easy-to-maintain installation.
* Separation between system, desktop environment, and themes.
* Reproducible configuration for Arch Linux.
* Inspired by setups such as Caelestia / unixporn.

---

## 🔄 Quick Reinstallation

On a fresh Arch Linux installation:

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Reboot the system after the installation is complete.

---

## ⚠️ Notes

* This setup is designed for Arch Linux.
* An active internet connection is required during installation.
* Hardware-specific adjustments may be required.
* This setup does not include NVIDIA-specific packages or drivers.
* `left-speaker.sh` is a hardware-specific script for solving a problem related to the right speaker.
* If your right speaker works correctly, remove or comment out its execution in `autostart.lua`.
* `clock-weather.sh` contains a manually configured location and must be changed if you are using another location.
* Review the hardware-specific configurations before using these dotfiles.

---

## 🎯 Goal

Have a fully functional Hyprland system running within a few minutes after installing Arch Linux.
