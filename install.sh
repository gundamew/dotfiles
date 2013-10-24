#!/usr/bin/env bash

if [ -d $HOME/dotfiles/bash ]; then
  ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
  ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
  ln -s $HOME/dotfiles/bash/bash_prompt $HOME/.bash_prompt
  ln -s $HOME/dotfiles/bash/bash_function $HOME/.bash_function
  ln -s $HOME/dotfiles/bash/bash_alias $HOME/.bash_alias
  ln -s $HOME/dotfiles/bash/screenrc $HOME/.screenrc
else
  echo 'The dotfiles should clone into your home directory.'
fi

if [ -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi
