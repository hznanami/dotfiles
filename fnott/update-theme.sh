#!/bin/sh

. "${HOME}/.cache/wal/colors.sh"

conffile="$HOME/.config/fnott/fnott.ini"

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["background"]="${background}89"
    ["body-color"]="${foreground}FF"
    ["summary-color"]="${foreground}FF"
    ["border-color"]="${color12}FF"
)

fnottctl quit

for color_name in "${!colors[@]}"; do
  # replace first occurance of each color in config file
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $conffile
done

# Delete all # in file
sed -i "s/\#//g" $conffile
fnott
# additionally here you can add some notify-send test notification
