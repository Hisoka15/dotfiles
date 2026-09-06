# Dotfiles - Hyprland Setup

Configuración personal de Arch Linux con Hyprland, incluyendo entorno gráfico, herramientas de desarrollo, Plymouth, wallpapers, Pywal16 y scripts personalizados.

---

# 🇪🇸 Español

## 🚀 Instalación

### Requisitos

* Una instalación mínima de **Arch Linux**
* Conexión a Internet
* Usuario con permisos `sudo`
* GRUB instalado y configurado

Estos dotfiles están diseñados para una instalación limpia de Arch Linux.

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
2. Instala los paquetes oficiales de Arch Linux mediante `packages.sh`.
3. Instala `yay`.
4. Instala Pywal16 mediante `yay`.
5. Instala los dotfiles y wallpapers mediante `install.sh`.
6. Genera la paleta de colores con Pywal16.
7. Configura Plymouth.
8. Configura el inicio automático de Hyprland desde el TTY.

---

## 📦 ¿Qué instala el setup?

El setup instala y configura:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* SwayNC
* Hyprlock
* Hyprshot
* Fastfetch
* Neovim
* PipeWire / WirePlumber
* Pavucontrol
* NetworkManager
* Swww
* Playerctl
* Brightnessctl
* jq
* Plymouth
* Noto Fonts
* JetBrains Mono Nerd Font
* yay
* Pywal16
* Wallpapers
* Configuraciones personalizadas

Los paquetes oficiales se instalan mediante `pacman`.

Los paquetes disponibles en AUR se instalan mediante `yay`.

---

## 🛠️ yay

El setup instala automáticamente **yay** para poder instalar paquetes provenientes del AUR.

El proceso de instalación:

1. Instala `base-devel` y `git`.
2. Clona el repositorio de yay desde AUR.
3. Compila yay utilizando `makepkg`.
4. Instala yay como usuario normal.
5. Utiliza yay para instalar Pywal16.

No es necesario instalar yay manualmente antes de ejecutar `bootstrap.sh`.

---

## 🎨 Pywal16

Estos dotfiles utilizan **Pywal16** para generar dinámicamente una paleta de colores basada en el wallpaper.

Después de instalar los dotfiles y los wallpapers, se ejecuta:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Pywal16 analiza el wallpaper y genera una paleta de colores a partir de sus colores principales.

La paleta generada es utilizada por diferentes componentes del entorno para mantener una apariencia consistente.

Entre los componentes que utilizan estos colores se encuentran:

* Waybar
* Rofi
* SwayNC
* Otros elementos que utilizan los archivos generados por Pywal

### 📁 Archivos generados

Pywal16 genera sus archivos dentro de:

```bash
~/.cache/wal/
```

Por ejemplo:

```bash
~/.cache/wal/colors-waybar.css
```

Este archivo contiene los colores generados para Waybar.

Los archivos dentro de `~/.cache/wal/` son generados automáticamente y no forman parte de los archivos principales del repositorio.

### 🔄 Cambiar el wallpaper y generar una nueva paleta

Puedes utilizar cualquiera de los wallpapers disponibles.

Por ejemplo:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

O:

```bash
wal -i ~/Pictures/walls/cowboy.jpg
```

Cada vez que ejecutes `wal`, Pywal16 generará una nueva paleta basada en la imagen seleccionada.

---

## 🖼️ Wallpapers

Los wallpapers incluidos en el repositorio se encuentran en:

```text
walls/
```

Durante la instalación se copian a:

```text
~/Pictures/walls/
```

Por ejemplo:

```text
~/Pictures/walls/shizuku.png
~/Pictures/walls/cowboy.jpg
```

Puedes agregar tus propios wallpapers dentro de `~/Pictures/walls/` y generar una nueva paleta con:

```bash
wal -i ~/Pictures/walls/NOMBRE_DEL_WALLPAPER.png
```

---

## ⌨️ Inicio automático de Hyprland

Estos dotfiles **no utilizan SDDM, greetd ni ningún otro display manager**.

El sistema utiliza el TTY normal de Arch Linux.

El flujo de inicio es:

```text
BIOS / UEFI
      ↓
    GRUB
      ↓
   Plymouth
      ↓
     TTY
      ↓
  Usuario / Password
      ↓
   Hyprland
```

Después de iniciar sesión en el TTY, Hyprland se inicia automáticamente.

El inicio automático se configura mediante:

```text
~/.bash_profile
```

La configuración utiliza:

```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
    exec Hyprland
fi
```

Esto permite mantener el login tradicional de Arch Linux sin instalar un gestor de inicio gráfico.

---

## ⚙️ Instalación por módulos

Si prefieres instalar cada componente manualmente:

### Paquetes base

```bash
./packages.sh
```

### yay y Pywal16

