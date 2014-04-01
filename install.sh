#!/usr/bin/env bash

# make symbolic links
if [ -d $HOME/dotfiles/bash ]; then

  # shell
  ln -s $HOME/dotfiles/bash/exports $HOME/.exports
  ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
  ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
  ln -s $HOME/dotfiles/bash/bash_prompt $HOME/.bash_prompt
  ln -s $HOME/dotfiles/bash/functions $HOME/.functions
  ln -s $HOME/dotfiles/bash/aliases $HOME/.aliases
  ln -s $HOME/dotfiles/bash/screenrc $HOME/.screenrc

  # vim
  ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
  ln -s $HOME/dotfiles/vim/vim/ $HOME/.vim
else
  echo 'The dotfiles should be cloned into your home directory.'
fi

# execute the profile
if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi

# install plugins of vim
cd $HOME/dotfiles/
git submodule update --init
vim +BundleInstall +qall
