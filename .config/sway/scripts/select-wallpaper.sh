#!/usr/bin/env bash

source $HOME/.config/sway/scripts/variables
. "${HOME}/.cache/wal/colors-wmenu-sh"

NEW_WALL=$(ls $WALLPAPERS_PATH | wmenu -l 10 -i -f "Source San 3 Bold 13" -S "$color9" -n "$color9")

if [ -z "$NEW_WALL"]; then
	exit
else
	pkill swaybg
	sed -i "5s/[0-9]\+.*$/${NEW_WALL} fill/" $HOME/.config/sway/config.d/output
	wal -q -i $WALLPAPERS_PATH$NEW_WALL
	sleep 1
	sh $HOME/.config/sway/scripts/refresh.sh
fi
