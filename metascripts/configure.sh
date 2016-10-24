#!/bin/bash

bashrc="$HOME/.bash_profile"
vimrc="$HOME/.vimrc"
vimdir="$HOME/.vim"
zshrc="$HOME/.zshrc"
tmuxconf="$HOME/.tmux.conf"

oldext="old"

function prepare {
	echo "Preparing $1"
	if [[ -e $1 ]]; then
		mv $1 $1.$oldext
		echo "Preexisting $1 has been renamed to $1.$oldext"
	fi
}

function main {
	prepare $bashrc
	ln -s $HOME/.rc/bashrc $bashrc
	prepare $vimrc
	ln -s $HOME/.rc/vimrc $vimrc
	prepare $vimdir
	ln -s $HOME/.rc/vim $vimdir
	prepare $zshrc
	ln -s $HOME/.rc/zshrc $zshrc
	prepare $tmuxconf
	ln -s $HOME/.rc/tmux.conf $tmuxconf
}

function dbg {
	testrc="$HOME/testrc"
	prepare $testrc
	ln -s $HOME/.rc/testrc $testrc
}

#dbg
main