```bash
./yayInstall.sh
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

| Atajo               | Acción                                    |
| ------------------- | ----------------------------------------- |
| `Print`             | Captura de pantalla con selección de área |
| `SUPER + SPACE`     | Abrir Rofi                                |
| `SUPER + SHIFT + S` | Captura de región con Hyprshot            |
| `SUPER + SHIFT + W` | Ejecutar script de lanzamiento            |
| `SUPER + A`         | Alternar centro de notificaciones         |
| `SUPER + N`         | Alternar centro de notificaciones         |
| `SUPER + W`         | Cambiar wallpaper                         |
| `CTRL + M`          | Abrir menú de energía                     |
| `ALT + Tab`         | Cambiar entre ventanas                    |
| `ALT + V`           | Ejecutar Infinite Desktop                 |

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

| Tecla           | Acción                                    |
| --------------- | ----------------------------------------- |
| `Fn + ↑`        | Aumentar volumen                          |
| `Fn + ↓`        | Reducir volumen                           |
| `Fn + Mute`     | Activar/desactivar silencio               |
| `Fn + Mic Mute` | Activar/desactivar silencio del micrófono |

El control de volumen utiliza `wpctl`.

### Brillo

| Tecla    | Acción          |
| -------- | --------------- |
| `Fn + ←` | Reducir brillo  |
| `Fn + →` | Aumentar brillo |

El control de brillo utiliza `brightnessctl`.

En el hardware utilizado:

```text
Fn + LEFT  → brillo -
Fn + RIGHT → brillo +
```

La disponibilidad depende del teclado y del hardware.

### Multimedia

| Tecla             | Acción              |
| ----------------- | ------------------- |
| `Fn + Next`       | Siguiente canción   |
| `Fn + Previous`   | Canción anterior    |
| `Fn + Play/Pause` | Reproducir / pausar |
| `Fn + Pause`      | Reproducir / pausar |

Los controles multimedia utilizan `playerctl`.

`Fn + Next` corresponde a la tecla física de siguiente pista, normalmente identificada con el símbolo `⏭`.

`Fn + Previous` corresponde a la tecla física de pista anterior, normalmente identificada con el símbolo `⏮`.

`Fn + Play/Pause` corresponde a la tecla física de reproducir/pausar, normalmente identificada con los símbolos `▶⏸`.

`Fn + Pause` corresponde a la tecla física de pausa, cuando el teclado dispone de una tecla independiente para esta función.

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

Este script viene configurado con una ubicación específica.

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
├── yayInstall.sh
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
* Uso de paquetes oficiales de Arch siempre que sea posible.
* Uso de `yay` para paquetes disponibles en AUR.
* Generación dinámica de colores mediante Pywal16.
* Inicio de Hyprland directamente desde el TTY.
* Sin necesidad de un display manager.
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

Una vez finalizada la instalación, reinicia el sistema:

```bash
reboot
```

Después del reinicio aparecerá el login normal del TTY de Arch.

Introduce tu usuario y contraseña y Hyprland se iniciará automáticamente.

---

## ⚠️ Notas

* Este setup está diseñado para Arch Linux.
* Requiere conexión a Internet durante la instalación.
* `yay` se utiliza para instalar paquetes disponibles en AUR.
* Pywal16 se instala mediante `yay`.
* La paleta de colores se genera mediante `wal`.
* Los archivos generados por Pywal16 se almacenan en `~/.cache/wal/`.
* No se instala SDDM, greetd ni ningún otro display manager.
* Hyprland se inicia automáticamente desde el TTY 1 después del login.
* Puede requerir ajustes dependiendo del hardware.
* No incluye paquetes ni drivers específicos de NVIDIA.
* `left-speaker.sh` es específico para solucionar un problema de hardware relacionado con el parlante derecho.
* Si tu parlante derecho funciona correctamente, elimina o comenta su ejecución en `autostart.lua`.
* `clock-weather.sh` contiene una ubicación configurada manualmente y debe modificarse para utilizar otra ubicación.
* El tema de Plymouth modifica componentes relacionados con `mkinitcpio` y la configuración de arranque.
* Revisa las configuraciones específicas de hardware antes de utilizar estos dotfiles.

---

## 🎯 Objetivo

Tener un sistema Arch Linux completamente funcional con Hyprland en pocos minutos después de una instalación mínima, manteniendo una configuración reproducible, modular y fácil de personalizar.

---

# 🇺🇸 English

## 🚀 Installation

### Requirements

* A minimal **Arch Linux** installation
* Internet connection
* A user with `sudo` privileges
* GRUB installed and configured

These dotfiles are designed for a fresh Arch Linux installation.

### 1. Clone the repository

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
```

### 2. Give permissions to the scripts

```bash
chmod -R +x .
```

### 3. Automatic Installation (RECOMMENDED)

Run the main script:

```bash
./bootstrap.sh
```

`bootstrap.sh` is the main entry point and runs the required scripts in the correct order:

