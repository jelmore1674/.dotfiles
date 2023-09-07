# Verified Logged into 1Password
TMP=$(mktemp)
LOGGED_IN=$(op whoami 2>$TMP)
err=$(cat "$TMP")
LOGGED_IN=$(echo $err | rg "ERROR")

if [[ ! -z $LOGGED_IN ]]; then
	eval $(op signin)
fi

rm "$TMP"
