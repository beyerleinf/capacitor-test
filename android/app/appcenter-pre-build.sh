#!/usr/bin/env bash

# fail if any command fails
set -e
# debug log
# set -x

# Required nodeJS version
NODE_VERSION=16.18.1

# workaround to override the v8 alias
npm config delete prefix
. ~/.bashrc
nvm install "$NODE_VERSION"
nvm alias node16 "$NODE_VERSION"

GitRev = $(git rev-parse --short HEAD)
VersionSuffix = "test"
Version = "1.$APPCENTER_BUILD_ID-$GitRev-$VersionSuffix"
VersionCode = $APPCENTER_BUILD_ID

printf "\n\
VERSION=$Version\n\
VERSION_CODE=$VersionCode\n\
" > version.properties

pwd
ls -lah
