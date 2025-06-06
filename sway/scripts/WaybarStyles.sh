#!/bin/bash

# ACTUAL THEME
THEMEIS=$(realpath ~/.config/waybar/style.css | sed 's/.*-\(.*\)\.css/\1/')

# Array for the styles
STYLES=(
"pywal"
"dark"
"light"
"Black-&-White"
"colors" 
"colors-border"
"colors-line"
"colorful"
"catppuccin-mocha"
"catppuccin-latte"  
	)

# Build ROFI
SELECTED_STYLE=$(printf "%s\n" "${STYLES[@]}" | rofi -dmenu -config ~/.config/rofi/config-waybar.rasi "${#STYLES[@]}")

# Here you verify the selected theme
if [[ " ${STYLES[@]} " =~ " $SELECTED_STYLE " ]]; then
    SWITCHTO="${SELECTED_STYLE}"
else
    echo "It is not valid =c"
    exit 1
fi

# APPLY THEME
THEMEFILE="$HOME/.config/waybar/style/style-${SWITCHTO}.css"
if [ -f "$THEMEFILE" ]; then
    ln -sf "$THEMEFILE" "$HOME/.config/waybar/style.css"


else
    echo "Error: $THEMEFILE not found"
    exit 1
fi

_ps=(waybar mako dunst)
for _prs in "${_ps[@]}"; do
    if [[ $(pidof ${_prs}) ]]; then
        pkill ${_prs}
    fi
done

exec ~/.config/hypr/scripts/Refresh.sh
