#!/bin/bash

# TODO
# - Install command line tools (brew, git, nvim, etc)
# - Install neovim python plugin

# install vim-plug
if ! test ~/.local/share/nvim/site/autoload/plug.vim ; then
  printf 'installing vim-plug... '
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'done'
else
  echo 'vim-plug alredy installed, continuing'
fi

function install () {
  rsync --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude "install.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
}

install
