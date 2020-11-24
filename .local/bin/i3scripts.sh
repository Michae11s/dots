#!/usr/bin/env bash

# restart the top bar
killall -q polybar
polybar top & &> /dev/null 2>&1

# kill and start the compositor
pkill picom
sleep 0.2
picom --config ~/.config/picom/config & &> /dev/null 2>&1

# restart the notification daemon
pkill dunst
dunst & > /dev/null 2>&1

# disown all the subprocesses
disown
