#!/bin/bash

if pgrep -x fuzzel > /dev/null; then
    pkill fuzzel
else
    choice=$(printf "Shutdown\nReboot\nHibernate\nSuspend" | fuzzel --dmenu	\
       --anchor=bottom-left	\
       --lines=4	\
       --width=7	\
       --font="Sans:size=13"	\
       --background=191919FF	\
       --border-radius=0)
    
    case "$choice" in
    	"Shutdown") systemctl poweroff ;;
    	"Reboot") systemctl reboot ;;
    	"Hibernate") systemctl hibernate ;;
    	"Suspend") systemctl suspend ;;
    	*) exit 0 ;;
    esac
fi
