#!/bin/bash

# TODO
# - Install command line tools (brew, git, nvim, etc)
# - Install neovim python plugin

function try_link() {
  if [ ! -f $2 ]; then
    ln -s $1 $2 && echo "symlinked $2"
  else
    echo "$2 already exists; continuing"
  fi
}

mkdir ~/.config

# install vim-plug
if ! test ~/.local/share/nvim/site/autoload/plug.vim ; then
  printf 'installing vim-plug... '
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'done'
else
  echo 'vim-plug alredy installed, continuing'
fi

# Copy nvim files
try_link ~/dotfiles/nvim ~/.config/nvim

# Copy .vimrc
try_link ~/dotfiles/vimrc ~/.vimrc

# copy fish files
try_link ~/dotfiles/fish ~/.config/fish
