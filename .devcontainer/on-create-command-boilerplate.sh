#!/bin/bash
set -ex

git config --global --add --bool push.autoSetupRemote true
git config --local core.symlinks true
