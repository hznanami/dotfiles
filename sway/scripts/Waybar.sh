#!/bin/bash

CONFIG="$HOME/.config/waybar/config.jsonc"
STYLE="$HOME/.config/waybar/style.css"

if [[ ! $(pidof waybar) ]]; then
	waybar --bar main-bar --log-level error --config ${CONFIG} --style ${STYLE}
fi
