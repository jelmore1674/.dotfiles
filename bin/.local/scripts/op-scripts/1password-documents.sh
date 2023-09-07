#!/usr/bin/env bash

TMP=$(mktemp)
LOGGED_IN=$(op whoami 2>$TMP)
err=$(cat "$TMP")
LOGGED_IN=$(echo $err | rg "ERROR")

if [[ ! -z $LOGGED_IN ]]; then
	echo "Signing in..."
	eval $(op signin)
fi

# Get document list for fuzzy find
DOCUMENT=$(op document list | awk 'NR>1 {print $2}' | fzf)

echo "Where do you wanna save this file?"

read DIR

# Download the file
op document get "$DOCUMENT" --out-file "$DIR"

rm "$TMP"
