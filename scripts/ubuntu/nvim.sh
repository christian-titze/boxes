#!/bin/bash

add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim
apt-get install -y xauth xclip # For shared clipboard support.
