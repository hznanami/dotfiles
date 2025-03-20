#!/bin/bash

DIR=$HOME/Pictures/wallpaper
PICS=($(find ${DIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

change_swaybg() {
	pkill swaybg
	echo set \$WALLPAPER ${RANDOMPICS} | tee $HOME/.cache/swaybg/setwallpaper
	echo ${RANDOMPICS} | tee $HOME/.cache/swaybg/wallpaperid
	#swaybg -m fill -i ${RANDOMPICS}
}

change_current() {
	if pidof swaybg >/dev/null; then
		change_swaybg
	fi
}

switch() {
	if pidof swaybg >/dev/null; then
		change_swaybg
	fi
}

case "$1" in
"swaybg")
	change_swaybg
	;;
"s")
	switch
	;;
*)
	change_current
	;;
esac

exec $HOME/.config/sway/scripts/pywalswaybg.sh &
sleep 1
exec $HOME/.config/sway/scripts/Refresh.sh
