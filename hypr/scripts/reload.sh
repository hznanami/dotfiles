#!/usr/bin/env bash

killall waybar
waybar &>/dev/null & disown

#echo -n

killall hyprpaper 
hyprpaper &>/dev/null & disown
#echo -n

exec $HOME/.config/hypr/scripts/update-mako.sh
