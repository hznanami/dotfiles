#!/usr/bin/sh

. "${HOME}/.cache/wal/colors.sh"
THEME="${HOME}/.local/share/fcitx5/themes/pywal16/theme.conf"

sed -i "13s/#[0-9a-Z]\+.*$/$color6/g" ${THEME}
sed -i "15,19s/#[0-9a-Z]\+.*$/$color6/g" ${THEME}
sed -i "34s/#[0-9a-Z]\+.*$/$background/g" ${THEME}
sed -i "43s/#[0-9a-Z]\+.*$/${color14}4D/g" ${THEME}
fcitx5 -r
