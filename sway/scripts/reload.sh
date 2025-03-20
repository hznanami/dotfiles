#!/usr/bin/env bash

killall waybar
waybar &>/dev/null & disown

#echo -n

killall swaybg 
swaybg &>/dev/null & disown
#echo -n

exec $HOME/.config/mako/update-theme.sh

swaymsg reload
