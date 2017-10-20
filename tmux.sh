#!/bin/bash

if tmux has-session -t dot 2> /dev/null; then
	tmux attach -t dot
	exit
fi

tmux new-session -d -s dot -c ~/Dropbox/.dotfiles -n '·~·'
tmux send-keys 'iceberg' C-m
tmux send-keys 'nvim' C-m
tmux -2 attach-session -d
