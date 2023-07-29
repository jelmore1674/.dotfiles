#!/usr/bin/env bash

languages=$(echo "javascript typescript rust bash git csharp react-native" | tr " " "\n")
core_utils=$(echo "alias awk chmod chown find grep less ln mv sed tail xargs" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "QUERY: " query

if echo "$languages" | grep -qs $selected; then
   tmux split-window -p 35 -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
   tmux split-window -p 35 -h bash -c "curl cht.sh/$selected~$(echo "$query" | tr " " "+") | less "
fi
