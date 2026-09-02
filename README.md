# Dotfiles - Hyprland Setup

Configuración personal de Arch Linux con Hyprland, incluyendo entorno gráfico, herramientas de desarrollo, Plymouth, wallpapers y scripts personalizados.

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

El `bootstrap.sh` es el punto de entrada principal y ejecuta los scripts necesarios en el orden correcto:

1. Actualiza el sistema.
2. Instala los paquetes base mediante `packages.sh`.
3. Configura Plymouth mediante `plymouth/setup-plymouth.sh`.
4. Instala los dotfiles mediante `install.sh`.

El proceso instala y configura:

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

## 🎨 Plymouth

El repositorio incluye un tema personalizado de Plymouth basado en **Ashita no Joe**.

El tema se encuentra en:

```text
plymouth/
├── ashita-no-joe/
└── setup-plymouth.sh
```

El script `setup-plymouth.sh` se encarga de:

1. Instalar Plymouth.
2. Copiar el tema personalizado.
3. Establecer `ashita-no-joe` como tema predeterminado.
4. Configurar el hook de Plymouth en `mkinitcpio`.
5. Desactivar el splash predeterminado de Arch incluido en el preset del kernel.
6. Configurar `quiet`, `splash` y `loglevel=3`.
7. Regenerar el initramfs.

El splash predeterminado de Arch se desactiva para evitar que el logo de Arch aparezca antes del tema personalizado.

---

## ⌨️ Atajos de teclado

Los atajos están definidos en:

```text
.config/hypr/lua/keybinds.lua
```

### Aplicaciones

| Atajo       | Acción                    |
| ----------- | ------------------------- |
| `SUPER + U` | Unity Hub                 |
| `SUPER + O` | OBS Studio                |
| `SUPER + C` | VSCodium                  |
| `SUPER + K` | Kdenlive                  |
| `SUPER + L` | Bloquear pantalla         |
| `SUPER + B` | Brave                     |
| `SUPER + D` | Discord                   |
| `SUPER + T` | Terminal                  |
| `SUPER + Q` | Cerrar ventana            |
| `SUPER + M` | Spotify                   |
| `SUPER + E` | Administrador de archivos |
| `SUPER + V` | Alternar ventana flotante |
| `SUPER + P` | Alternar pseudo-tile      |

### Lanzadores y utilidades

| Atajo               | Acción                                      |
| ------------------- | ------------------------------------------- |
| `Print`             | Captura de pantalla con selección de área   |
| `SUPER + SPACE`     | Abrir Rofi                                  |
| `SUPER + SHIFT + S` | Captura de región con Hyprshot              |
| `SUPER + SHIFT + W` | Ejecutar script de lanzamiento              |
| `SUPER + A`         | Alternar centro de notificaciones           |
| `SUPER + N`         | Alternar centro de notificaciones           |
| `SUPER + W`         | Cambiar wallpaper                           |
| `CTRL + M`          | Abrir menú de energía                       |
| `ALT + Tab`         | Cambiar entre ventanas                      |
| `ALT + V`           | Ejecutar Infinite Desktop                   |
| `SUPER + SHIFT + V` | Alternar ventanas flotantes mediante script |

### Gestión de ventanas

| Atajo                     | Acción                         |
| ------------------------- | ------------------------------ |
| `SUPER + ←`               | Enfocar ventana a la izquierda |
| `SUPER + →`               | Enfocar ventana a la derecha   |
| `SUPER + ↑`               | Enfocar ventana superior       |
| `SUPER + ↓`               | Enfocar ventana inferior       |
| `SUPER + SHIFT + ←`       | Mover ventana a la izquierda   |
| `SUPER + SHIFT + →`       | Mover ventana a la derecha     |
| `SUPER + SHIFT + ↑`       | Mover ventana hacia arriba     |
| `SUPER + SHIFT + ↓`       | Mover ventana hacia abajo      |
| `SUPER + ALT + ←`         | Reducir ancho de ventana       |
| `SUPER + ALT + →`         | Aumentar ancho de ventana      |
| `SUPER + ALT + ↑`         | Reducir altura de ventana      |
| `SUPER + ALT + ↓`         | Aumentar altura de ventana     |
| `SUPER + Click izquierdo` | Mover ventana                  |
| `SUPER + Click derecho`   | Redimensionar ventana          |

### Workspaces

| Atajo                 | Acción                                     |
| --------------------- | ------------------------------------------ |
| `SUPER + 1-9`         | Cambiar al workspace correspondiente       |
| `SUPER + 0`           | Cambiar al workspace 10                    |
| `SUPER + SHIFT + 1-9` | Mover ventana al workspace correspondiente |
| `SUPER + SHIFT + 0`   | Mover ventana al workspace 10              |
| `SUPER + S`           | Alternar el special workspace `magic`      |
| `SUPER + Mouse Down`  | Siguiente workspace                        |
| `SUPER + Mouse Up`    | Workspace anterior                         |

