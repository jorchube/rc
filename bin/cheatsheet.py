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
    move window to other session: move-window -t target-session
"""


tmux_tips = [tmux_cp, tmux_buffers, tmux_session, tmux_window]
vim_tips = []

def print_title(title):
    print "--------"
    print title
    print "--------"


def print_tmux():
    print_title("TMUX")
    for tip in tmux_tips:
        print tip


def print_vim():
    print_title("VIM")
    for tip in vim_tips:
        print tip

 
def print_all():
    print_tmux()
    #print_vim()

if len(sys.argv) == 1:
    print_all()

if 'tmux' in sys.argv:
    print_tmux()

if 'vim' in sys.argv:
    print_vim()