1. Updates the system.
2. Installs the official Arch Linux packages using `packages.sh`.
3. Installs `yay`.
4. Installs Pywal16 using `yay`.
5. Installs the dotfiles and wallpapers using `install.sh`.
6. Generates the color palette using Pywal16.
7. Configures Plymouth.
8. Configures automatic Hyprland startup from the TTY.

---

## 📦 What does the setup install?

The setup installs and configures:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* SwayNC
* Hyprlock
* Hyprshot
* Fastfetch
* Neovim
* PipeWire / WirePlumber
* Pavucontrol
* NetworkManager
* Swww
* Playerctl
* Brightnessctl
* jq
* Plymouth
* Noto Fonts
* JetBrains Mono Nerd Font
* yay
* Pywal16
* Wallpapers
* Custom configurations

Official packages are installed using `pacman`.

AUR packages are installed using `yay`.

---

## 🛠️ yay

The setup automatically installs **yay** to provide access to packages available in the AUR.

The installation process:

1. Installs `base-devel` and `git`.
2. Clones the yay repository from the AUR.
3. Builds yay using `makepkg`.
4. Installs yay as a normal user.
5. Uses yay to install Pywal16.

You do not need to install yay manually before running `bootstrap.sh`.

---

## 🎨 Pywal16

These dotfiles use **Pywal16** to dynamically generate a color palette based on the current wallpaper.

After installing the dotfiles and wallpapers, the palette is generated using:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Pywal16 analyzes the wallpaper and generates a color palette based on its main colors.

The generated palette is used by different components of the desktop environment to maintain a consistent appearance.

These components include:

* Waybar
* Rofi
* SwayNC
* Other elements that use the generated Pywal files

### 📁 Generated files

Pywal16 generates its files inside:

```text
~/.cache/wal/
```

For example:

```text
~/.cache/wal/colors-waybar.css
```

This file contains the colors generated for Waybar.

Files inside `~/.cache/wal/` are automatically generated and are not part of the main configuration files in this repository.

### 🔄 Changing the wallpaper and generating a new palette

You can use any of the wallpapers included in the repository.

For example:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Or:

```bash
wal -i ~/Pictures/walls/cowboy.jpg
```

Every time you run `wal`, Pywal16 generates a new palette based on the selected image.

---

## 🖼️ Wallpapers

The wallpapers included in the repository are located in:

```text
walls/
```

During installation they are copied to:

```text
~/Pictures/walls/
```

For example:

```text
~/Pictures/walls/shizuku.png
~/Pictures/walls/cowboy.jpg
```

You can add your own wallpapers to `~/Pictures/walls/` and generate a new palette using:

```bash
wal -i ~/Pictures/walls/NAME_OF_WALLPAPER.png
```

---

## ⌨️ Automatic Hyprland Startup

These dotfiles **do not use SDDM, greetd, or any other display manager**.

The system uses the standard Arch Linux TTY.

The startup flow is:

```text
BIOS / UEFI
      ↓
    GRUB
      ↓
   Plymouth
      ↓
     TTY
      ↓
Username / Password
      ↓
   Hyprland
```

After logging into the TTY, Hyprland starts automatically.

Automatic startup is configured through:

```text
~/.bash_profile
```

The configuration uses:

```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
    exec Hyprland
fi
```

This keeps the standard Arch Linux login experience without installing a graphical display manager.

---

## ⚙️ Modular Installation

If you prefer to install each component manually:

### Base packages

```bash
./packages.sh
```

### yay and Pywal16

```bash
./yayInstall.sh
```

### Dotfiles

```bash
./install.sh
```

The configurations will be copied to:

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
7. Regenerates the initramfs.

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

| Shortcut            | Action                                 |
| ------------------- | -------------------------------------- |
| `Print`             | Take a selected-area screenshot        |
| `SUPER + SPACE`     | Open Rofi                              |
| `SUPER + SHIFT + S` | Take a region screenshot with Hyprshot |
| `SUPER + SHIFT + W` | Run launcher script                    |
| `SUPER + A`         | Toggle notification center             |
| `SUPER + N`         | Toggle notification center             |
| `SUPER + W`         | Change wallpaper                       |
| `CTRL + M`          | Open power menu                        |
| `ALT + Tab`         | Switch between windows                 |
| `ALT + V`           | Run Infinite Desktop                   |

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

| Key             | Action                 |
| --------------- | ---------------------- |
| `Fn + ↑`        | Increase volume        |
| `Fn + ↓`        | Decrease volume        |
| `Fn + Mute`     | Toggle mute            |
| `Fn + Mic Mute` | Toggle microphone mute |

Volume control uses `wpctl`.

### Brightness

| Key      | Action              |
| -------- | ------------------- |
| `Fn + ←` | Decrease brightness |
| `Fn + →` | Increase brightness |

Brightness control uses `brightnessctl`.

On the tested hardware:

```text
Fn + LEFT  → brightness -
Fn + RIGHT → brightness +
```

