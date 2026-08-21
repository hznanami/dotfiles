#!/bin/bash

if pgrep -x fuzzel > /dev/null; then
    pkill fuzzel
else
    choice=$(printf "Shutdown\nReboot\nLock Screen\nHibernate\nSuspend" | fuzzel --dmenu	\
       --anchor=bottom-left	\
       --lines=5	\
       --width=8	\
       --font="Sans:size=13"	\
       --background=191919FF	\
       --border-radius=0)
    
    case "$choice" in
    	"Shutdown") systemctl poweroff ;;
    	"Reboot") systemctl reboot ;;
    	"Lock Screen") swaylock ;;
    	"Hibernate") systemctl hibernate ;;
    	"Suspend") systemctl suspend ;;
    	*) exit 0 ;;
    esac
fi
