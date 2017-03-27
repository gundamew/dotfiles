#!/usr/bin/env bash

# Rename original files
[[ -f ~/.bash_logout ]] && mv ~/.bash_logout ~/.bash_logout.orig
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.orig
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.orig

# Create symbolic links
ln -s ~/dotfiles/bash-powerline/bash-powerline.sh ~/.bash-powerline.sh
ln -s ~/dotfiles/bash_logout ~/.bash_logout
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/vimrc ~/.vimrc

# Install vim plugins
mkdir -p ~/.vim/autoload
ln -s ~/dotfiles/vim-plug/plug.vim ~/.vim/autoload/plug.vim
git submodule update --init
vim +PlugInstall +qall
