#!/bin/bash


#
#
# Example configuration file. Place it at ~/.rc/config.sh
#
#

source ~/.rc/etc/prechecks

# Configuration variables for all of the possible settings on this rc bundle of scripts
# (Besides app-specific)


# Use tmux as shell at terminal launch (1 = enabled, 0 = disabled)
ORG_JORCHUBE_RC_TMUX_AS_SHELL=0


# Terminal type to be announced by the terminal application
ORG_JORCHUBE_RC_TERM=xterm-256color


# Default editor for the terminal
ORG_JORCHUBE_RC_EDITOR=vim


# Prompt: (These two are not compatible)
source ~/.rc/etc/prompt_definitions
ORG_JORCHUBE_RC_PROMPT=$MINI_COLOR
ORG_JORCHUBE_RC_DYNAMIC_PROMPT=0


# Force a default terminal size at startup
ORG_JORCHUBE_RC_FORCE_SIZE=0
ORG_JORCHUBE_RC_HEIGHT=550
ORG_JORCHUBE_RC_WIDTH=800

