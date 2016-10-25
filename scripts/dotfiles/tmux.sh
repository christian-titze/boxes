#!/bin/bash

# Do not run as root!

DIR_DOTFILES="~/.dotfiles"

if [ ! -d "${DIR_DOTFILES}" ] ; then
  git clone https://github.com/christian-titze/dotfiles ${DIR_DOTFILES}
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -risv ${DIR_DOTFILES}/tmux/tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
