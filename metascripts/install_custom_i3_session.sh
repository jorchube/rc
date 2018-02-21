#!/bin/bash

cp "$HOME/.rc/i3wm/session_launcher.sh" "$HOME/.rc/local.conf.d/session_launcher.sh" 

sudo rm /usr/share/xsessions/i3-custom-session.desktop 2> /dev/null
sudo rm /usr/share/applications/i3-custom-session-lockscreen.desktop 2> /dev/null

sudo ln -s ~/.rc/i3wm/i3-custom-session.desktop /usr/share/xsessions/i3-custom-session.desktop
sudo ln -s ~/.rc/i3wm/i3-custom-session-lockscreen.desktop /usr/share/applications/i3-custom-session-lockscreen.desktop
