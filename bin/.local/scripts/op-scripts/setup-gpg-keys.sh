#!/usr/bin/env bash

# Verified Logged into 1Password
TMP=$(mktemp)
LOGGED_IN=$(op whoami 2>$TMP)
err=$(cat "$TMP")
LOGGED_IN=$(echo $err | rg "ERROR")

if [[ ! -z $LOGGED_IN ]]; then
	eval $(op signin)
fi

# get gpg keys from 1Password
echo "Getting GPG key from 1Password"
#op document get "pgp_keys" --out-file "$HOME/pgp_keys.zip"
op read --out-file "$HOME/pgp_keys.zip" "op://Private/pgp_keys/pgp_keys.zip"

echo "Unzipping keys"
unzip "$HOME/pgp_keys.zip" -d "$HOME"

echo "Importing keys"
gpg --import $HOME/pgp_keys/pgp-private.asc
gpg --import $HOME/pgp_keys/pgp-public.asc
gpg --import-ownertrust $HOME/pgp_keys/pgp-ownertrust.asc

echo "Cleaning up..."
rm -rf "$HOME/pgp_keys" "$HOME/pgp_keys.zip"
rm "$TMP"
