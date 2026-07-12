#!/bin/bash
. "${HOME}/.cache/wal/colors-wmenu-sh"

windows=$(swaymsg -t get_tree --raw | jq -r '
  .. | select(.pid? and .app_id != null) | 
  {name: .name, id: .id, app_id: .app_id, workspace: (.workspace // .output)} | 
  "\(.app_id) - \(.name)  #\(.id)|\(.id)|\(.workspace // "")"
')

selected=$(echo "$windows" | cut -d'|' -f1 | wmenu -l 10 -p "Switch to:" -i -f "Source Sans 3 Bold 12.5" -S $color1 -n $color1 -M $color1 -N $background)

if [ ! -z "$selected" ]; then
    full_line=$(echo "$windows" | awk -F'|' -v sel="$selected" '$1 == sel {print; exit}')
    
    id=$(echo "$full_line" | cut -d'|' -f2)
    workspace=$(echo "$full_line" | cut -d'|' -f3)

    if [ ! -z "$workspace" ]; then
        swaymsg workspace "${workspace}"
    fi

    swaymsg [con_id="${id}"] focus
fi
