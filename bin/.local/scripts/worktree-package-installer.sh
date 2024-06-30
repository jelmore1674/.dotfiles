#!/usr/bin/env bash

node_version=$(rg "node" <package.json | sed 's/[^[:digit:]]\+//g')
# node_modules=$(find . -maxdepth 1 -type d | grep "node_modules")
yarn=$(find . -maxdepth 1 -type f | grep "yarn.lock")
npm=$(find . -maxdepth 1 -type f | grep "package-lock.json")
pnpm=$(find . -maxdepth 1 -type f | grep "pnpm-lock.yaml")

# if node version is set
if [ -n "$node_version" ]; then
  n "$node_version"
fi

# determine whether yarn or npm is used
if [ -n "$yarn" ]; then
  yarn install
elif [ -n "$npm" ]; then
  npm install
elif [ -n "$pnpm" ]; then
  pnpm install
fi