Availability depends on the keyboard and hardware.

### Multimedia

| Key               | Action         |
| ----------------- | -------------- |
| `Fn + Next`       | Next track     |
| `Fn + Previous`   | Previous track |
| `Fn + Play/Pause` | Play / pause   |
| `Fn + Pause`      | Play / pause   |

Media controls use `playerctl`.

`Fn + Next` refers to the physical next-track key, usually marked with the `⏭` symbol.

`Fn + Previous` refers to the physical previous-track key, usually marked with the `⏮` symbol.

`Fn + Play/Pause` refers to the physical play/pause key, usually marked with the `▶⏸` symbols.

`Fn + Pause` refers to the physical pause key when the keyboard has a separate key for this function.

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

This script is configured with a specific location.

### ⚠️ Important

The location is **not detected automatically**.

If you use these dotfiles in another city or country, edit:

```text
~/.config/waybar/scripts/clock-weather.sh
```

and change the configured location.

Otherwise, Waybar will continue showing the weather for the original configured location.

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
├── yayInstall.sh
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
* Separation between system, desktop environment and themes.
* Reproducible Arch Linux configuration.
* Use of official Arch packages whenever possible.
* Use of `yay` for packages available in the AUR.
* Dynamic color generation using Pywal16.
* Hyprland startup directly from the TTY.
* No display manager required.
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

Once the installation is complete, reboot the system:

```bash
reboot
```

After rebooting, the standard Arch Linux TTY login will appear.

Enter your username and password and Hyprland will start automatically.

---

## ⚠️ Notes

* This setup is designed for Arch Linux.
* An internet connection is required during installation.
* `yay` is used to install packages available in the AUR.
* Pywal16 is installed using `yay`.
* The color palette is generated using `wal`.
* Pywal16 generated files are stored in `~/.cache/wal/`.
* SDDM, greetd and other display managers are not installed.
* Hyprland starts automatically from TTY 1 after login.
* Hardware-specific adjustments may be required.
* NVIDIA-specific packages and drivers are not included.
* `left-speaker.sh` is specific to solving a hardware problem related to the right speaker.
* If your right speaker works correctly, remove or comment out its execution in `autostart.lua`.
* `clock-weather.sh` contains a manually configured location and must be changed when using another location.
* The Plymouth theme modifies components related to `mkinitcpio` and the boot configuration.
* Review hardware-specific configurations before using these dotfiles.

---

## 🎯 Goal

Have a fully functional Arch Linux system with Hyprland running within a few minutes after a minimal installation, while keeping the configuration reproducible, modular and easy to customize.

# Dotfiles - Hyprland Setup

Configuración personal de Arch Linux con Hyprland, incluyendo entorno gráfico, herramientas de desarrollo, Plymouth, wallpapers, Pywal16 y scripts personalizados.

---

# 🇪🇸 Español

## 🚀 Instalación

### Requisitos

* Una instalación mínima de **Arch Linux**
* Conexión a Internet
* Usuario con permisos `sudo`
* GRUB instalado y configurado

Estos dotfiles están diseñados para una instalación limpia de Arch Linux.

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
2. Instala los paquetes oficiales de Arch Linux mediante `packages.sh`.
3. Instala `yay`.
4. Instala Pywal16 mediante `yay`.
5. Instala los dotfiles y wallpapers mediante `install.sh`.
6. Genera la paleta de colores con Pywal16.
7. Configura Plymouth.
8. Configura el inicio automático de Hyprland desde el TTY.

---

## 📦 ¿Qué instala el setup?

El setup instala y configura:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* SwayNC
* Hyprlock
* Hyprshot
* Fastfetch
* Neovim
* PipeWire / WirePlumber
* Pavucontrol
* NetworkManager
* Swww
* Playerctl
* Brightnessctl
* jq
* Plymouth
* Noto Fonts
* JetBrains Mono Nerd Font
* yay
* Pywal16
* Wallpapers
* Configuraciones personalizadas

Los paquetes oficiales se instalan mediante `pacman`.

Los paquetes disponibles en AUR se instalan mediante `yay`.

---

## 🛠️ yay

El setup instala automáticamente **yay** para poder instalar paquetes provenientes del AUR.

El proceso de instalación:

1. Instala `base-devel` y `git`.
2. Clona el repositorio de yay desde AUR.
3. Compila yay utilizando `makepkg`.
4. Instala yay como usuario normal.
5. Utiliza yay para instalar Pywal16.

No es necesario instalar yay manualmente antes de ejecutar `bootstrap.sh`.

---

## 🎨 Pywal16

Estos dotfiles utilizan **Pywal16** para generar dinámicamente una paleta de colores basada en el wallpaper.

Después de instalar los dotfiles y los wallpapers, se ejecuta:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Pywal16 analiza el wallpaper y genera una paleta de colores a partir de sus colores principales.

La paleta generada es utilizada por diferentes componentes del entorno para mantener una apariencia consistente.

