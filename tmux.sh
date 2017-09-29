#!/bin/bash

if tmux has-session -t dot 2> /dev/null; then
	tmux attach -t dot
	exit
fi

tmux new-session -d -s dot -c ~/Dropbox/.dotfiles -n '·' 'vim'
tmux split-window -h -c ~/Dropbox/.dotfiles 'zsh'
tmux new-window -n '|~|' 'vim'
tmux new-window -n '[=]' 'ranger'
tmux split-window -v
tmux -2 attach-session -d
