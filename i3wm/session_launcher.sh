#!/bin/bash

xrdb -merge ./.Xresources
/usr/bin/compton &
/usr/bin/nm-applet &

#xrandr --output HDMI-2 --mode 1920x1080 --rate 60.00 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of HDMI-2 --output eDP-1 --mode 1360x768 --rate 59.80 --left-of HDMI-2 

sleep 1

#This can not run in bg; thus has to be started last:

# Upstream:
/usr/bin/i3

#i3-gaps:
#/opt/bin/i3
