#!/usr/bin/env python

import sys


tmux_cp = \
"""
- copy & paste (buffers):
    enter copy mode: Control+b [
    hit Space to start selection
    hit Enter to end selection
    paste with Control+b ]
"""

tmux_buffers = \
"""
- handle buffers:
    print buffer to terminal: tmux show-buffer
    save buffer to file: tmux save-buffer file.txt
    tmux list-buffers
    tmux show-buffer -b n
    tmux save-buffer -b n file.txt
"""

tmux_session = \
"""
- sessions:
    list sessions: tmux list-session
    attach to session: tmux attach -t n
    attach as grouped sesison: tmux new-session -t n
    detach session: Control+b :detach
    end session: Control+b :kill-session
"""

tmux_window = \
"""
- windows:
    move window to other session: move-window -t target-session:
"""


i3wm_moving_aroung = \
"""
- moving around:
    open terminal: Mod+Enter
    
"""

tmux_tips   = [tmux_cp, tmux_buffers, tmux_session, tmux_window]
vim_tips    = []
i3wm_tips   = []

component_tips_dict = {
        'tmux' : tmux_tips,
        'vim'  : vim_tips,
        'i3wm' : i3wm_tips
        }


def print_title(title):
    print "--------"
    print title
    print "--------"


def print_component(component):
    if component not in component_tips_dict:
        return

    print_title(component.upper())
    for tips in component_tips_dict[component]:
        print tips

 
def print_all():
    for component in component_tips_dict:
        print_component(component)
        print ''


if len(sys.argv) == 1:
    print_all()
    exit(0)


for arg in sys.argv[1:]:
    print_component(arg)

