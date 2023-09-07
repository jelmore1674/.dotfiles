#!/usr/bin/env bash

# Output list to fuzzy find
ITEM=$(op item list | awk 'NR>1 {print $2}' | fzf)

# Get the found item
MATCH=$(op item get "$ITEM" | awk '/username|password/ {print $2}')

# Copy Username to the clipboard
read -p "Do you want to copy username to clipboard (y/n) " yn
case $yn in
y)
	echo $MATCH | tr ' ' '\n' | awk 'NR==1 {print $1}' | pbcopy
	echo "Copied username"
	sleep 3
	;;
n)
	echo
	;;
*)
	echo invalid response
	exit 1
	;;
esac

# Copy the password to the clipboard.
read -p "Do you want to copy password to clipboard (y/n) " yn
case $yn in
y)
	echo $MATCH | tr ' ' '\n' | awk 'NR==2 {print $1}' | pbcopy
	echo "Copied password"
	;;
n)
	echo
	exit
	;;
*)
	echo invalid response
	exit 1
	;;
esac
