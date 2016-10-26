#!/bin/bash

# Do not run as root!

DIR_DOTFILES=".dotfiles"

if [ ! -d "${DIR_DOTFILES}" ] ; then
  git clone https://github.com/christian-titze/dotfiles ${DIR_DOTFILES}
fi

# Link for NeoVim support.
mkdir -pv ~/.config/nvim/autoload
ln -risv ${DIR_DOTFILES}/nvim/init.vim .config/nvim/init.vim
ln -risv ${DIR_DOTFILES}/nvim/autoload/plug.vim .config/nvim/autoload/plug.vim

# Link for "legacy" vim support.
mkdir -pv ~/.vim
ln -risv ${DIR_DOTFILES}/nvim/init.vim .vim/vimrc
ln -risv ${DIR_DOTFILES}/nvim/init.vim .vimrc
ln -risv ~/.config/nvim/autoload .vim/autoload

# Automatically install plugins.
/usr/bin/vim +PlugInstall +qa > /dev/null
