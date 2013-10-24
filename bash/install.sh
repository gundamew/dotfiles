#!/usr/bin/env bash

if [ -d $HOME/dotfiles ]; then
  ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
  ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
  ln -s $HOME/dotfiles/bash/bash_function $HOME/.bash_function
  ln -s $HOME/dotfiles/bash/bash_alias $HOME/.bash_alias
else
  echo 'The dotfiles should clone into your home directory.'
fi
