#!/usr/bin/env bash

source $HOME/.config/sway/scripts/variables
# . "${HOME}/.cache/wal/colors-wmenu-sh"

# NEW_WALL=$(ls $WALLPAPERS_PATH | wmenu -l 10 -i -f "Noto Sans Bold 13" -S "$color10" -n "$color10")

	pkill swaybg
	sed -i "5s/[0-9]\+.*$/'$1' fill/" $HOME/.config/sway/config.d/output
	wal -q -i $WALLPAPERS_PATH$1
	sleep 1
	sh $HOME/.config/sway/scripts/refresh.sh

