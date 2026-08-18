# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH="/sbin:$PATH"
export FZF_COMPLETION_TRIGGER='\\'
export FZF_DEFAULT_OPTS='--color=16 --bind=ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:page-down,ctrl-b:page-up'

# Auto-launch Labwc on TTY1 login
if [ "$(tty)" = "/dev/tty1" ]; then
    read -p "Start Labwc? (Labwc will start in 5s) [Y/n]: " -n 1 -r -t 5
    echo
    if [[ -z "$REPLY" || "$REPLY" =~ ^[Yy]$ ]]; then
        exec dbus-run-session labwc
    fi
fi
