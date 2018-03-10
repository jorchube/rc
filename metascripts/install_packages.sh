#!/bin/bash

GAPS_FOLDER=gaps
COMPTON_FOLDER=compton
FONTAWESOME_PACKAGE=fa.zip
FONTAWESOME_FOLDER=fa
FONTAWESOME_TARGET="Font Awesome 5 Free-Solid-900.otf"


# repository packages and dependencies
sudo apt update
sudo apt install lightdm compton network-manager network-manager-gnome dunst pcmanfm mate-terminal x11-xserver-utils feh git libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev pasystray pulseaudio pulseaudio-utils pavucontrol pavumeter wget gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils libcap2 gpicview file-roller i3status i3lock suckless-tools libnss3 gnupg libxkbfile1 libgconf-2-4 libsecret-1-0 libxrandr-dev libxcomposite-dev libxfixes-dev libxdamage-dev libxinerama-dev libconfig-dev libdbus-1-dev mesa-common-dev libgl1-mesa-dev rofi unzip bc


# external packages:
cd /tmp

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

#fontawesome
mkdir ~/.local/share/fonts 2> /dev/null
wget https://use.fontawesome.com/releases/v5.0.7/fontawesome-free-5.0.7.zip -O $FONTAWESOME_PACKAGE
unzip -j $FONTAWESOME_PACKAGE -d $FONTAWESOME_FOLDER
cp "$FONTAWESOME_FOLDER/$FONTAWESOME_TARGET" ~/.local/share/fonts
rm -rf $FONTAWESOME_FOLDER
rm -rf $FONTAWESOME_PACKAGE
fc-cache
