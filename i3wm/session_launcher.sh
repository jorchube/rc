#!/bin/bash

xrdb -merge ./.Xresources
/usr/bin/compton &
/usr/bin/nm-applet &

sleep 1

#This can not run in bg; thus has to be started last:

# Upstream:
#/usr/bin/i3

#i3-gaps:
/opt/bin/i3
