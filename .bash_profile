# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi


PATH="$HOME/.local/bin:${PATH}"
export FZF_DEFAULT_OPTS='--color=16'
export FZF_COMPLETION_TRIGGER='\\'
export FZF_DEFAULT_OPTS="--bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:page-down,ctrl-b:page-up'"

# Auto-launch Sway on TTY1 login
if [ "$(tty)" = "/dev/tty1" ]; then
    read -p "Start Sway? (Sway will start in 5s) [Y/n]: " -n 1 -r -t 5
    echo
    if [[ -z "$REPLY" || "$REPLY" =~ ^[Yy]$ ]]; then
        export LANG=zh_CN.UTF-8
        export XDG_CURRENT_DESKTOP=sway
        export WLR_RENDERER=vulkan
        exec dbus-launch --exit-with-session sway --unsupported-gpu
    fi
fi
