#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title nix switch
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔄

# Documentation:
# @raycast.description Run `switch` for nix config
# @raycast.author nickwelsh
# @raycast.authorURL https://raycast.com/nickwelsh

export HOSTNAME=Nicks-MacBook-Pro
sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#$HOSTNAME