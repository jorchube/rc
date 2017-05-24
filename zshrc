autoload -U compinit promptinit
compinit
promptinit
autoload -U colors && colors

setopt PROMPT_SUBST
setopt APPEND_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

source ~/.rc/config.sh

export TERM=$ORG_JORCHUBE_RC_TERM
export EDITOR=$ORG_JORCHUBE_RC_EDITOR

source ~/.rc/includes.list

