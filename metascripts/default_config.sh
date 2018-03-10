#!/bin/bash

source ./common.include

function prepare {
	if [[ -e $1 ]]; then
		mv $1 $1.$oldext
		echo -n "Preexisting $1 has been renamed to $1.$oldext ... "
	fi
}


function set_config_files {
	cp $template_sh_config $custom_sh_config
    cp $template_ui_config $custom_ui_config
}

function set_component {
    system_component=$1
    custom_config=$2
    template=$3

	echo -n "Preparing $custom_config ..."

    prepare "$system_component"

    if [ -d "$template" ]; then
        cp -r "$template" "$custom_config"
    else
        cp "$template" "$custom_config"
    fi

    if [ -e "$system_component" ]; then
        rm -rf "$system_component" 2> /dev/null
        ln -s "$custom_config" "$system_component"
    fi
    
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
    set_component "$gtk2conf"       "$custom_gtk2conf"      "$template_gtk2conf"
    set_component "$gtk3conf"       "$custom_gtk3conf"      "$template_gtk3conf"
    set_component "$dunstconf"      "$custom_dunstconf"     "$template_dunstconf"
    set_component "$roficonf"       "$custom_roficonf"      "$template_roficonf"
}

mv "$LOCALCONF_PATH" "$LOCALCONF_PATH.$oldext"
mkdir "$LOCALCONF_PATH"

mkdir "$conf_folder_i3" 2> /dev/null
mkdir "$conf_folder_gtk3" 2> /dev/null
mkdir "$conf_folder_dunst" 2> /dev/null

set_all_components
set_config_files
