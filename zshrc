autoload -U compinit promptinit
compinit
promptinit
autoload -U colors && colors

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#export TERM="screen-256color"
#export TERM="xterm-256color"


source ~/.rc/include/zsh_prompt
source ~/.rc/include/zsh_options
source ~/.rc/include/zsh_func
source ~/.rc/include/sh_alias_base

