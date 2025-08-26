#!/usr/bin/env bash
source $HOME/.config/sway/scripts/variables


NEW_WALL=$(find $HOME/Pictures/wallpaper/ -type f | sed 's#.*/##' | shuf -n1)


sed -i "5s/[0-9]\+.*$/${NEW_WALL} fill/" $HOME/.config/sway/config.d/output

pkill swaybg
#exec $HOME/.config/sway/scripts/pywalswaybg.sh &
wal -q -i $WALLPAPERS_PATH$NEW_WALL 
sleep 1
exec $HOME/.config/sway/scripts/refresh.sh