Entre los componentes que utilizan estos colores se encuentran:

* Waybar
* Rofi
* SwayNC
* Otros elementos que utilizan los archivos generados por Pywal

### 📁 Archivos generados

Pywal16 genera sus archivos dentro de:

```bash
~/.cache/wal/
```

Por ejemplo:

```bash
~/.cache/wal/colors-waybar.css
```

Este archivo contiene los colores generados para Waybar.

Los archivos dentro de `~/.cache/wal/` son generados automáticamente y no forman parte de los archivos principales del repositorio.

### 🔄 Cambiar el wallpaper y generar una nueva paleta

Puedes utilizar cualquiera de los wallpapers disponibles.

Por ejemplo:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

O:

```bash
wal -i ~/Pictures/walls/cowboy.jpg
```

Cada vez que ejecutes `wal`, Pywal16 generará una nueva paleta basada en la imagen seleccionada.

---

## 🖼️ Wallpapers

Los wallpapers incluidos en el repositorio se encuentran en:

```text
walls/
```

Durante la instalación se copian a:

```text
~/Pictures/walls/
```

Por ejemplo:

```text
~/Pictures/walls/shizuku.png
~/Pictures/walls/cowboy.jpg
```

Puedes agregar tus propios wallpapers dentro de `~/Pictures/walls/` y generar una nueva paleta con:

```bash
wal -i ~/Pictures/walls/NOMBRE_DEL_WALLPAPER.png
```

---

## ⌨️ Inicio automático de Hyprland

Estos dotfiles **no utilizan SDDM, greetd ni ningún otro display manager**.

El sistema utiliza el TTY normal de Arch Linux.

El flujo de inicio es:

```text
BIOS / UEFI
      ↓
    GRUB
      ↓
   Plymouth
      ↓
     TTY
      ↓
  Usuario / Password
      ↓
   Hyprland
```

Después de iniciar sesión en el TTY, Hyprland se inicia automáticamente.

El inicio automático se configura mediante:

```text
~/.bash_profile
```

La configuración utiliza:

```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
    exec Hyprland
fi
```

Esto permite mantener el login tradicional de Arch Linux sin instalar un gestor de inicio gráfico.

---

## ⚙️ Instalación por módulos

Si prefieres instalar cada componente manualmente:

### Paquetes base

```bash
./packages.sh
```

### yay y Pywal16

