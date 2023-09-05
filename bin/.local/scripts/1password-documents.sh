#!/usr/bin/env bash

# Get document list for fuzzy find
DOCUMENT=$(op document list | awk 'NR>1 {print $2}' | fzf)

echo "Where do you wanna save this file?"

read DIR

# Download the file
op document get "$DOCUMENT" --out-file "$DIR"
