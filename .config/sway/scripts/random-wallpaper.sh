#!/usr/bin/env bash

# Load variables
source "$HOME/.config/sway/scripts/variables"

# Random wallpaper file
FULL_PATH=$(find "$WALLPAPERS_PATH" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n1)

NEW_WALL=$(basename "$FULL_PATH")

# Update configuration using regex
sed -i "s|bg .* fill|bg $FULL_PATH fill|" "$HOME/.config/sway/config.d/output"

# Generate colors with pywal and refresh
wal -qt -i "$FULL_PATH" --contrast 2.5

sleep 1
exec "$HOME/.config/sway/scripts/refresh.sh"
