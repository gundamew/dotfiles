#!/usr/bin/env bash
set -euo pipefail

# Rename original files
[[ -f ~/.bash_logout ]] && mv ~/.bash_logout ~/.bash_logout.orig
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.orig
[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.orig
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.orig

# Create symbolic links
ln -s ~/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/gitmessage ~/.gitmessage
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ackrc ~/.ackrc

# Initialize the submodules
git submodule update --init

# Install vim plugins
mkdir -p ~/.vim/autoload
ln -s ~/dotfiles/vim-plug/plug.vim ~/.vim/autoload/plug.vim
vim +PlugInstall +qall
