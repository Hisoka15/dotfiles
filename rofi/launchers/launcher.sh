#!/usr/bin/env bash

## Author : Horacio
## Github : @Hisoka15
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#

dir="$HOME/.config/rofi/styles"
theme='launcher'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
