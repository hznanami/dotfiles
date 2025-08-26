# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# PS1='\[\e[01;32m\]\u [\W] \$\[\e[00m\] '
PS1=' \[\e[01;31m\]\W \[\e[00m\]> '
# Put your fun stuff here.
complete -F _root_command doas
# alias poweroff='doas poweroff'
# alias reboot='doas reboot'
# alias poweroff='doas poweroff'
# alias reboot='doas reboot'
#

# Vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert 'Control-n: next-history'
bind -m vi-insert 'Control-p: previous-history'

# Alias
alias vim=nvim
alias q=exit

# History
HISTSIZE=2000
HISTFILESIZE=40000
HISTCONTROL=ignoreboth      # ignore identical or empty lines in history

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

# yazi
function ra() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf
# source /usr/share/bash-completion/completions/fzf
# source /usr/share/fzf/key-bindings.bash
eval "$(fzf --bash)"
