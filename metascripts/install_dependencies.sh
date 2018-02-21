#!/bin/bash

GAPS_FOLDER=gaps

sudo apt update
sudo apt install lightdm compton i3 network-manager network-manager-gnome dunst pcmanfm mate-terminal x11-xserver-utils feh git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev


git clone https://github.com/Airblader/i3.git /tmp/$GAPS_FOLDER

cd /tmp/$GAPS_FOLDER

autoreconf --force --install
rm -rf build/
mkdir -p build

cd build/
../configure --prefix=/opt --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd /tmp
rm -rf /tmp/$GAPS_FOLDER
