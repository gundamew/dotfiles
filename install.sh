#!/usr/bin/env bash

if [ -d $HOME/dotfiles/bash ]; then
  ln -s $HOME/dotfiles/bash/exports $HOME/.exports
  ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
  ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
  ln -s $HOME/dotfiles/bash/bash_prompt $HOME/.bash_prompt
  ln -s $HOME/dotfiles/bash/functions $HOME/.functions
  ln -s $HOME/dotfiles/bash/aliases $HOME/.aliases
  ln -s $HOME/dotfiles/bash/screenrc $HOME/.screenrc
else
  echo 'The dotfiles should clone into your home directory.'
fi

if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi

ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/vim/vim/ $HOME/.vim
cd $HOME/dotfiles/
git submodule update --init
vim +BundleInstall +qall
