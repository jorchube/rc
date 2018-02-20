#!/bin/bash

#/usr/bin/xfsettingsd &
#/usr/bin/xsettingsd &
xrdb -merge ./.Xresources
/usr/bin/compton &
/usr/bin/nm-applet &

sleep 1
#This can not run in bg; thus has to be started last
#/usr/bin/i3 
/opt/bin/i3
