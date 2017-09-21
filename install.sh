#!/bin/bash

function try_link() {
  if [ ! -f $2 ]; then
    ln -s $1 $2 && echo "symlinked $2"
  else
    echo "$2 already exists; continuing"
  fi
}

# Copy init.vim
try_link ~/dotfiles/init.vim ~/.config/nvim/init.vim

# Copy all ftplugin files
try_link ~/dotfiles/ftplugin ~/.config/nvim/ftplugin

# Copy .vimrc
try_link ~/dotfiles/vimrc ~/.vimrc
