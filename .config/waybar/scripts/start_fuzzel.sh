#!/bin/bash

if pgrep -x "fuzzel" > /dev/null; then
	pkill fuzzel
else
	fuzzel --anchor=bottom-left \
		--font="Sans:size=15"	\
		--width=15	\
		--border-radius=0	\
		--background=191919FF
fi
