#!/bin/bash

bashrc="$HOME/.bash_profile"
zshrc="$HOME/.zshrc"
vimrc="$HOME/.vimrc"
vimdir="$HOME/.vim"
tmuxconf="$HOME/.tmux.conf"
i3conf="$HOME/.config/i3/config"
comptonconf="$HOME/.config/compton.conf"


custom_bashrc="$HOME/.rc/bashrc"
custom_zshrc="$HOME/.rc/zshrc"
custom_vimrc="$HOME/.rc/vimrc"
custom_vimdir="$HOME/.rc/vim"
custom_tmuxconf="$HOME/.rc/tmuxconf"
custom_i3conf="$HOME/.rc/i3wm/i3config"
custom_comptonconf="$HOME/.rc/i3wm/compton.conf"

configexample="$HOME/.rc/sample/config.sh.example"

oldext="old"

function prepare {
	if [[ -e $1 ]]; then
		mv $1 $1.$oldext
		echo -n "Preexisting $1 has been renamed to $1.$oldext ... "
	fi
}


function set_config_file {
	cp $configexample $HOME/.rc/config.sh 
}

function set_component {
    system_component=$1
    custom_config=$2

	echo -n "Preparing $system_component ..."

    prepare "$system_component"
    ln -s "$custom_config" "$system_component"

    echo " OK"
}

function set_all_components {
    set_component "$bashrc"         "$custom_bashrc"
    set_component "$zshrc"          "$custom_zshrc"
    set_component "$vimrc"          "$custom_vimrc"
    set_component "$vimdir"         "$custom_vimdir"
    set_component "$tmuxconf"       "$custom_tmuxconf"
    set_component "$i3conf"         "$custom_i3conf"
    set_component "$comptonconf"    "$custom_comptonconf"

}

function dbg {
	testrc="$HOME/testrc"
    custom_testrc="$HOME/.rc/testrc"

    set_component "$testrc" "$custom_testrc"
}

#dbg
set_all_components
set_config_file
