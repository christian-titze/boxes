#!/bin/bash

# Do not run as root!

DIR_DOTFILES="~/.dotfiles"

if [ ! -d "${DIR_DOTFILES}" ] ; then
  git clone https://github.com/christian-titze/dotfiles ${DIR_DOTFILES}
fi
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -risv ${DIR_DOTFILES}/zsh/zshrc ~/.zshrc

sudo chsh -s $(which zsh) $(whoami)
