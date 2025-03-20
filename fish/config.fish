# if status is-interactive
#     # Commands to run in interactive sessions can go here
#     if test -e ~/.cache/wal/colors.fish
#     	cat .cache/wal/sequences &
#         source ~/.cache/wal/colors.fish
#     end
# end

# Yazi
function ra
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Environment
# export EDITOR=nvim

# Alias config
alias q=exit
alias vim=nvim

# fzf
# Set up fzf key bindings
# fzf --fish | source \
