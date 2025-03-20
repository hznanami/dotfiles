#!/usr/bin/env bash

source $HOME/.config/hypr/scripts/variables

NEW_WALL=$(find $WALLPAPERS_PATH -type f | shuf -n 1)


# Muy manual pero ya buscaré una manera mas sofisticada

echo '' > $(echo $HYPR_DIR)
echo "preload = $NEW_WALL" >> $(echo $HYPR_DIR)
echo "wallpaper =,$NEW_WALL" >> $(echo $HYPR_DIR)
echo "splash = false" >> $(echo $HYPR_DIR)


cp -rf $NEW_WALL ~/.cache/hyprpaper/current_wallpaper

wal -q -i $NEW_WALL -o $HOME/.config/hypr/scripts/reload.sh
