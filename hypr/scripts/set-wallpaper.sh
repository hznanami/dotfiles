#!/usr/bin/env bash

source $HOME/.config/hypr/scripts/variables

if [ -z "$1" ]; then
  echo "Error: Debes proporcionar el path del wallpaper \$1."
  exit 1
fi

# Muy manual pero ya buscaré una manera mas sofisticada

echo '' > $(echo $HYPR_DIR)
echo "preload = $1" >> $(echo $HYPR_DIR)
echo "wallpaper =,$1" >> $(echo $HYPR_DIR)

cp -rf $1 ~/.cache/hyprpaper/current_wallpaper

wal -q -i $1 
sh ~/.config/hypr/scripts/reload.sh

exit 0
