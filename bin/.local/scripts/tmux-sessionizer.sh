#!/usr/bin/env bash

# Get the directory you wanna work from.
session=$(find ~ ~/dev -mindepth 1 -maxdepth 2 -type d | fzf --reverse)

# Shorten the name of the tmux session.
session_name=$(basename "$session" | tr . _)

# Print the tmux session.
echo "$session"

# This helps prevent nesting of tmux windows
if ! tmux has-session -t "$session_name" 2>/dev/null; then
	tmux new-session -s "$session_name" -c "$session" -d
fi

# Switch to the session.
tmux switch-client -t "$session_name"
