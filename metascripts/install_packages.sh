#!/bin/bash

GAPS_FOLDER=gaps
COMPTON_FOLDER=compton
ATOM_PACKAGE=atom.deb


# repository packages and dependencies
sudo apt update
sudo apt install lightdm compton network-manager network-manager-gnome dunst pcmanfm mate-terminal x11-xserver-utils feh git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev pasystray pulseaudio pulseaudio-utils pavucontrol pavumeter wget gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils libcap2 gpicview file-roller i3status i3lock suckless-tools libnss3 gnupg libxkbfile1 libgconf-2-4 libsecret-1-0 libxrandr-dev libxcomposite-dev libxfixes-dev libxdamage-dev libxinerama-dev libconfig-dev libdbus-1-dev mesa-common-dev libgl1-mesa-dev


# external packages:
cd /tmp


# atom editor
wget https://atom.io/download/deb -O $ATOM_PACKAGE
sudo dpkg -i $ATOM_PACKAGE
rm -rf $ATOM_PACKAGE


# i3-gaps
git clone https://github.com/Airblader/i3.git $GAPS_FOLDER
cd $GAPS_FOLDER
autoreconf --force --install
rm -rf build/
mkdir -p build
cd build/
../configure --prefix=/usr/local --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd /tmp
rm -rf /tmp/$GAPS_FOLDER


#compton-focus-shadow
git clone https://github.com/jorchube/compton.git $COMPTON_FOLDER
cd $COMPTON_FOLDER
make
sudo cp compton /usr/local/bin/
cd /tmp
rm -rf $COMPTON_FOLDER


