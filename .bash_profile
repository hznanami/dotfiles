# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi


PATH="$HOME/.local/bin:${PATH}"
export FZF_DEFAULT_OPTS='--color=16'
export FZF_COMPLETION_TRIGGER='\\'


# Start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	export LANG=zh_CN.UTF-8
	# export QT_IM_MODULE=fcitx
	# export GTK_IM_MODULE=fcitx
	# export XMODIFIERS=@im=fcitx
	# export SDL_IM_MODULE=fcitx
	# export INPUT_METHOD=fcitx
	# export GLFW_IM_MODULE=ibus
	# export LANG=zh_CN.UTF-8
	# export GDK_SCALE=1.25
	# export QT_SCALE_FACTOR=1.25
	# export QT_QPA_PLATFORMTHEME=qt6ct
    # export GPG_TTY=$(tty)
	export QSG_RHI_BACKEND=vulkan
	export XDG_CURRENT_DESKTOP=sway
	# export XCURSOR_SIZE=24
	export WLR_RENDERER=vulkan
	# export TERM=foot
	exec dbus-launch --exit-with-session sway --unsupported-gpu
fi
