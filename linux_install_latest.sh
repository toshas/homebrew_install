#!/usr/bin/env bash

wget https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
wget https://raw.githubusercontent.com/toshas/homebrew_install/HEAD/linux_fix.patch
patch -p1 < linux_fix.patch
/bin/bash install.sh
