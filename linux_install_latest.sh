#!/usr/bin/env bash

export HOMEBREW_PREFIX="${HOME}/.homebrew"
export NONINTERACTIVE=1
mkdir -p "${HOMEBREW_PREFIX}"
wget -O install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
wget -O linux_fix.patch https://raw.githubusercontent.com/toshas/homebrew_install/HEAD/linux_fix.patch
patch -p1 < linux_fix.patch
/bin/bash install.sh