### Distribución del teclado

| Atajo                   | Acción                        |
| ----------------------- | ----------------------------- |
| `SUPER + SHIFT + SPACE` | Cambiar entre teclado US y ES |

El cambio utiliza:

```bash
hyprctl switchxkblayout all next
```

### Volumen

| Tecla                  | Acción                                    |
| ---------------------- | ----------------------------------------- |
| `XF86AudioRaiseVolume` | Aumentar volumen                          |
| `XF86AudioLowerVolume` | Reducir volumen                           |
| `XF86AudioMute`        | Activar/desactivar silencio               |
| `XF86AudioMicMute`     | Activar/desactivar silencio del micrófono |

El control de volumen utiliza `wpctl`.

### Brillo

| Tecla                   | Acción          |
| ----------------------- | --------------- |
| `XF86MonBrightnessDown` | Reducir brillo  |
| `XF86MonBrightnessUp`   | Aumentar brillo |

El control de brillo utiliza `brightnessctl`.

En el hardware utilizado, estas teclas corresponden a:

```text
Fn + LEFT  → brillo -
Fn + RIGHT → brillo +
```

La disponibilidad depende del teclado y del hardware.

### Multimedia

| Tecla            | Acción              |
| ---------------- | ------------------- |
| `XF86AudioNext`  | Siguiente canción   |
| `XF86AudioPrev`  | Canción anterior    |
| `XF86AudioPlay`  | Reproducir / pausar |
| `XF86AudioPause` | Reproducir / pausar |

Los controles multimedia utilizan `playerctl`.

### Splunk

| Atajo               | Acción                            |
| ------------------- | --------------------------------- |
| `SUPER + SHIFT + P` | Iniciar Splunk y abrirlo en Brave |
| `SUPER + SHIFT + X` | Detener Splunk                    |

Splunk debe estar instalado en:

```text
/opt/splunk/
```

### Infinite Desktop

| Atajo              | Acción                     |
| ------------------ | -------------------------- |
| `CTRL + SUPER + ←` | Navegar hacia la izquierda |
| `CTRL + SUPER + →` | Navegar hacia la derecha   |

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
chmod -R +x .
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
* El tema de Plymouth modifica componentes relacionados con `mkinitcpio` y la configuración de arranque.
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

`bootstrap.sh` is the main entry point. It runs the required scripts in the correct order:

1. Update the system.
2. Install the base packages using `packages.sh`.
3. Configure Plymouth using `plymouth/setup-plymouth.sh`.
4. Install the dotfiles using `install.sh`.

The setup installs and configures:

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

## ⚙️ Modular Installation

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

## 🎨 Plymouth

The repository includes a custom Plymouth theme based on **Ashita no Joe**.

The theme is located at:

```text
plymouth/
├── ashita-no-joe/
└── setup-plymouth.sh
```

The `setup-plymouth.sh` script:

1. Installs Plymouth.
2. Copies the custom theme.
3. Sets `ashita-no-joe` as the default theme.
4. Configures the Plymouth hook in `mkinitcpio`.
5. Disables the default Arch splash included in the kernel preset.
6. Configures `quiet`, `splash`, and `loglevel=3`.
7. Rebuilds the initramfs.

The default Arch splash is disabled to prevent the Arch logo from appearing before the custom theme.

---

## ⌨️ Keyboard Shortcuts

The shortcuts are defined in:

```text
.config/hypr/lua/keybinds.lua
```

### Applications

| Shortcut    | Action                 |
| ----------- | ---------------------- |
| `SUPER + U` | Unity Hub              |
| `SUPER + O` | OBS Studio             |
| `SUPER + C` | VSCodium               |
| `SUPER + K` | Kdenlive               |
| `SUPER + L` | Lock screen            |
| `SUPER + B` | Brave                  |
| `SUPER + D` | Discord                |
| `SUPER + T` | Terminal               |
| `SUPER + Q` | Close window           |
| `SUPER + M` | Spotify                |
| `SUPER + E` | File manager           |
| `SUPER + V` | Toggle floating window |
| `SUPER + P` | Toggle pseudo-tile     |

### Launchers and Utilities

