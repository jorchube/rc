#!/bin/bash

#------------------------
# XSERVER CLIENTS OPTIONS
#------------------------
xrdb -merge ./.Xresources


#----------------------
# DAEMONS AND SERVICES
#----------------------
compton &
pasystray &
nm-applet &


#-------------------------
# MONITOR(S) CONFIGURATION
#-------------------------
# To list available monitors and properties execute:
# xrandr --listmonitors 

# example commands:

# query all outputs and enable them with their default mode:
#xrandr --auto

# simple setup:
# xrandr --output VGA1 --right-of LVDS1

# complex setup:
# xrandr --output HDMI-2 --mode 1920x1080 --rate 60.00 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of HDMI-2 --output eDP-1 --mode 1360x768 --rate 59.80 --left-of HDMI-2 


#------------------
# DESKTOP WALLPAPER
#------------------
# feh --bg-scale ~/.rc/local.conf.d/wallpaper.png 


#---------------
# WINDOW MANAGER
#---------------
#This can not run in bg; thus has to be started last:
i3
