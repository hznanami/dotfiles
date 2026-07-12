#!/bin/bash
. "${HOME}/.cache/wal/colors-wmenu-sh"

windows=$(swaymsg -t get_tree --raw | jq -r '
  .. | select(.pid? and .app_id != null) | 
  {name: .name, id: .id, app_id: .app_id, workspace: (.workspace // .output)} | 
  "\(.app_id) - \(.name)  #\(.id)|\(.id)|\(.workspace // "")"
')

TOTAL_ITEMS=$(echo "$windows" | wc -l)

LINES_PER_PAGE=10

if [ "$TOTAL_ITEMS" -lt "$LINES_PER_PAGE" ]; then
    DISPLAY_LINES=$TOTAL_ITEMS
else
    DISPLAY_LINES=$LINES_PER_PAGE
fi

WMENU_ARGS="-l $DISPLAY_LINES"

selected=$(echo "$windows" | cut -d'|' -f1 | wmenu $WMENU_ARGS -p "Switch to:" -i -f "Source Sans 3 Bold 13.5" -S $color6 -s $background -n $color6 -M $color6 -N $background -m $background)

if [ ! -z "$selected" ]; then
    full_line=$(echo "$windows" | awk -F'|' -v sel="$selected" '$1 == sel {print; exit}')
    
    id=$(echo "$full_line" | cut -d'|' -f2)
    workspace=$(echo "$full_line" | cut -d'|' -f3)

    if [ ! -z "$workspace" ]; then
        swaymsg workspace "${workspace}"
    fi

    swaymsg [con_id="${id}"] focus
fi
