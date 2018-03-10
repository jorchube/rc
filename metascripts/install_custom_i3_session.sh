#!/bin/bash

source ./common.include

USERNAME="$(whoami)"
USERNAME_PLACEHOLDER="__USERNAME__"

sudo rm /usr/share/xsessions/i3-custom-session.desktop 2> /dev/null
sudo rm /usr/share/applications/i3-custom-session-lockscreen.desktop 2> /dev/null

cp "$TEMPLATES_PATH/session_launcher.sh" "$LOCALCONF_PATH/session_launcher.sh" 
cp "$TEMPLATES_PATH/i3-custom-session-lockscreen.desktop" "$LOCALCONF_PATH/i3-custom-session-lockscreen.desktop"
cp "$TEMPLATES_PATH/i3-custom-session-reboot.desktop" "$LOCALCONF_PATH/i3-custom-session-reboot.desktop"
cp "$TEMPLATES_PATH/i3-custom-session-shutdown.desktop" "$LOCALCONF_PATH/i3-custom-session-shutdown.desktop"
cp "$TEMPLATES_PATH/i3-custom-session-suspend.desktop" "$LOCALCONF_PATH/i3-custom-session-suspend.desktop"

sed "s/$USERNAME_PLACEHOLDER/$USERNAME/g" "$TEMPLATES_PATH/i3-custom-session.desktop" > "$LOCALCONF_PATH/i3-custom-session.desktop"

sudo ln -s $LOCALCONF_PATH/i3-custom-session.desktop /usr/share/xsessions/i3-custom-session.desktop
sudo ln -s $LOCALCONF_PATH/i3-custom-session-lockscreen.desktop /usr/share/applications/i3-custom-session-lockscreen.desktop
sudo ln -s $LOCALCONF_PATH/i3-custom-session-reboot.desktop /usr/share/applications/i3-custom-session-reboot.desktop
sudo ln -s $LOCALCONF_PATH/i3-custom-session-shutdown.desktop /usr/share/applications/i3-custom-session-shutdown.desktop
sudo ln -s $LOCALCONF_PATH/i3-custom-session-suspend.desktop /usr/share/applications/i3-custom-session-suspend.desktop
