#!/bin/bash

add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim

# Many plugins need Python support.
./python.sh
pip install --upgrade neovim
pip3 install --upgrade neovim

# For shared clipboard support.
apt-get install -y xauth xclip
