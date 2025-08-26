#!/bin/bash

SCRIPTSDIR=$HOME/.config/sway/scripts

# Kill already running process
#_ps=(waybar)
#for _prs in "${_ps[@]}"; do
#	if [[ $(pidof ${_prs}) ]]; then
#		pkill ${_prs}
#	fi
#done

# Lauch notification daemon (mako)
$HOME/.config/mako/update-theme.sh &

# Lauch fcitx5
$HOME/.config/sway/scripts/fcitx5-pywal.sh &

# Lauch statusbar (waybar)
#${SCRIPTSDIR}/Waybar.sh &
sleep 0.5 && swaymsg reload
