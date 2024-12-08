#!/usr/bin/env bash

if ! xprop -name "scratchpad-dropdown-123" &> /dev/null; then
    kitty --title scratchpad-dropdown-123 &
    sleep 0.2
fi

i3-msg scratchpad show, move position center
