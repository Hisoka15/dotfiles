# Dotfiles - Hyprland Setup

Este repositorio contiene mi configuración personal de Arch Linux con Hyprland, incluyendo entorno gráfico, herramientas de desarrollo, tema de Plymouth y scripts personalizados.

---

# 🚀 Instalación

## 1. Clonar el repositorio

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
```

---

## 2. Dar permisos a los scripts

```bash
chmod -R +x .
```

---

## 3. Instalación automática (RECOMENDADO)

Ejecuta el bootstrap principal:

```bash
./bootstrap.sh
```

Esto instalará y configurará:

* Paquetes base del sistema
* Entorno Hyprland
* Configuraciones de usuario (.config)
* Wallpapers
* Plymouth (tema de arranque)

---

# ⚙️ Instalación por módulos (opcional)

Si prefieres instalar manualmente por partes:

## Paquetes base

```bash
./packages.sh
```

## Dotfiles (Hyprland + configs)

```bash
./install.sh
```

## Plymouth (tema de arranque)

```bash
./plymouth/setup-plymouth.sh
```

---

# 📁 Estructura del repositorio

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
│   ├── rofi/
│   ├── kitty/
│   └── fastfetch/
├── walls/
└── README.md
```

---

# 🧠 Filosofía

* Instalación modular y fácil de mantener
* Separación entre sistema, entorno gráfico y temas
* Configuración reproducible en cualquier instalación de Arch
* Inspirado en setups tipo Caelestia / unixporn

---

# 🔄 Reinstalación rápida

En una instalación nueva de Arch:

```bash
git clone https://github.com/Hisoka15/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Reiniciar el sistema después de finalizar.

---

# ⚠️ Notas

* Este setup está diseñado para Arch Linux
* Requiere conexión a internet activa durante la instalación
* Puede requerir ajustes si cambian drivers o hardware

---

# 🎯 Objetivo

Tener un sistema completamente funcional con Hyprland en pocos minutos después de instalar Arch.
