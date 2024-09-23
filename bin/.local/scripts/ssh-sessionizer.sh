#!/usr/bin/env bash

# Get the ssh host you want to ssh to
ssh_name=$(awk '$1 ~ /Host$/ {print $2}' <~/.ssh/config | fzf --reverse --tmux 80%)

# If a tmux session with the desired name does not already exist, create it in detached mode
if ! tmux has-session -t="$ssh_name" 2>/dev/null; then
  # create a new session
  tmux new-session -s "$ssh_name" -d "ssh $ssh_name"
fi

# Switch to the tmux session with the name derived from the selected directory
tmux switch-client -t "$ssh_name"
