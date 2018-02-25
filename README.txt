This project is a collection of scripts intended to simplify a minimal working setup with i3 as a desktop/window manager and a few apps. It installs packages such as:
    
    - i3-gaps (window manager)
    - compton* (compositing manager)
    - pcmanfm (file manager)
    - file-roller (compressor/decompressor)
    - nm-applet (network maanger)
    - atom (text editor)
    - gpicview (image viewer)
    - pulseaudio systray (sound manager applet)
    - mate-terminal (terminal emulator)

* The version of compton installed is a fork created of the original one, with a patch written by me to add support for a different shadow color in focused windows.

Furthermore, The installation script makes all the relevant configuration files appear under a single folder: ~/.rc/local.conf.d for easier accessibility.



------------
INSTALLATION
------------

Run metascripts/full_setup.h for a full install.
(aa user configured properly with sudo is a requirement at this point)

This includes:
    install_packages.sh: Installs all needed (and some optional) packages

    default_config.sh: Creates the folder containing the configurations used by each one of the packages installed

    install_custom_i3_session.sh: Installs several .desktop files in order to be able to start a desktop sesssion with a desktop manager



-------------
CONFIGURATION
-------------

Configuration files:

After installation, the folder local.conf.d will be created containing the respective configuration files used by the packages installed. This includes configuration files for:
    gtk2
    gtk3
    compton (compositing manager that provides transparency, shadows, and other nice things for the window manager)
    i3
    i3status (the statusbar / panel of the desktop)
    Xresources (x11 configuration: dpi, cursor size, font size, aliasing, hinting, etc)
    bash
    zsh
    vim
    tmux
    dunst (desktop notifications provider)

There is also a config.sh which enables some features both for bash and zsh


Session management:

The file local.donf.d/session_launcher.h launches the various daemons and programs that are to be started with the session. This is where other commands and programs should be placed to be started during the session init.


(All credits to the authors)
