#!/usr/bin/env bash

FULL_PATH="$1"

if [ -z "$FULL_PATH" ] || [ ! -f "$FULL_PATH" ]; then
    notify-send -r 107 -u critical "swayimg" "Invalid or missing file: $FULL_PATH"
    exit 1
fi

sed -i "s|bg .* fill|bg $FULL_PATH fill|" "$HOME/.config/sway/config.d/output"

wal -qt -i "$FULL_PATH"

sleep 1

bash "$HOME/.config/sway/scripts/refresh.sh"

sleep 0.5
