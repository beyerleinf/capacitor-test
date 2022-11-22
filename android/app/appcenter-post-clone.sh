#!/usr/bin/env bash

# fail if any command fails
set -e
# debug log
set -x

# Required nodeJS version
NODE_VERSION=16.18.1

# workaround to override the v8 alias
npm config delete prefix
. ~/.bashrc
nvm install "$NODE_VERSION"
nvm alias node16 "$NODE_VERSION"
npm i -g yarn

# go to root of project
cd ../..

# install dependencies
yarn

# run optimized production build
npm run build -- --prod

# copy the web assets to the native projects and updates the native plugins and dependencies based in package.json
npx cap sync