#!/usr/bin/env bash

source $HOME/.config/hypr/scripts/variables

NEW_WALL=$(ls $WALLPAPERS_PATH | wofi --dmenu --allow-images true)


echo '' > $(echo $HYPR_DIR)
echo "preload = $WALLPAPERS_PATH$NEW_WALL" >> $(echo $HYPR_DIR)
echo "wallpaper =,$WALLPAPERS_PATH$NEW_WALL" >> $(echo $HYPR_DIR)
echo "splash = false" >> $(echo $HYPR_DIR)

cp -rf $WALLPAPERS_PATH$NEW_WALL  ~/.cache/hyprpaper/current_wallpaper

wal -q -i $WALLPAPERS_PATH$NEW_WALL 
sh $HOME/.config/hypr/scripts/reload.sh
