#!/usr/bin/env bash

node_modules=$(find . -maxdepth 1 -type d | grep "node_modules")
yarn=$(find . -maxdepth 1 -type f | grep "yarn.lock")
npm=$(find . -maxdepth 1 -type f | grep "package-lock.json")
pnpm=$(find . -maxdepth 1 -type f | grep "pnpm-lock.yaml")

# determine whether yarn or npm is used
if [ ! -z "$yarn" ]; then
	yarn install
elif [ ! -z "$npm" ]; then
	npm install
elif [ ! -z "$pnpm" ]; then
	pnpm install
fi