```bash
./yayInstall.sh
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

| Atajo               | Acción                                    |
| ------------------- | ----------------------------------------- |
| `Print`             | Captura de pantalla con selección de área |
| `SUPER + SPACE`     | Abrir Rofi                                |
| `SUPER + SHIFT + S` | Captura de región con Hyprshot            |
| `SUPER + SHIFT + W` | Ejecutar script de lanzamiento            |
| `SUPER + A`         | Alternar centro de notificaciones         |
| `SUPER + N`         | Alternar centro de notificaciones         |
| `SUPER + W`         | Cambiar wallpaper                         |
| `CTRL + M`          | Abrir menú de energía                     |
| `ALT + Tab`         | Cambiar entre ventanas                    |
| `ALT + V`           | Ejecutar Infinite Desktop                 |

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

---

## 🔊 Volumen

Los controles de volumen soportan tanto las teclas multimedia del teclado como atajos estándar para teclados externos.

### Teclas multimedia

| Tecla           | Acción                                |
| --------------- | ------------------------------------- |
| `Fn + ↑`        | Aumentar volumen                      |
| `Fn + ↓`        | Reducir volumen                       |
| `Fn + Mute`     | Activar/desactivar silencio           |
| `Fn + Mic Mute` | Activar/desactivar silencio micrófono |

### Atajos estándar

| Atajo            | Acción                      |
| ---------------- | --------------------------- |
| `CTRL + ALT + ↑` | Aumentar volumen            |
| `CTRL + ALT + ↓` | Reducir volumen             |
| `CTRL + ALT + M` | Activar/desactivar silencio |

El control de volumen utiliza `wpctl`.

Los atajos `CTRL + ALT` permiten controlar el volumen desde un teclado externo que no disponga de las mismas teclas multimedia o funciones `Fn` que un laptop.

---

## 🔆 Brillo

Los controles de brillo soportan las teclas multimedia del laptop y atajos estándar para teclados externos.

### Teclas multimedia

| Tecla    | Acción          |
| -------- | --------------- |
| `Fn + ←` | Reducir brillo  |
| `Fn + →` | Aumentar brillo |

### Atajos estándar

| Atajo            | Acción          |
| ---------------- | --------------- |
| `CTRL + ALT + ←` | Reducir brillo  |
| `CTRL + ALT + →` | Aumentar brillo |

El control de brillo utiliza `brightnessctl`.

En el hardware del laptop utilizado:

```text
Fn + LEFT  → brillo -
Fn + RIGHT → brillo +
```

Los atajos `CTRL + ALT` proporcionan una alternativa para teclados externos que no implementan las mismas funciones `Fn`.

### ⚠️ Nota sobre teclados externos

La tecla `Fn` normalmente es gestionada directamente por el firmware del teclado y puede no ser visible para Hyprland.

Por esta razón, un teclado externo puede no generar los mismos eventos `XF86` que un teclado de laptop.

Los atajos:

```text
CTRL + ALT + ↑
CTRL + ALT + ↓
CTRL + ALT + ←
CTRL + ALT + →
```

utilizan teclas estándar que pueden ser detectadas directamente por Hyprland.

La funcionalidad de `brightnessctl` también depende del hardware y de que exista un dispositivo de brillo compatible.

---

## 🎵 Multimedia

| Tecla             | Acción              |
| ----------------- | ------------------- |
| `Fn + Next`       | Siguiente canción   |
| `Fn + Previous`   | Canción anterior    |
| `Fn + Play/Pause` | Reproducir / pausar |
| `Fn + Pause`      | Reproducir / pausar |

Los controles multimedia utilizan `playerctl`.

`Fn + Next` corresponde a la tecla física de siguiente pista, normalmente identificada con el símbolo `⏭`.

`Fn + Previous` corresponde a la tecla física de pista anterior, normalmente identificada con el símbolo `⏮`.

`Fn + Play/Pause` corresponde a la tecla física de reproducir/pausar, normalmente identificada con los símbolos `▶⏸`.

`Fn + Pause` corresponde a la tecla física de pausa, cuando el teclado dispone de una tecla independiente para esta función.

---

## 📊 Splunk

| Atajo               | Acción                            |
| ------------------- | --------------------------------- |
| `SUPER + SHIFT + P` | Iniciar Splunk y abrirlo en Brave |
| `SUPER + SHIFT + X` | Detener Splunk                    |

Splunk debe estar instalado en:

```text
/opt/splunk/
```

---

## 🖥️ Infinite Desktop

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

Este script viene configurado con una ubicación específica.

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
├── yayInstall.sh
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
* Uso de paquetes oficiales de Arch siempre que sea posible.
* Uso de `yay` para paquetes disponibles en AUR.
* Generación dinámica de colores mediante Pywal16.
* Inicio de Hyprland directamente desde el TTY.
* Sin necesidad de un display manager.
* Atajos de teclado compatibles con teclados de laptop y teclados externos.
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

Una vez finalizada la instalación, reinicia el sistema:

```bash
reboot
```

Después del reinicio aparecerá el login normal del TTY de Arch.

Introduce tu usuario y contraseña y Hyprland se iniciará automáticamente.

---

## ⚠️ Notas

* Este setup está diseñado para Arch Linux.
* Requiere conexión a Internet durante la instalación.
* `yay` se utiliza para instalar paquetes disponibles en AUR.
* Pywal16 se instala mediante `yay`.
* La paleta de colores se genera mediante `wal`.
* Los archivos generados por Pywal16 se almacenan en `~/.cache/wal/`.
* No se instala SDDM, greetd ni ningún otro display manager.
* Hyprland se inicia automáticamente desde el TTY 1 después del login.
* Puede requerir ajustes dependiendo del hardware.
* No incluye paquetes ni drivers específicos de NVIDIA.
* `left-speaker.sh` es específico para solucionar un problema de hardware relacionado con el parlante derecho.
* Si tu parlante derecho funciona correctamente, elimina o comenta su ejecución en `autostart.lua`.
* `clock-weather.sh` contiene una ubicación configurada manualmente y debe modificarse para utilizar otra ubicación.
* Las funciones `Fn` dependen del firmware y del hardware del teclado.
* Los atajos `CTRL + ALT` para volumen y brillo proporcionan una alternativa para teclados externos.
* `brightnessctl` requiere hardware compatible para controlar el brillo.
* El tema de Plymouth modifica componentes relacionados con `mkinitcpio` y la configuración de arranque.
* Revisa las configuraciones específicas de hardware antes de utilizar estos dotfiles.

---

## 🎯 Objetivo

Tener un sistema Arch Linux completamente funcional con Hyprland en pocos minutos después de una instalación mínima, manteniendo una configuración reproducible, modular y fácil de personalizar.

---

# 🇺🇸 English

## 🚀 Installation

### Requirements

* A minimal **Arch Linux** installation
* Internet connection
* A user with `sudo` privileges
* GRUB installed and configured

These dotfiles are designed for a fresh Arch Linux installation.

### 1. Clone the repository

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
```

### 2. Give permissions to the scripts

```bash
chmod -R +x .
```

### 3. Automatic Installation (RECOMMENDED)

Run the main script:

```bash
./bootstrap.sh
```

`bootstrap.sh` is the main entry point and runs the required scripts in the correct order:

