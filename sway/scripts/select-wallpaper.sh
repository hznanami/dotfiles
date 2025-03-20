#!/usr/bin/env bash

source $HOME/.config/sway/scripts/variables
. "${HOME}/.cache/wal/colors-wmenu-sh"

NEW_WALL=$(ls $WALLPAPERS_PATH | wmenu -l 10 -i -f "Noto Sans Bold 13" -S "$color10" -n "$color10")

if [ -z "$NEW_WALL"]; then
	exit
else
	pkill swaybg
	sed -i "5s/[0-9]\+.*$/${NEW_WALL} fill/" $HOME/.config/sway/config.d/output
	wal -q -i $WALLPAPERS_PATH$NEW_WALL
	sleep 1
	sh $HOME/.config/sway/scripts/refresh.sh
fi
