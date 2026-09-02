#!/bin/bash

ICON_MUTED=" " 
ICON_LOW="  "
ICON_MID="  "
ICON_HIGH="   "
ICON_MIC=" "
ICON_MIC_MUTED=" "

# Get Volume
get_volume() {
	volume=$(awk "{print $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f 2) * 100}" <<< '')
	echo "$volume"
}

# Get icon character based on volume
get_icon() {
	current=$(get_volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$ICON_MUTED"
	elif [[ "$current" -le "30" ]]; then
		echo "$ICON_LOW"
	elif [[ "$current" -le "60" ]]; then
		echo "$ICON_MID"
	else
		echo "$ICON_HIGH"
	fi
}

notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$(get_icon) $(get_volume)%"
}

# Increase Volume
inc_volume() {
	wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+ && notify_user && pkill -SIGRTMIN+1 i3blocks
}

# Decrease Volume
dec_volume() {
	wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%- && notify_user && pkill -SIGRTMIN+1 i3blocks
}

# Toggle Mute
toggle_mute() {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
		notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_MUTED Mute"
	else
		notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$(get_icon) $(get_volume)%"
	fi
	pkill -SIGRTMIN+1 i3blocks
}

# Toggle Mic
toggle_mic() {
	if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
		pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_MIC_MUTED Microphone OFF"
	elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
		pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_MIC Microphone ON"
	fi
}

# Get mic icon
get_mic_icon() {
	echo "$ICON_MIC"
}

# Notify Mic
notify_mic_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_MIC Mic-Level: $(pamixer --default-source --get-volume)%"
}

# Increase MIC Volume
inc_mic_volume() {
	pamixer --default-source -i 5 && notify_mic_user
}

# Decrease MIC Volume
dec_mic_volume() {
	pamixer --default-source -d 5 && notify_mic_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
elif [[ "$1" == "--get-mic-icon" ]]; then
	get_mic_icon
elif [[ "$1" == "--mic-inc" ]]; then
	inc_mic_volume
elif [[ "$1" == "--mic-dec" ]]; then
	dec_mic_volume
else
	get_volume
fi
