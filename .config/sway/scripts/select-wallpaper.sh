#!/usr/bin/env bash

# Load environment variables
source "$HOME/.config/sway/scripts/variables"

# Define the preview script path ($HOME/.local/bin)
PREVIEW_BIN="fzf-preview" 

# Run fzf for interactive selection
NEW_WALL=$(ls "$WALLPAPERS_PATH" | fzf \
    --prompt=" Select Wallpaper: " \
    --preview "bash $PREVIEW_BIN '$WALLPAPERS_PATH/{}'" \
    --preview-window=right:60%:rounded \
    --layout=reverse)

# Check for empty selection
if [ -z "$NEW_WALL" ]; then
    exit 0
fi

FULL_PATH="${WALLPAPERS_PATH%/}/$NEW_WALL"

# Replace the existing configuration
sed -i "s|bg .* fill|bg $FULL_PATH fill|" "$HOME/.config/sway/config.d/output"

# Generate colors with pywal and refresh
wal -qt -i "$FULL_PATH" --contrast 1.0

sleep 1
bash "$HOME/.config/sway/scripts/refresh.sh"
sleep 0.5
