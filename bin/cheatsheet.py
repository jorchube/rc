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

tmux_panes = \
"""
- panes:
    split horizontally: Control+b \"
    split vertically: Control+b %
    move to pane: Control+b arrow_key
    resize pane: Control+b Control+arrow_key
    swap pane position to the left: Contorl+b {
    swap pane position to the right: Contorl+b {
    toggle pane fullscreen: Control+b z
    kill pane: Contorl+b x
"""

tmux_windows = \
"""
- windows:
    create window: Control+b c
    switch to window: Contorl+b session_number
    move window to other session: move-window -t target-session:
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


i3wm_moving_around = \
"""
- launching apps:
    open terminal: Mod+Enter
    application launcher: Mod+d
    close application: Mod+Shift+q
    set split vertical: Mod+v
    set split horizontal: Mod+h
    move to window: Mod+arrow_key
    move to workspace: Mod+workspace_number
    exit i3wm session: Mod+Shift+e
"""

i3wm_layout = \
"""
- layout:
    toggle horizontal/vertical container layout: Mod+e
    toggle tabbed mode: Mod+w
    focus to parent window container mode node: Mod+a
    toggle fullscreen: Mod+f
    move window: Mod+Shift+arroy_key
    move window to workspace: Mod+Shift+workspace_number
"""

i3wm_window = \
"""
- window:
    move floating: Mod+mouse_left_click
    resize floating: Mod+mouse_right_click
    enter resize mode: Mod+r
        resize: Mod+mouse_right_click
    exit resize mode: Esc
"""

tmux_tips   = [tmux_cp, tmux_buffers, tmux_session, tmux_windows, tmux_panes]
vim_tips    = []
i3wm_tips   = [i3wm_moving_around, i3wm_layout, i3wm_window]

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

