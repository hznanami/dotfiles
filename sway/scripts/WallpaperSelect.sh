#!/bin/bash
# WALLPAPER PATH
DIR=$HOME/Pictures/wallpaper
# Transition config
#FPS=30
#TYPE="simple"
#DURATION=3
#SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# Check if swaybg is running
# if pidof swaybg >/dev/null; then
#	pkill swaybg
# fi

# Retrieve image files
PICS=($(ls "${DIR}" | grep -E ".jpg$|.jpeg$|.png$|.gif$"))
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME="${#PICS[@]}. random"

# Wofi command
wofi_command="wofi -dmenu"

menu() {
	for i in "${!PICS[@]}"; do
		# Displaying .gif to indicate animated images
		if [[ -z $(echo "${PICS[$i]}" | grep .gif$) ]]; then
			printf "$i. $(echo "${PICS[$i]}" | cut -d. -f1)\n"
		else
			printf "$i. ${PICS[$i]}\n"
		fi
	done

	printf "$RANDOM_PIC_NAME"
}

# swww query || swww init

main() {
	choice=$(menu | ${wofi_command})

	# No choice case
	if [[ -z $choice ]]; then
		exit 0
	fi

	# Random choice case
	if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
		swaybg -i "${DIR}/${RANDOM_PIC}"
		exit 0
	fi

	pic_index=$(echo "$choice" | cut -d. -f1)
	swaybg -i "${DIR}/${PICS[$pic_index]}"
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
	pkill wofi
	exit 0
fi

main

$HOME/.config/hypr/scripts/pywalswaybg.sh &
$HOME/.config/hypr/scripts/Refresh.sh