1. Updates the system.
2. Installs the official Arch Linux packages using `packages.sh`.
3. Installs `yay`.
4. Installs Pywal16 using `yay`.
5. Installs the dotfiles and wallpapers using `install.sh`.
6. Generates the color palette using Pywal16.
7. Configures Plymouth.
8. Configures automatic Hyprland startup from the TTY.

---

## 📦 What does the setup install?

The setup installs and configures:

* Hyprland
* Waybar
* Rofi
* Kitty
* Dunst
* SwayNC
* Hyprlock
* Hyprshot
* Fastfetch
* Neovim
* PipeWire / WirePlumber
* Pavucontrol
* NetworkManager
* Swww
* Playerctl
* Brightnessctl
* jq
* Plymouth
* Noto Fonts
* JetBrains Mono Nerd Font
* yay
* Pywal16
* Wallpapers
* Custom configurations

Official packages are installed using `pacman`.

AUR packages are installed using `yay`.

---

## 🛠️ yay

The setup automatically installs **yay** to provide access to packages available in the AUR.

The installation process:

1. Installs `base-devel` and `git`.
2. Clones the yay repository from the AUR.
3. Builds yay using `makepkg`.
4. Installs yay as a normal user.
5. Uses yay to install Pywal16.

You do not need to install yay manually before running `bootstrap.sh`.

---

## 🎨 Pywal16

These dotfiles use **Pywal16** to dynamically generate a color palette based on the current wallpaper.

After installing the dotfiles and wallpapers, the palette is generated using:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Pywal16 analyzes the wallpaper and generates a color palette based on its main colors.

The generated palette is used by different components of the desktop environment to maintain a consistent appearance.

These components include:

* Waybar
* Rofi
* SwayNC
* Other elements that use the generated Pywal files

### 📁 Generated files

Pywal16 generates its files inside:

```text
~/.cache/wal/
```

For example:

```text
~/.cache/wal/colors-waybar.css
```

This file contains the colors generated for Waybar.

Files inside `~/.cache/wal/` are automatically generated and are not part of the main configuration files in this repository.

### 🔄 Changing the wallpaper and generating a new palette

You can use any of the wallpapers included in the repository.

For example:

```bash
wal -i ~/Pictures/walls/shizuku.png
```

Or:

```bash
wal -i ~/Pictures/walls/cowboy.jpg
```

Every time you run `wal`, Pywal16 generates a new palette based on the selected image.

---

## 🖼️ Wallpapers

The wallpapers included in the repository are located in:

```text
walls/
```

During installation they are copied to:

```text
~/Pictures/walls/
```

For example:

```text
~/Pictures/walls/shizuku.png
~/Pictures/walls/cowboy.jpg
```

You can add your own wallpapers to `~/Pictures/walls/` and generate a new palette using:

```bash
wal -i ~/Pictures/walls/NAME_OF_WALLPAPER.png
```

---

## ⌨️ Automatic Hyprland Startup

These dotfiles **do not use SDDM, greetd, or any other display manager**.

The system uses the standard Arch Linux TTY.

The startup flow is:

```text
BIOS / UEFI
      ↓
    GRUB
      ↓
   Plymouth
      ↓
     TTY
      ↓
Username / Password
      ↓
   Hyprland
```

After logging into the TTY, Hyprland starts automatically.

Automatic startup is configured through:

```text
~/.bash_profile
```

The configuration uses:

```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
    exec Hyprland
fi
```

This keeps the standard Arch Linux login experience without installing a graphical display manager.

---

## ⚙️ Modular Installation

If you prefer to install each component manually:

### Base packages

```bash
./packages.sh
```

### yay and Pywal16

```bash
./yayInstall.sh
```

### Dotfiles

```bash
./install.sh
```

The configurations will be copied to:

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
7. Regenerates the initramfs.

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

| Shortcut            | Action                                 |
| ------------------- | -------------------------------------- |
| `Print`             | Take a selected-area screenshot        |
| `SUPER + SPACE`     | Open Rofi                              |
| `SUPER + SHIFT + S` | Take a region screenshot with Hyprshot |
| `SUPER + SHIFT + W` | Run launcher script                    |
| `SUPER + A`         | Toggle notification center             |
| `SUPER + N`         | Toggle notification center             |
| `SUPER + W`         | Change wallpaper                       |
| `CTRL + M`          | Open power menu                        |
| `ALT + Tab`         | Switch between windows                 |
| `ALT + V`           | Run Infinite Desktop                   |

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

---

## 🔊 Volume

Volume controls support both multimedia keys and standard keyboard shortcuts for external keyboards.

### Multimedia keys

| Key             | Action                 |
| --------------- | ---------------------- |
| `Fn + ↑`        | Increase volume        |
| `Fn + ↓`        | Decrease volume        |
| `Fn + Mute`     | Toggle mute            |
| `Fn + Mic Mute` | Toggle microphone mute |

### Standard shortcuts

