#!/usr/bin/env bash

# restart polybar
killall -q polybar
polybar top & &> /dev/null 2>&1

pkill picom
picom --config ~/.config/picom/config & &> /dev/null 2>&1
disown
