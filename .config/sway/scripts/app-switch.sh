#!/bin/bash
. "${HOME}/.cache/wal/colors-wmenu-sh"

# 获取所有窗口的信息，只显示应用ID和窗口名称
windows=$(swaymsg -t get_tree --raw | jq -r '
  .. | select(.pid? and .app_id != null) | 
  {name: .name, id: .id, app_id: .app_id, workspace: (.workspace // .output)} | 
  "\(.app_id) - \(.name)|\(.id)|\(.workspace // "")"
')

# 使用 wofi 显示窗口列表并获取用户选择
selected=$(echo "$windows" | cut -d'|' -f1 | wmenu -l 10 -p "Switch to:" -i -f "Source Sans 3 Bold 12.5" -S $color1 -n $color1 -M $color1 -N $background)

if [ ! -z "$selected" ]; then
    # 找到完整的选中行
    full_line=$(echo "$windows" | grep "^$selected")
    
    id=$(echo "$full_line" | cut -d'|' -f2)
    workspace=$(echo "$full_line" | cut -d'|' -f3)

    # 如果工作区不为空，则切换到该工作区
    if [ ! -z "$workspace" ]; then
        swaymsg workspace "${workspace}"
    fi

    # 聚焦到选中的窗口
    swaymsg [con_id="${id}"] focus
fi