| Shortcut         | Action          |
| ---------------- | --------------- |
| `CTRL + ALT + ↑` | Increase volume |
| `CTRL + ALT + ↓` | Decrease volume |
| `CTRL + ALT + M` | Toggle mute     |

Volume control uses `wpctl`.

The `CTRL + ALT` shortcuts allow volume control from an external keyboard that does not provide the same multimedia keys or `Fn` functions as a laptop keyboard.

---

## 🔆 Brightness

Brightness controls support both laptop multimedia keys and standard keyboard shortcuts for external keyboards.

### Multimedia keys

| Key      | Action              |
| -------- | ------------------- |
| `Fn + ←` | Decrease brightness |
| `Fn + →` | Increase brightness |

### Standard shortcuts

| Shortcut         | Action              |
| ---------------- | ------------------- |
| `CTRL + ALT + ←` | Decrease brightness |
| `CTRL + ALT + →` | Increase brightness |

Brightness control uses `brightnessctl`.

On the tested laptop hardware:

```text
Fn + LEFT  → brightness -
Fn + RIGHT → brightness +
```

The `CTRL + ALT` shortcuts provide an alternative for external keyboards that do not implement the same `Fn` functions.

### ⚠️ Note about external keyboards

The `Fn` key is normally handled directly by the keyboard firmware and may not be visible to Hyprland.

Because of this, an external keyboard may not generate the same `XF86` events as a laptop keyboard.

The following shortcuts use standard keys that can be detected directly by Hyprland:

```text
CTRL + ALT + ↑ → volume +
CTRL + ALT + ↓ → volume -
CTRL + ALT + ← → brightness -
CTRL + ALT + → → brightness +
```

`brightnessctl` also depends on the hardware providing a compatible brightness device.

---

## 🎵 Multimedia

| Key               | Action         |
| ----------------- | -------------- |
| `Fn + Next`       | Next track     |
| `Fn + Previous`   | Previous track |
| `Fn + Play/Pause` | Play / pause   |
| `Fn + Pause`      | Play / pause   |

Media controls use `playerctl`.

`Fn + Next` refers to the physical next-track key, usually marked with the `⏭` symbol.

`Fn + Previous` refers to the physical previous-track key, usually marked with the `⏮` symbol.

`Fn + Play/Pause` refers to the physical play/pause key, usually marked with the `▶⏸` symbols.

`Fn + Pause` refers to the physical pause key when the keyboard has a separate key for this function.

---

## 📊 Splunk

| Shortcut            | Action                            |
| ------------------- | --------------------------------- |
| `SUPER + SHIFT + P` | Start Splunk and open it in Brave |
| `SUPER + SHIFT + X` | Stop Splunk                       |

Splunk must be installed at:

```text
/opt/splunk/
```

---

## 🖥️ Infinite Desktop

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

This script is configured with a specific location.

### ⚠️ Important

The location is **not detected automatically**.

If you use these dotfiles in another city or country, edit:

```text
~/.config/waybar/scripts/clock-weather.sh
```

and change the configured location.

Otherwise, Waybar will continue showing the weather for the original configured location.

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
├── yayInstall.sh
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
* Separation between system, desktop environment and themes.
* Reproducible Arch Linux configuration.
* Use of official Arch packages whenever possible.
* Use of `yay` for packages available in the AUR.
* Dynamic color generation using Pywal16.
* Hyprland startup directly from the TTY.
* No display manager required.
* Keyboard shortcuts compatible with both laptop and external keyboards.
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

Once the installation is complete, reboot the system:

```bash
reboot
```

After rebooting, the standard Arch Linux TTY login will appear.

Enter your username and password and Hyprland will start automatically.

---

## ⚠️ Notes

* This setup is designed for Arch Linux.
* An internet connection is required during installation.
* `yay` is used to install packages available in the AUR.
* Pywal16 is installed using `yay`.
* The color palette is generated using `wal`.
* Pywal16 generated files are stored in `~/.cache/wal/`.
* SDDM, greetd and other display managers are not installed.
* Hyprland starts automatically from TTY 1 after login.
* Hardware-specific adjustments may be required.
* NVIDIA-specific packages and drivers are not included.
* `left-speaker.sh` is specific to solving a hardware problem related to the right speaker.
* If your right speaker works correctly, remove or comment out its execution in `autostart.lua`.
* `clock-weather.sh` contains a manually configured location and must be changed when using another location.
* `Fn` functionality depends on the keyboard firmware and hardware.
* `CTRL + ALT` shortcuts provide an alternative for volume and brightness controls on external keyboards.
* `brightnessctl` requires compatible hardware to control brightness.
* The Plymouth theme modifies components related to `mkinitcpio` and the boot configuration.
* Review hardware-specific configurations before using these dotfiles.

---

## 🎯 Goal

Have a fully functional Arch Linux system with Hyprland running within a few minutes after a minimal installation, while keeping the configuration reproducible, modular and easy to customize.
