#!/bin/bash

CONFIG="$HOME/.config/waybar/config-niri"
STYLE="$HOME/.config/waybar/style.css"

waybar --bar main-bar --config ${CONFIG} --style ${STYLE}
