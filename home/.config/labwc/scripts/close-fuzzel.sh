#!/bin/bash
if pgrep -x "fuzzel" > /dev/null; then
    wtype -k Escape
fi
