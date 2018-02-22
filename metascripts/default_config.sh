#!/bin/bash

source ./common.include

conf_folder_i3="$HOME/.config/i3"
conf_folder_gtk3="$HOME/.config/gtk-3.0"
conf_folder_dunst="$HOME/.config/dunst"

bashrc="$HOME/.bash_profile"
zshrc="$HOME/.zshrc"
vimrc="$HOME/.vimrc"
vimdir="$HOME/.vim"
tmuxconf="$HOME/.tmux.conf"
i3conf="$conf_folder_i3/config"
i3statusconf="$HOME/.i3status.conf"
comptonconf="$HOME/.config/compton.conf"
xresourcesconf="$HOME/.Xresources"
gtk2conf="$HOME/.gtkrc-2.0"
gtk3conf="$conf_folder_gtk3/settings.ini"
dunstconf="$conf_folder_dunst/dunstrc"

custom_bashrc="$LOCALCONF_PATH/bash.conf"
custom_zshrc="$LOCALCONF_PATH/zsh.conf"
custom_vimrc="$LOCALCONF_PATH/vim.conf"
custom_vimdir="$LOCALCONF_PATH/vim.d"
custom_tmuxconf="$LOCALCONF_PATH/tmux.conf"
custom_i3conf="$LOCALCONF_PATH/i3.conf"
custom_i3statusconf="$LOCALCONF_PATH/i3status.conf"
custom_comptonconf="$LOCALCONF_PATH/compton.conf"
custom_xresourcesconf="$LOCALCONF_PATH/Xresources.conf"
custom_gtk2conf="$LOCALCONF_PATH/gtk2.conf"
custom_gtk3conf="$LOCALCONF_PATH/gtk3.conf"
custom_dunstconf="$LOCALCONF_PATH/dunst.conf"

template_bashrc="$TEMPLATES_PATH/bashrc"
template_zshrc="$TEMPLATES_PATH/zshrc"
template_vimrc="$TEMPLATES_PATH/vimrc"
template_vimdir="$TEMPLATES_PATH/vim"
template_tmuxconf="$TEMPLATES_PATH/tmux.conf"
template_i3conf="$TEMPLATES_PATH/i3config"
template_i3statusconf="$TEMPLATES_PATH/i3status.conf"
template_comptonconf="$TEMPLATES_PATH/compton.conf"
template_xresourcesconf="$TEMPLATES_PATH/Xresources"
template_gtk2conf="$TEMPLATES_PATH/gtkrc-2.0"
template_gtk3conf="$TEMPLATES_PATH/gtk3.settings.ini"
template_dunstconf="$TEMPLATES_PATH/dunstrc"

template_main_config="$TEMPLATES_PATH/config.sh"

oldext="old"

function prepare {
	if [[ -e $1 ]]; then
		mv $1 $1.$oldext
		echo -n "Preexisting $1 has been renamed to $1.$oldext ... "
	fi
}


function set_config_file {
	cp $template_main_config $HOME/.rc/local.conf.d/config.sh
}

function set_component {
    system_component=$1
    custom_config=$2
    template=$3

	echo -n "Preparing $system_component ..."

    prepare "$system_component"

    if [ -d "$template" ]; then
        cp -r "$template" "$custom_config"
    else
        cp "$template" "$custom_config"
    fi

    rm -rf "$system_component" 2> /dev/null

    ln -s "$custom_config" "$system_component"

    echo " OK"
}

function set_all_components {
    set_component "$bashrc"         "$custom_bashrc"        "$template_bashrc"
    set_component "$zshrc"          "$custom_zshrc"         "$template_zshrc"
    set_component "$vimrc"          "$custom_vimrc"         "$template_vimrc"
    set_component "$vimdir"         "$custom_vimdir"        "$template_vimdir"
    set_component "$tmuxconf"       "$custom_tmuxconf"      "$template_tmuxconf"
    set_component "$i3conf"         "$custom_i3conf"        "$template_i3conf"
    set_component "$i3statusconf"   "$custom_i3statusconf"  "$template_i3statusconf"
    set_component "$comptonconf"    "$custom_comptonconf"   "$template_comptonconf"
    set_component "$xresourcesconf" "$custom_xresourcesconf" "$template_xresourcesconf"
    set_component "$gtk2conf"    "$custom_gtk2conf"   "$template_gtk2conf"
    set_component "$gtk3conf"    "$custom_gtk3conf"   "$template_gtk3conf"
    set_component "$dunstconf"    "$custom_dunstconf"   "$template_dunstconf"
}

mv "$LOCALCONF_PATH" "$LOCALCONF_PATH.$oldext"
mkdir "$LOCALCONF_PATH"

mkdir "$conf_folder_i3" 2> /dev/null
mkdir "$conf_folder_gtk3" 2> /dev/null
mkdir "$conf_folder_dunst" 2> /dev/null

set_all_components
set_config_file
