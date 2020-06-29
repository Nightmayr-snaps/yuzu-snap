#!/bin/bash

# check latest tagged version
LATEST_VERSION_TAG="$(curl https://api.github.com/repos/yuzu-emu/yuzu-mainline/releases/latest -s | jq .tag_name -r)"
CURRENT_VERSION_SNAP="$(grep version snap/snapcraft.yaml | cut -d ' ' -f2 | tr -d \"\'\")"
CURRENT_VERSION_TAG_SNAP=mainline-$CURRENT_VERSION_SNAP

# compare versions
if [ $CURRENT_VERSION_TAG_SNAP != $LATEST_VERSION_TAG ]; then
    echo "versions don't match, github: $LATEST_VERSION_TAG snap: $CURRENT_VERSION_TAG_SNAP"
    # replace version in yaml
else
    echo "versions match, github: $LATEST_VERSION_TAG snap: $CURRENT_VERSION_TAG_SNAP"
    # terminate workflow
fi


