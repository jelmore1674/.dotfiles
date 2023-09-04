#!/usr/bin/env bash

node_version=$(cat package.json | rg "node" | sed 's/[^[:digit:]]\+//g')
node_modules=$(find . -maxdepth 1 -type d | grep "node_modules")
yarn=$(find . -maxdepth 1 -type f | grep "yarn.lock")
npm=$(find . -maxdepth 1 -type f | grep "package-lock.json")
pnpm=$(find . -maxdepth 1 -type f | grep "pnpm-lock.yaml")

# if node version is set
if [ ! -z "$node_version" ]; then
	n $node_version
fi

# determine whether yarn or npm is used
if [ ! -z "$yarn" ]; then
	yarn install
elif [ ! -z "$npm" ]; then
	npm install
elif [ ! -z "$pnpm" ]; then
	pnpm install
fi
