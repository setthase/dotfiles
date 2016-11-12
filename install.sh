#!/bin/bash

# Get directory of current file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create a symbolic link in $HOME to this directory
ln -s $DIR $HOME/.dotfiles

# Create .config directory
mkdir -p $HOME/.config

# Install nvim configuration files
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

# Install ZSH configuration
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