| Shortcut            | Action                                   |
| ------------------- | ---------------------------------------- |
| `Print`             | Take a selected-area screenshot          |
| `SUPER + SPACE`     | Open Rofi                                |
| `SUPER + SHIFT + S` | Take a region screenshot with Hyprshot   |
| `SUPER + SHIFT + W` | Run launcher script                      |
| `SUPER + A`         | Toggle notification center               |
| `SUPER + N`         | Toggle notification center               |
| `SUPER + W`         | Change wallpaper                         |
| `CTRL + M`          | Open power menu                          |
| `ALT + Tab`         | Switch between windows                   |
| `ALT + V`           | Run Infinite Desktop                     |
| `SUPER + SHIFT + V` | Toggle floating windows using the script |

### Window Management

| Shortcut                     | Action                 |
| ---------------------------- | ---------------------- |
| `SUPER + ←`                  | Focus left             |
| `SUPER + →`                  | Focus right            |
| `SUPER + ↑`                  | Focus up               |
| `SUPER + ↓`                  | Focus down             |
| `SUPER + SHIFT + ←`          | Move window left       |
| `SUPER + SHIFT + →`          | Move window right      |
| `SUPER + SHIFT + ↑`          | Move window up         |
| `SUPER + SHIFT + ↓`          | Move window down       |
| `SUPER + ALT + ←`            | Decrease window width  |
| `SUPER + ALT + →`            | Increase window width  |
| `SUPER + ALT + ↑`            | Decrease window height |
| `SUPER + ALT + ↓`            | Increase window height |
| `SUPER + Left Mouse Button`  | Move window            |
| `SUPER + Right Mouse Button` | Resize window          |

### Workspaces

| Shortcut              | Action                                     |
| --------------------- | ------------------------------------------ |
| `SUPER + 1-9`         | Switch to the corresponding workspace      |
| `SUPER + 0`           | Switch to workspace 10                     |
| `SUPER + SHIFT + 1-9` | Move window to the corresponding workspace |
| `SUPER + SHIFT + 0`   | Move window to workspace 10                |
| `SUPER + S`           | Toggle the `magic` special workspace       |
| `SUPER + Mouse Down`  | Next workspace                             |
| `SUPER + Mouse Up`    | Previous workspace                         |

### Keyboard Layout

| Shortcut                | Action                           |
| ----------------------- | -------------------------------- |
| `SUPER + SHIFT + SPACE` | Switch between US and ES layouts |

The layout is switched using:

```bash
hyprctl switchxkblayout all next
```

### Volume

| Key                    | Action                 |
| ---------------------- | ---------------------- |
| `XF86AudioRaiseVolume` | Increase volume        |
| `XF86AudioLowerVolume` | Decrease volume        |
| `XF86AudioMute`        | Toggle audio mute      |
| `XF86AudioMicMute`     | Toggle microphone mute |

Volume control uses `wpctl`.

### Brightness

| Key                     | Action              |
| ----------------------- | ------------------- |
| `XF86MonBrightnessDown` | Decrease brightness |
| `XF86MonBrightnessUp`   | Increase brightness |

Brightness control uses `brightnessctl`.

On the target hardware, these keys correspond to:

```text
Fn + LEFT  → brightness down
Fn + RIGHT → brightness up
```

Availability depends on the keyboard and hardware.

### Media

| Key              | Action         |
| ---------------- | -------------- |
| `XF86AudioNext`  | Next track     |
| `XF86AudioPrev`  | Previous track |
| `XF86AudioPlay`  | Play / pause   |
| `XF86AudioPause` | Play / pause   |

Media controls use `playerctl`.

### Splunk

| Shortcut            | Action                            |
| ------------------- | --------------------------------- |
| `SUPER + SHIFT + P` | Start Splunk and open it in Brave |
| `SUPER + SHIFT + X` | Stop Splunk                       |

Splunk must be installed at:

```text
/opt/splunk/
```

### Infinite Desktop

| Shortcut           | Action         |
| ------------------ | -------------- |
| `CTRL + SUPER + ←` | Navigate left  |
| `CTRL + SUPER + →` | Navigate right |

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

If you use these dotfiles in another city or country, edit:

```text
~/.config/waybar/scripts/clock-weather.sh
```

and change the configured location.

Otherwise, Waybar will continue showing the weather for the original location.

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

After installing the dotfiles, **remove or comment out the `left-speaker.sh` execution in `autostart.lua`**.

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
* Separation between the system, desktop environment, and themes.
* Reproducible configuration for Arch Linux.
* Inspired by setups such as Caelestia / unixporn.

---

## 🔄 Quick Reinstallation

On a fresh Arch Linux installation:

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
chmod -R +x .
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
* `clock-weather.sh` contains a manually configured location and must be changed when using another location.
* The Plymouth setup modifies components related to `mkinitcpio` and the boot configuration.
* Review the hardware-specific configurations before using these dotfiles.

---

## 🎯 Goal

Have a fully functional Hyprland system running within a few minutes after installing Arch Linux.

